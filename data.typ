// ─── Resume content ──────────────────────────────────────────────────────────
// All content is stored in data.yaml, which is the single source of truth.
// This file exposes named bindings for resume.typ to import.

#let _d = yaml("data.yaml")

#let basics                  = _d.basics
#let experience              = _d.experience
#let publications_preamble   = _d.publications_preamble
#let publications            = _d.publications
#let education               = _d.education
#let publications_page_break = _d.at("publications_page_break", default: false)

