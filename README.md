# murtazo.github.io

Source for the academic homepage of Murtazo Nazarov, Division of Scientific
Computing, Department of Information Technology, Uppsala University:
<https://murtazo.github.io>.

The site is built with [Jekyll](https://jekyllrb.com) and served by GitHub
Pages from the `master` branch. The theme started from
[al-folio](https://github.com/alshedivat/al-folio) (MIT licence, see `LICENSE`).

## Local preview

```bash
bundle install
bundle exec jekyll serve
```

## Content

| What | Where |
| --- | --- |
| Home, Research, Teaching, Group, Media pages | `_pages/` |
| Simulation gallery (Projects page) | `_data/simulations.yml`, `_projects/` |
| Publications | `_bibliography/papers.bib` → `bin/generate_publications` writes `_includes/publications.html` |
| Styles | `_sass/` |

After editing `_bibliography/papers.bib`, regenerate the publication list:

```bash
ruby bin/generate_publications
```

Pages that contain LaTeX need `math: true` in their front matter so that
MathJax is loaded.
