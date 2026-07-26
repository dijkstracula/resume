// ─── Resume entrypoint (Typst → PDF) ─────────────────────────────────────────
// Build:  typst compile resume.typ
// Output: resume.pdf
//
// For HTML output run:  python render.py
// (Both read from data.yaml as the single source of truth.)

#import "data.typ": basics, experience, publications_preamble, publications, education, publications_page_break
#import "components.typ": accent, ink, ink_soft, section_heading, experience_entry, publication_entry, education_entry

// ── page & global text settings ───────────────────────────────────────────────
#set page(
  paper:  "us-letter",
  margin: (x: 0.7in, y: 0.6in),
)

#set text(
  font:   ("Lato", "Liberation Sans", "DejaVu Sans"),
  size:   10pt,
  fill:   ink,
)

#set list(indent: 8pt, body-indent: 4pt)

// ── header ────────────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, auto),
  align:   (left + horizon, right + horizon),
  text(size: 22pt, weight: "semibold", tracking: -0.4pt)[#basics.name],
  {
    set text(size: 9.5pt, fill: ink_soft)
    stack(
      dir:     ttb,
      spacing: 3pt,
      link(basics.website)[#text(fill: accent)[#basics.website]],
      if "email" in basics and basics.email != none { basics.email },
    )
  },
)

v(6pt)

// ── Experience ────────────────────────────────────────────────────────────────
#section_heading("Experience")
#for e in experience [#experience_entry(e)]

// ── Explicit page break ───────────────────────────────────────────────────────
// Controlled by `publications_page_break` in data.yaml.  When true, forces
// Publications to always start at the top of a new page so minor edits don't
// shift pagination.
#if publications_page_break { pagebreak() }

// ── Selected Publications and Presentations ───────────────────────────────────
#section_heading("Selected Publications and Presentations")
#block(spacing: 4pt,
  pad(left: 16pt, text(size: 9.5pt, fill: ink_soft)[#publications_preamble])
)
#for p in publications [#publication_entry(p)]

// ── Education ─────────────────────────────────────────────────────────────────
#section_heading("Education")
#for e in education [#education_entry(e)]
