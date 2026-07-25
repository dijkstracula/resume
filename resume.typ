// ─── Resume entrypoint ────────────────────────────────────────────────────────
// Build: typst compile --features html resume.typ resume.html
// Output: resume.html

#import "data.typ": basics, experience, publications, publications-preamble, education
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
  // Left: name
  text(size: 22pt, weight: "semibold", tracking: -0.4pt)[#basics.name],
  // Right: contact block
  {
    set text(size: 9.5pt, fill: ink_soft)
    stack(
      dir:     ttb,
      spacing: 3pt,
      link(basics.website)[#text(fill: accent)[#basics.website]],
      if basics.email != none { basics.email },
    )
  },
)

v(6pt)

// ── Experience ────────────────────────────────────────────────────────────────
#section_heading("Experience")
#for e in experience [#experience_entry(e)]

// ── Explicit section break ────────────────────────────────────────────────────
// In an HTML build this is a visual separator; in a PDF build (drop
// --features html and change the output extension) it becomes a hard page
// break so Publications always starts at the top of a new page.
#pagebreak(weak: true)

// ── Selected Publications and Presentations ───────────────────────────────────
#section_heading("Selected Publications and Presentations")
#block(spacing: 4pt,
  pad(left: 16pt,
    text(size: 9.5pt, fill: ink_soft, publications-preamble)
  )
)
#for p in publications [#publication_entry(p)]

// ── Education ─────────────────────────────────────────────────────────────────
#section_heading("Education")
#for e in education [#education_entry(e)]
