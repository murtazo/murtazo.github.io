# frozen_string_literal: true

require "cgi"

module BibtexPublications
  SECTION_TITLES = {
    "articles" => "Journal articles and preprints",
    "proceedings" => "Conference proceedings",
    "popular" => "Popular science presentations",
    "theses" => "Thesis and dissertations",
    "reports" => "Technical reports"
  }.freeze

  LINK_FIELDS = [
    ["doi", "DOI"], ["url", "URL"], ["arxiv", "arXiv"]
  ].freeze

  CANONICAL_KEY_ALIASES = {
    "Muhamadiev2020_23" => "MR4130347",
    "Muhamadiev2014_43" => "MuhamadievNazarov2014",
    "Nazarov2017_47" => "CompHistory2017",
    "Hoffman2008_54" => "hoffman2008computational"
  }.freeze

  class Parser
    def self.read(path)
      source = File.read(path, encoding: "UTF-8")
      entries = []
      offset = 0

      while (match = source.match(/@(\w+)\s*\{\s*([^,]+),/m, offset))
        type = match[1].downcase
        key = match[2].strip
        body_start = match.end(0)
        depth = 1
        cursor = body_start

        while cursor < source.length && depth.positive?
          depth += 1 if source[cursor] == "{"
          depth -= 1 if source[cursor] == "}"
          cursor += 1
        end

        body = source[body_start...(cursor - 1)]
        entry = parse_entry(type, key, body)
        entry["raw_bibtex"] = source[match.begin(0)...cursor].strip
        entries << entry
        offset = cursor
      end

      entries
    end

    def self.parse_entry(type, key, body)
      entry = { "type" => type, "key" => key }
      cursor = 0

      while cursor < body.length
        match = body.match(/([A-Za-z][\w-]*)\s*=\s*/m, cursor)
        break unless match

        field = match[1].downcase
        cursor = match.end(0)
        value, cursor = read_value(body, cursor)
        entry[field] = value.strip
        cursor += 1 while cursor < body.length && body[cursor] =~ /[\s,]/
      end

      entry
    end

    def self.read_value(body, cursor)
      if body[cursor] == "{"
        start = cursor + 1
        depth = 1
        cursor += 1
        while cursor < body.length && depth.positive?
          depth += 1 if body[cursor] == "{"
          depth -= 1 if body[cursor] == "}"
          cursor += 1
        end
        [body[start...(cursor - 1)], cursor]
      elsif body[cursor] == '"'
        start = cursor + 1
        cursor += 1
        cursor += 1 while cursor < body.length && (body[cursor] != '"' || body[cursor - 1] == "\\")
        [body[start...cursor], cursor + 1]
      else
        match = body.match(/\A([^,\n}]+)/, cursor)
        [match ? match[1] : "", match ? match.end(0) : body.length]
      end
    end
  end

  class Renderer
    def render(path, canonical_path: nil)
      entries = Parser.read(path).sort_by { |entry| entry.fetch("order", "9999").to_i }
      validate!(entries, path)
      apply_canonical_bibtex!(entries, canonical_path) if canonical_path && File.exist?(canonical_path)

      output = ["<!-- Generated from _bibliography/papers.bib using canonical records from nazarov_references.bib; do not edit by hand. -->"]
      output << '<ol class="publications-list" reversed>'
      SECTION_TITLES.each do |section, title|
        selected = entries.select { |entry| entry["section"] == section }
        next if selected.empty?

        output << "<h33>#{title}</h33>"
        selected.each { |entry| output << render_entry(entry) }
      end
      output << "</ol>"
      output << render_dialog(entries)
      output.join("\n")
    end

    private

    def apply_canonical_bibtex!(entries, canonical_path)
      canonical_entries = Parser.read(canonical_path)
      by_key = canonical_entries.to_h { |entry| [entry["key"].downcase, entry] }
      by_title = canonical_entries.group_by { |entry| normalized_title(entry["title"]) }
      by_doi = canonical_entries.reject { |entry| normalized_doi(entry["doi"]).empty? }
                                .group_by { |entry| normalized_doi(entry["doi"]) }

      entries.each do |entry|
        doi = normalized_doi(entry["doi"])
        old_bib_key = entry["bib"].to_s.split("#").last.to_s.downcase
        alias_key = CANONICAL_KEY_ALIASES[entry["key"]].to_s.downcase
        canonical = (!doi.empty? && by_doi[doi]&.first) ||
                    by_key[old_bib_key] ||
                    by_key[alias_key] ||
                    by_title[normalized_title(entry["title"])]&.first
        entry["raw_bibtex"] = canonical["raw_bibtex"] if canonical
      end
    end

    def normalized_title(value)
      value.to_s.downcase.gsub(/[^a-z0-9]+/, "")
    end

    def normalized_doi(value)
      value.to_s.downcase
           .sub(%r{https?://(dx\.)?doi\.org/}, "")
           .gsub(/[^a-z0-9.\/]+/, "")
    end

    def validate!(entries, path)
      required = %w[key author title year section order]
      errors = entries.each_with_object([]) do |entry, items|
        missing = required.select { |field| entry[field].to_s.empty? }
        items << "#{entry['key'] || '(unknown key)'}: missing #{missing.join(', ')}" unless missing.empty?
        items << "#{entry['key']}: unknown section #{entry['section']}" unless SECTION_TITLES.key?(entry["section"])
      end
      raise "Invalid publication data in #{path}:\n#{errors.join("\n")}" unless errors.empty?
    end

    def render_entry(entry)
      links = LINK_FIELDS.each_with_object([]) do |(field, label), items|
        next if entry[field].nil? || entry[field].empty?
        items << %(<a href="#{CGI.escapeHTML(entry[field])}">#{label}</a>)
      end
      if entry["pdf"] && !entry["pdf"].empty?
        links << %(<a href="#{CGI.escapeHTML(entry['pdf'])}" target="_blank" rel="noopener">PDF</a>)
      end
      template_id = "bibtex-#{entry['key'].gsub(/[^A-Za-z0-9_-]/, '-') }"
      links << %(<button type="button" class="publication-bibtex-trigger" data-bibtex-id="#{template_id}" data-bibtex-title="#{CGI.escapeHTML(entry['title'])}">BibTeX</button>)
      links_html = links.empty? ? "" : " [#{links.join('&nbsp; | ')}&nbsp;]"
      publication_venue = entry["venue"] || entry["journal"] || entry["booktitle"]
      venue = publication_venue.to_s.empty? ? "" : " <journal>#{CGI.escapeHTML(publication_venue)}</journal>"
      volume = entry["volume"].to_s.empty? ? "" : " <b>#{CGI.escapeHTML(entry['volume'])}</b>"
      details = entry["details"].to_s.empty? ? "" : " #{CGI.escapeHTML(entry['details'])}"

      <<~HTML
        <li id="#{CGI.escapeHTML(entry['key'])}">
          <p>
            <author>#{CGI.escapeHTML(entry['author'])}</author>
            #{CGI.escapeHTML(entry['title'])}.<br>
            (#{entry['year']});#{venue}#{volume}#{details}#{links_html}
          </p>
        </li>
      HTML
    end

    def render_dialog(entries)
      templates = entries.map do |entry|
        template_id = "bibtex-#{entry['key'].gsub(/[^A-Za-z0-9_-]/, '-') }"
        bibtex = entry["raw_bibtex"].lines.map(&:rstrip).join("\n")
        %(<template id="#{template_id}">{% raw %}#{CGI.escapeHTML(bibtex)}{% endraw %}</template>)
      end

      <<~HTML
        <dialog class="publication-bibtex-dialog" id="publication-bibtex-dialog" aria-labelledby="publication-bibtex-title">
          <div class="publication-bibtex-header">
            <div>
              <span class="publication-bibtex-label">BibTeX reference</span>
              <h2 id="publication-bibtex-title">BibTeX reference</h2>
            </div>
            <button type="button" class="publication-bibtex-close" aria-label="Close BibTeX window">&times;</button>
          </div>
          <pre><code id="publication-bibtex-code"></code></pre>
          <div class="publication-bibtex-actions">
            <button type="button" class="publication-bibtex-copy">Copy BibTeX</button>
            <button type="button" class="publication-bibtex-done">Close</button>
          </div>
        </dialog>
        #{templates.join("\n")}
      HTML
    end
  end

  class Tag < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      path = File.join(site.source, "_bibliography", "papers.bib")
      canonical_path = File.join(site.source, "_bibliography", "nazarov_references.bib")
      Renderer.new.render(path, canonical_path: canonical_path)
    end
  end
end

Liquid::Template.register_tag("publications_bibliography", BibtexPublications::Tag)
