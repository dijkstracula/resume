#!/usr/bin/env python3
"""Render index.html from data.yaml.

Usage:
    python render.py              # writes index.html next to this script
    python render.py --check      # exits non-zero if index.html would change
"""

import argparse
import html
import re
import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    sys.exit("PyYAML is required: pip install pyyaml")

HERE = Path(__file__).parent


# ── Inline markup ──────────────────────────────────────────────────────────────

def markup(text: str) -> str:
    """Convert plain-text markup to safe HTML.

    Supported:
        *word*          → <em>word</em>
        [label](url)    → <a href="url">label</a>

    All other text is HTML-escaped first so we never produce XSS from data.
    """
    if not text:
        return ""
    # Split on the two markup forms using a regex that captures spans.
    parts = re.split(r"(\*[^*]+\*|\[[^\]]+\]\([^)]+\))", text)
    out = []
    for part in parts:
        if part.startswith("*") and part.endswith("*"):
            out.append(f"<em>{html.escape(part[1:-1])}</em>")
        elif part.startswith("["):
            m = re.fullmatch(r"\[([^\]]+)\]\(([^)]+)\)", part)
            if m:
                label, url = m.group(1), m.group(2)
                out.append(f'<a href="{html.escape(url)}">{html.escape(label)}</a>')
            else:
                out.append(html.escape(part))
        else:
            out.append(html.escape(part))
    return "".join(out)


# ── Section renderers ──────────────────────────────────────────────────────────

def render_header(basics: dict) -> str:
    name = html.escape(basics["name"])
    website = html.escape(basics.get("website", ""))
    email = basics.get("email")

    contact_lines = [f'<div><a href="{website}">{website}</a></div>']
    if email:
        contact_lines.append(f'<div>{html.escape(email)}</div>')
    else:
        # Preserve the contact image slot when no plain-text email is set.
        contact_lines.append('<img class="scale" src="contact.png" alt="email"/>')

    return (
        "<header>\n"
        f"    <h1>{name}</h1>\n"
        "    <div>\n"
        + "".join(f"        {line}\n" for line in contact_lines)
        + "    </div>\n"
        "</header>\n"
    )


def render_experience(entries: list) -> str:
    lines = ["<h2>Experience</h2>\n"]
    for e in entries:
        date = html.escape(e.get("date", ""))
        org = html.escape(e.get("org", ""))
        location = e.get("location")
        role = e.get("role")
        body = e.get("body")
        preamble = e.get("preamble")

        loc_html = f"<div class=\"location\">{html.escape(location)}</div>" if location else ""

        lines.append(
            '<div class="entry">\n'
            f'    <p class="date">{date}</p>\n'
            '    <div class="entry_body">\n'
            '        <div class="entry_header">\n'
            f'            <h3>{org}</h3>\n'
            + (f"            {loc_html}\n" if loc_html else "")
            + "        </div>\n"
        )
        if role:
            lines.append(f"        <span>{html.escape(role)}</span>\n")

        if body is not None:
            if isinstance(body, list):
                lines.append('        <div class="entry_details">\n')
                if preamble:
                    lines.append(f"            <p>{markup(preamble)}</p>\n")
                lines.append("            <ul>\n")
                for item in body:
                    lines.append(f"                <li>{markup(item)}</li>\n")
                lines.append("            </ul>\n")
                lines.append("        </div>\n")
            else:
                lines.append(
                    '        <div class="entry_details">\n'
                    f"            <p>{markup(body)}</p>\n"
                    "        </div>\n"
                )

        lines.append("    </div>\n</div>\n")
    return "".join(lines)


def render_venues(venues: list) -> str:
    parts = []
    for v in venues:
        label = html.escape(v.get("label", ""))
        url = v.get("url")
        if url:
            parts.append(f'<a href="{html.escape(url)}" target="_blank">{label}</a>')
        else:
            parts.append(label)
    return "| " + "\n              | ".join(parts) if parts else ""


