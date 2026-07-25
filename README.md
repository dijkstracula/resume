# Resume

Source for [ntaylor.ca](https://ntaylor.ca) — a data-driven resume built with
Typst and rendered to HTML.

## How it works

| File | Purpose |
|---|---|
| `data.yaml` | **Single source of truth** — edit this to update the resume |
| `render.py` | Generates `index.html` from `data.yaml` |
| `resume.typ` | Typst entrypoint — compiles `data.yaml` to PDF via Typst |
| `components.typ` | Reusable Typst rendering helpers |
| `data.typ` | Thin Typst wrapper that exposes `data.yaml` bindings |
| `style.css` | Stylesheet for the HTML output |

`index.html` is a **generated file** — edit `data.yaml`, not `index.html` directly.

## Building

### HTML (primary output)

```sh
pip install pyyaml
python render.py        # writes index.html
```

CI runs this automatically on every push that touches `data.yaml`,
`render.py`, `style.css`, or Typst source files, and also compiles a PDF
artifact (see [`.github/workflows/render.yml`](.github/workflows/render.yml)).

### PDF (optional, requires Typst)

Install [Typst](https://typst.app) (v0.11+), then:

```sh
typst compile resume.typ   # writes resume.pdf
```

The CI workflow also compiles `resume.pdf` and uploads it as an artifact on each
run.

The `publications_page_break` key in `data.yaml` controls where the forced page
break lands, keeping pagination deterministic regardless of content edits.

## Editing content

All resume content lives in `data.yaml`.  After editing, regenerate:

```sh
python render.py
```

To verify that `index.html` is in sync without writing it (useful as a local
pre-commit check):

```sh
python render.py --check
```

### Inline markup

Plain strings in `data.yaml` support two lightweight markup forms:

| Syntax | Result |
|---|---|
| `*word*` | *italic* |
| `[label](url)` | hyperlink |

### Email address

The `basics.email` field is `null` by default so the original `contact.png`
image (which obfuscates the address from scrapers) is preserved in the HTML
output.  To display a plain-text email instead, set the field in `data.yaml`:

```yaml
basics:
  email: you@example.com
```
