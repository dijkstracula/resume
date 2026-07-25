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

// ── inline markup ─────────────────────────────────────────────────────────────
// Converts a plain string from YAML into Typst content, supporting:
//   *word*          → italic
//   [label](url)    → hyperlink
#let render_markup(s) = {
  let result = []
  let chars = s.clusters()
  let n = chars.len()
  let buf = ""
  let i = 0

  while i < n {
    let c = chars.at(i)

    if c == "*" {
      // Scan forward for the closing *.
      let j = i + 1
      while j < n and chars.at(j) != "*" { j += 1 }
      if j < n {
        result += [#buf]
        buf = ""
        result += [#emph(chars.slice(i + 1, j).join(""))]
        i = j + 1
      } else {
        buf += c
        i += 1
      }

    } else if c == "[" {
      // Look ahead for the full [label](url) pattern.
      let j = i + 1
      while j < n and chars.at(j) != "]" { j += 1 }
      if j < n and (j + 1) < n and chars.at(j + 1) == "(" {
        let k = j + 2
        while k < n and chars.at(k) != ")" { k += 1 }
        if k < n {
          result += [#buf]
          buf = ""
          let label = chars.slice(i + 1, j).join("")
          let url   = chars.slice(j + 2, k).join("")
          result += link(url)[#label]
          i = k + 1
        } else {
          buf += c
          i += 1
        }
      } else {
        buf += c
        i += 1
      }

    } else {
      buf += c
      i += 1
    }
  }

  result += [#buf]
  result
}

// ── section heading ───────────────────────────────────────────────────────────
// Renders a bold section label with a full-width rule beneath it.
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
// Two-column grid: 55pt date column | 1fr content column.
#let entry(date, body) = {
  block(
    spacing:   4pt,
    breakable: false,
    grid(
      columns:       (55pt, 1fr),
      column-gutter: 4pt,
      date_text(date),
      body,
    )
  )
}

// ── experience entry ──────────────────────────────────────────────────────────
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
          list(..b.map(item => text(size: 9.5pt, render_markup(item))))
        )
      } else {
        block(spacing: 2pt, text(size: 9.5pt, b))
      }
    }
  }

  entry(e.date, body_content)
}

// ── publication entry ─────────────────────────────────────────────────────────
// venues: array of dicts with keys `label` (string) and optional `url` (string)
#let publication_entry(p) = {
  let venue_span = {
    for v in p.venues {
      [| ]
      if "url" in v and v.url != none {
        link(v.url)[#text(fill: accent, v.label)]
      } else {
        text(v.label)
      }
      [ ]
    }
  }

  let body_content = block(
    spacing: 1pt,
    grid(
      columns:       (1fr, auto),
      column-gutter: 6pt,
      org_text(p.title),
      align(right, text(size: 8.5pt, fill: ink_soft, venue_span)),
    )
  )

  entry(p.date, body_content)
}

// ── education entry ───────────────────────────────────────────────────────────
// degree: plain string; supervisor: optional dict with `name` and `url`
#let education_entry(e) = {
  let hdr = {
    org_text(e.org)
    if "location" in e and e.location != none {
      h(1fr)
      soft_text(e.location)
    }
  }

  let degree_line = {
    if "degree" in e and e.degree != none {
      e.degree
      if "supervisor" in e and e.supervisor != none {
        let sup = e.supervisor
        [ | Supervisor: ]
        if "url" in sup and sup.url != none {
          link(sup.url)[#text(fill: accent, sup.name)]
        } else {
          sup.name
        }
      }
    }
  }

  let body_content = {
    block(spacing: 1pt)[#grid(columns: (1fr, auto), hdr)]
    if "degree" in e and e.degree != none {
      block(spacing: 1pt, soft_text(degree_line))
    }
    if "body" in e and e.body != none {
      block(spacing: 2pt, text(size: 9.5pt, e.body))
    }
  }

  entry(e.date, body_content)
}