def render_publications(entries: list, preamble: str, page_break: bool) -> str:
    h2_style = ' style="break-before: page"' if page_break else ""
    lines = [f'<h2{h2_style}>Selected Publications and Presentations</h2>\n']
    if preamble:
        lines.append(f'<p class="preamble">{markup(preamble)}</p>\n')
    for p in entries:
        date = html.escape(p.get("date", ""))
        title = html.escape(p.get("title", ""))
        venues = p.get("venues", [])
        venue_html = render_venues(venues)
        lines.append(
            '<div class="entry">\n'
            f'    <p class="date">{date}</p>\n'
            '    <div class="entry_body">\n'
            '        <div class="entry_header">\n'
            f'            <h3>{title}</h3>\n'
            + (
                '            <div class="entry_details">\n'
                f"                <span>{venue_html}</span>\n"
                "            </div>\n"
                if venue_html
                else ""
            )
            + "        </div>\n"
            "    </div>\n"
            "</div>\n"
        )
    return "".join(lines)


def render_education(entries: list) -> str:
    lines = ["<h2>Education</h2>\n"]
    for e in entries:
        date = html.escape(e.get("date", ""))
        org = html.escape(e.get("org", ""))
        location = e.get("location")
        degree = e.get("degree")
        supervisor = e.get("supervisor")
        body = e.get("body")

        loc_html = f"<span>{html.escape(location)}</span>" if location else ""

        degree_parts = []
        if degree:
            degree_parts.append(html.escape(degree))
        if supervisor:
            sup_name = html.escape(supervisor.get("name", ""))
            sup_url = supervisor.get("url")
            if sup_url:
                degree_parts.append(
                    f'Supervisor: <a href="{html.escape(sup_url)}">{sup_name}</a>'
                )
            else:
                degree_parts.append(f"Supervisor: {sup_name}")
        degree_html = " | ".join(degree_parts)

        lines.append(
            '<div class="entry">\n'
            f'    <p class="date">{date}</p>\n'
            '    <div class="entry_body">\n'
            '        <div class="entry_header">\n'
            f'            <h3>{org}</h3>\n'
            + (f"            {loc_html}\n" if loc_html else "")
            + "        </div>\n"
            + (f"        <span>{degree_html}</span>\n" if degree_html else "")
        )
        if body:
            lines.append(
                '        <div class="entry_details">\n'
                f"            <p>{markup(body)}</p>\n"
                "        </div>\n"
            )
        lines.append("    </div>\n</div>\n")
    return "".join(lines)


# ── Document assembly ──────────────────────────────────────────────────────────

def render(data: dict) -> str:
    basics = data.get("basics", {})
    experience = data.get("experience", [])
    pub_preamble = data.get("publications_preamble", "")
    publications = data.get("publications", [])
    education = data.get("education", [])
    pub_page_break = bool(data.get("publications_page_break", False))

    body = "\n".join([
        render_header(basics),
        render_experience(experience),
        render_publications(publications, pub_preamble, pub_page_break),
        render_education(education),
    ])

    return (
        "<!DOCTYPE html>\n"
        "<html>\n"
        "    <head>\n"
        '        <meta http-equiv="content-type" content="text/html; charset=utf-8" />\n'
        '        <link rel="stylesheet" type="text/css" href="style.css">\n'
        "    </head>\n"
        "    <body>\n"
        + "        "
        + body.replace("\n", "\n        ").rstrip("        ")
        + "    </body>\n"
        "</html>\n"
    )


# ── CLI ────────────────────────────────────────────────────────────────────────

def main() -> None:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument(
        "--check",
        action="store_true",
        help="Exit non-zero if index.html would change (useful in CI lint step).",
    )
    args = parser.parse_args()

    data_path = HERE / "data.yaml"
    out_path = HERE / "index.html"

    with data_path.open(encoding="utf-8") as f:
        data = yaml.safe_load(f)

    rendered = render(data)

    if args.check:
        current = out_path.read_text(encoding="utf-8") if out_path.exists() else ""
        if current != rendered:
            sys.exit(
                "index.html is out of date — run `python render.py` to regenerate."
            )
        print("index.html is up to date.")
        return

    out_path.write_text(rendered, encoding="utf-8")
    print(f"Wrote {out_path}")


if __name__ == "__main__":
    main()
