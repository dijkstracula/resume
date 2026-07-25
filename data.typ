// ─── Resume content ──────────────────────────────────────────────────────────
// All editable content lives here; resume.typ / components.typ contain only
// layout logic.

#let basics = (
  name:    "Nathan Taylor",
  website: "https://ntaylor.ca",
  // The rendered PDF is not scraped like HTML, so you can put your email
  // address here directly, e.g.:  email: "you@example.com"
  // Leave as none to omit it from the header.
  email:   none,
)

// Each experience entry:
//   date     – date string shown in the narrow left column
//   org      – employer / institution name
//   location – optional location string (right-aligned in header row)
//   role     – optional job-title line shown beneath the org name
//   body     – content; a string OR an array of strings rendered as a bullet list
#let experience = (
  (
    date:     "2025–curr.",
    org:      "Semgrep",
    location: "Seattle, WA",
    role:     "Staff Software Engineer, Program Analysis",
    body:     "Performance lead for Semgrep's static analysis engine, improving median
               and tail scan times by 3× and reducing the MCP server's latency by over
               4×. Led the migration to Multicore OCaml, enabling fine-grain parallelism
               improvements. Maintained Semgrep's forked OCaml compiler.",
  ),
  (
    date:     "2021–2025",
    org:      "The University of Texas",
    location: "Austin, TX",
    role:     "Graduate Research Assistant, Department of Computer Science",
    body:     "Researched systems applications of lightweight formal methods. Verified
               crash consistency of a persistent memory filesystem. Mechanised validating
               an optimised Paxos implementation against its formal spec.",
  ),
  (
    date:     "2019–2021",
    org:      "Independent Consultant",
    location: none,
    role:     none,
    body:     (
      [At #emph[Microsoft Research], contributed to a research storage engine that
       combined low-latency ML and dynamic analysis to optimise index structure layout.
       Reduced critical-path latency by 40%. Mentored PhD interns.],
      [At #emph[RLCore Technologies], built reliable and safe systems for reinforcement
       learning-driven industrial control systems. Implemented property-based testing
       and record/replay debugging frameworks for RL agents.],
      [At #emph[The University of Toronto] and #emph[MacEwan University], developed
       and taught undergrad CS courses.],
    ),
    preamble: "Took a break from corporate life to teach, read research papers, and
               help out on interesting problems:",
  ),
  (
    date:     "2018–2019",
    org:      "Apple",
    location: "Cupertino, CA",
    role:     "Systems Software Engineer",
    body:     "Developed high-performance GPU simulators modeling in-development SoCs,
               reproducing functional behaviour at interactive framerates, allowing
               developers to start programming before tapeout.",
  ),
  (
    date:     "2017–2018",
    org:      "Fauna",
    location: "San Francisco, CA",
    role:     "Senior Software Engineer",
    body:     "Developed Fauna's strongly consistent, distributed database. Built a
               greybox fault injection tester to verify safety properties and maintain
               development velocity. Mentored engineers new to Scala and JVM concurrency.",
  ),
  (
    date:     "2014–2017",
    org:      "Fastly",
    location: "San Francisco, CA",
    role:     "Senior Software Engineer",
    body:     "Maintained Fastly's reverse HTTP proxy and cache. Led development of a
               sandboxing dynamic analysis runtime for the Fastly software stack, atop
               which the compiler, API, and security teams built custom analyzers.",
  ),
  (
    date:     "2012–2014",
    org:      "Twitter",
    location: "San Francisco, CA",
    role:     "Software Engineer II",
    body:     "Extended Twitter's Ruby and Java runtimes, improving the GC, JIT, and
               perf analysis tooling. Collaborated with service owners to diagnose
               performance issues. Maintained systems for antispam classification and
               actioning.",
  ),
)

// Publications preamble text (shown beneath the section heading).
#let publications-preamble = [
  I also maintain a #link("https://ntaylor.ca/blog/")[blog] about formal methods,
  programming languages, and low-level & concurrent systems.
]

