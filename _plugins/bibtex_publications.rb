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
    ["doi", "DOI"], ["url", "URL"], ["arxiv", "arXiv"],
    ["pdf", "PDF"], ["bib", "bib"]
  ].freeze

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
        entries << parse_entry(type, key, body)
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
    def render(path)
      entries = Parser.read(path).sort_by { |entry| entry.fetch("order", "9999").to_i }
      validate!(entries, path)

      output = ["<!-- Generated from _bibliography/papers.bib; do not edit by hand. -->"]
      output << '<ol class="publications-list" reversed>'
      SECTION_TITLES.each do |section, title|
        selected = entries.select { |entry| entry["section"] == section }
        next if selected.empty?

        output << "<h33>#{title}</h33>"
        selected.each { |entry| output << render_entry(entry) }
      end
      output << "</ol>"
      output.join("\n")
    end

    private

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
      links_html = links.empty? ? "" : " [#{links.join('&nbsp; | ')}&nbsp;]"
      venue = entry["venue"].to_s.empty? ? "" : " <journal>#{CGI.escapeHTML(entry['venue'])}</journal>"
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
  end

  class Tag < Liquid::Tag
    def render(context)
      site = context.registers[:site]
      path = File.join(site.source, "_bibliography", "papers.bib")
      Renderer.new.render(path)
    end
  end
end

Liquid::Template.register_tag("publications_bibliography", BibtexPublications::Tag)
