// ─── Reusable rendering components ───────────────────────────────────────────

// ── colour tokens ────────────────────────────────────────────────────────────
#let ink       = rgb("#1a1a1a")
#let ink_soft  = rgb("#555555")
#let ink_faint = rgb("#888888")
#let rule_clr  = rgb("#dddddd")
#let accent    = rgb("#2548b8")

// ── type helpers ─────────────────────────────────────────────────────────────
#let date_text(content) = text(
  font:   ("Liberation Mono", "DejaVu Sans Mono"),
  size:   8.5pt,
  fill:   ink_faint,
  content,
)

#let soft_text(content) = text(size: 9.5pt, fill: ink_soft, content)
#let org_text(content)  = text(weight: "semibold", content)

// ── section heading ───────────────────────────────────────────────────────────
// Renders a bold section label with a full-width rule beneath it, mimicking
// the <h2> style in the HTML source.
#let section_heading(title) = {
  v(10pt, weak: true)
  block(width: 100%, spacing: 0pt)[
    #text(weight: "semibold", size: 10.5pt)[#title]
    #v(1pt, weak: true)
    #line(length: 100%, stroke: 0.4pt + rule_clr)
  ]
  v(4pt, weak: true)
}

// ── entry grid ────────────────────────────────────────────────────────────────
// Lays out a single resume entry as a two-column grid:
//   column 1 (55pt) – date string in monospace faint ink
//   column 2 (1fr)  – arbitrary content block
#let entry(date, body) = {
  block(
    spacing:   4pt,
    breakable: false,
    grid(
      columns:      (55pt, 1fr),
      column-gutter: 4pt,
      date_text(date),
      body,
    )
  )
}

// ── experience entry ──────────────────────────────────────────────────────────
// Renders one experience block from data.typ's `experience` array.
#let experience_entry(e) = {
  let hdr = {
    org_text(e.org)
    if "location" in e and e.location != none {
      h(1fr)
      soft_text(e.location)
    }
  }

  let body_content = {
    block(spacing: 1pt)[#grid(columns: (1fr, auto), hdr)]
    if "role" in e and e.role != none {
      block(spacing: 1pt, soft_text(e.role))
    }
    if "body" in e and e.body != none {
      let b = e.body
      if type(b) == array {
        if "preamble" in e and e.preamble != none {
          block(spacing: 2pt, text(size: 9.5pt, e.preamble))
        }
        block(spacing: 2pt,
          list(..b.map(item => text(size: 9.5pt, item)))
        )
      } else {
        block(spacing: 2pt, text(size: 9.5pt, b))
      }
    }
  }

  entry(e.date, body_content)
}

// ── publication entry ─────────────────────────────────────────────────────────
// Renders a publication / talk entry.  Venue links are formatted as
// "| label" segments, linked when a URL is provided.
#let publication_entry(p) = {
  let venue_span = {
    for v in p.venues {
      let (label, url) = v
      [| ]
      if url != none {
        link(url)[#text(fill: accent, label)]
      } else {
        text(label)
      }
      [ ]
    }
  }

  let body_content = block(
    spacing: 1pt,
    grid(
      columns:      (1fr, auto),
      column-gutter: 6pt,
      org_text(p.title),
      align(right, text(size: 8.5pt, fill: ink_soft, venue_span)),
    )
  )

  entry(p.date, body_content)
}

// ── education entry ───────────────────────────────────────────────────────────
#let education_entry(e) = {
  let hdr = {
    org_text(e.org)
    if "location" in e and e.location != none {
      h(1fr)
      soft_text(e.location)
    }
  }

  let body_content = {
    block(spacing: 1pt)[#grid(columns: (1fr, auto), hdr)]
    if "degree" in e and e.degree != none {
      block(spacing: 1pt, soft_text(e.degree))
    }
    if "body" in e and e.body != none {
      block(spacing: 2pt, text(size: 9.5pt, e.body))
    }
  }

  entry(e.date, body_content)
}