// Each publication entry:
//   date    – date string (MM.YYYY or similar)
//   title   – paper / talk / post title
//   venues  – array of (label, url) pairs; url may be none for plain text labels
#let publications = (
  (
    date:   "09.2024",
    title:  "An Invitation to Liquid Types",
    venues: (
      ("Papers We Love NYC", "https://www.meetup.com/papers-we-love/events/302943607/"),
      ("Video",              "https://www.youtube.com/watch?v=C5PuBeiWaSA"),
    ),
  ),
  (
    date:   "07.2024",
    title:  "SquirrelFS: Using the Rust Compiler to Check Filesystem Crash Consistency",
    venues: (
      ("OSDI '24", none),
      ("PDF",      "https://www.usenix.org/conference/osdi24/presentation/leblanc"),
    ),
  ),
  (
    date:   "05.2018",
    title:  "The Life of a FaunaDB Query",
    venues: (
      ("Guest post on the Fauna blog",
       "https://web.archive.org/web/20180504210202/https://blog.fauna.com/the-life-of-a-faunadb-query"),
    ),
  ),
  (
    date:   "11.2016",
    title:  "Hands-on HTTP/2, a Fresh Start to The Web",
    venues: (
      ("QCon SF", "https://qconsf.com/sf2016/workshop/http2-workshop"),
    ),
  ),
  (
    date:   "06.2016",
    title:  "Beyond Breakpoints: A Tour Of Dynamic Analysis",
    venues: (
      ("QCon NYC",  "https://www.infoq.com/presentations/dynamic-analysis-tools"),
      ("Materials", "https://github.com/dijkstracula/QConNYC2016/"),
    ),
  ),
  (
    date:   "12.2015",
    title:  "Two Approaches Towards OS Scalability",
    venues: (
      ("Papers We Love SF", "http://www.meetup.com/papers-we-love-too/events/224178870/"),
      ("Video",             "https://www.youtube.com/watch?v=kaig7CL4-KU"),
    ),
  ),
  (
    date:   "09.2015",
    title:  "Racing to Win: Correct Concurrency with Race Conditions",
    venues: (
      ("Surge '15", "https://github.com/dijkstracula/Surge2015"),
      ("Video",     "https://www.youtube.com/watch?v=WaU_w7V_OqE"),
    ),
  ),
  (
    date:   "04.2015",
    title:  "Your Computer Is Already A Distributed System; Why Isn't Your OS?",
    venues: (
      ("Papers We Love SF", "http://www.meetup.com/papers-we-love-too/events/212148242/"),
      ("Video",             "https://www.youtube.com/watch?v=A22wSN9WEpg&t=56s"),
    ),
  ),
  (
    date:   "06.2014",
    title:  "Your Heap And You: Garbage Collector Tuning for Twitter Services",
    venues: (
      ("Internal tech talk", none),
    ),
  ),
  (
    date:   "05.2013",
    title:  "Cachekata: Memory Hierarchy Optimization via Dynamic Binary Translation",
    venues: (
      ("M.Sc. Thesis", none),
      ("PDF",          "https://circle.ubc.ca/handle/2429/44335"),
    ),
  ),
  (
    date:   "04.2013",
    title:  "Whose Cache Line is it Anyway: OS Support for Detection & Repair of False Sharing",
    venues: (
      ("Eurosys '13", none),
      ("PDF",         "https://www.cs.ubc.ca/~mihirn/papers/plastic-eurosys.pdf"),
    ),
  ),
  (
    date:   "03.2012",
    title:  "Debugging Through Time with the Tralfamadore Debugger",
    venues: (
      ("RESolVE '12", none),
      ("PDF",         "http://www.dcs.gla.ac.uk/conferences/resolve12/papers/session4_paper1.pdf"),
    ),
  ),
  (
    date:   "08.2011",
    title:  "Herbert West: Deanonymizer",
    venues: (
      ("HotSec '11", none),
      ("PDF",        "https://www.usenix.org/legacy/event/hotsec11/tech/final_files/Nanavati.pdf"),
    ),
  ),
  (
    date:   "10.2010",
    title:  "Iodine: Interactive Program Partitioning",
    venues: (
      ("OSDI '10 Poster Session", none),
    ),
  ),
)

// Each education entry:
//   date      – date range string
//   org       – institution name
//   location  – optional location string
//   degree    – degree / credential line (may include inline links as content)
//   body      – optional descriptive paragraph text
#let education = (
  (
    date:     "2021–2024",
    org:      "The University of Texas",
    location: "Austin, TX",
    degree:   [PhD, Computer Science (incomplete)
               | Supervisor: #link("https://www.jamesbornholt.com")[James Bornholt]],
    body:     "Organised the Systems+PL and the undergraduate systems reading groups.
               Applied Scientist intern in the Automated Reasoning & Database Services
               groups at AWS, working on distributed system model checking.",
  ),
  (
    date:     "2009–2012",
    org:      "The University of British Columbia",
    location: "Vancouver, BC, Canada",
    degree:   [M.Sc., Computer Science
               | Supervisor: #link("http://www.cs.ubc.ca/~andy/")[Andy Warfield]],
    body:     "President of the CS Graduate Students' Association. Led department TA
               training. Appointed to the UBC Graduate Council. Organized the systems
               lab reading seminar. Service award recipient for my work supporting
               CPSC 110.",
  ),
  (
    date:     "2005–2009",
    org:      "The University of Alberta",
    location: "Edmonton, AB, Canada",
    degree:   [B.Sc. Specialization, Computing Science],
    body:     "Undergraduate Association of CS board member. Chemistry domain expert
               for the 2008 Cluster Challenge team. Summer internship at Alberta Machine
               Intelligence Institute (AICML), working on ML for adaptive user
               interfaces.",
  ),
)
