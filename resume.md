---
title: Nathan Taylor
website: "https://ntaylor.ca"
contact: "nathan@ntaylor.ca"
---

# Nathan Taylor

<div class="header-contact">
<a href="https://ntaylor.ca">https://ntaylor.ca</a>
</div>

## Experience

**2025–curr.** | **Semgrep** — Staff Software Engineer, Program Analysis | *Seattle, WA*

Performance lead for Semgrep's static analysis engine. Led the migration to Multicore OCaml, enabling fine-grained parallelism opportunities. Maintained Semgrep's OCaml compiler fork, comprised of backported fixes and custom improvements. In aggregate, improved p95 scan performance by over 3x.

---

**2021–2025** | **The University of Texas** — Graduate Research Assistant, Department of Computer Science | *Austin, TX*

Researched lightweight formal methods, which trade completeness guarantees for applicability, for validation of systems software. Verified crash consistency of a persistent memory filesystem, and mechanised the validation of a modern, optimised Paxos implementation against its human-written correctness proof.

---

**2019–2021** | **Independent Consultant**

Took a break from corporate life to teach, read research papers, and consult on interesting problems:

- At *Microsoft Research*, co-designed and developed an experimental storage engine that combines machine learning and dynamic analysis to optimise index structures. Reduced critical-path inference latency by 40%. Mentored PhD interns.
- At *RLCore Technologies*, built reliable and safe systems for reinforcement learning-driven industrial control systems. Implemented property-based testing and record/replay debugging libraries for RL agents.
- At *The University of Toronto* and *MacEwan University*, taught undergraduate PL and systems courses. Re-developed MacEwan's computer systems course stream, which have been adopted by other instructors.

---

**2018–2019** | **Apple** — Systems Software Engineer | *Cupertino, CA*

Developed a high-performance GPU emulator modelling in-development SoCs for power-constrained devices. Trading cycle-accuracy for usability, it reproduced functional behaviour with high fidelity and at interactive framerates, allowing developers to start programming before tapeout. Revived the dormant company-wide systems paper reading group.

---

**2017–2018** | **Fauna** — Senior Software Engineer | *San Francisco, CA*

Developed Fauna's strongly consistent, distributed document store. Built a greybox fault injection framework with associated DSL to state correctness invariants, catch safety violations early, and maintain development velocity. Mentored engineers new to Scala, JVM concurrency, and strongly-typed functional programming.

---

**2014–2017** | **Fastly** — Senior Software Engineer | *San Francisco, CA*

Maintained Fastly's reverse HTTP proxy and cache. Designed and built a sandboxing dynamic analysis runtime for the Fastly software stack, atop which the compiler, API, and security teams built custom analyzers.

---

**2012–2014** | **Twitter** — Software Engineer II | *San Francisco, CA*

Extended Twitter's Ruby and Java runtimes, improving garbage collection, JIT compilation, and performance analysis tooling. Collaborated with external teams to diagnose performance issues with their services. Revamped legacy systems and implemented new services for spam classification and actioning.

## Education

**2021–2024** | **The University of Texas** — PhD, Computer Science (incomplete) | Supervisor: [James Bornholt](https://www.jamesbornholt.com) | *Austin, TX*

Organised the Systems+PL reading group and mentored undergraduates attending the systems directed reading group. Interned as an Applied Scientist in the Automated Reasoning and Database Services groups at AWS, working on at-runtime model checking of distributed systems.

---

**2009–2012** | **The University of British Columbia** — M.Sc., Computer Science | Supervisor: [Andy Warfield](http://www.cs.ubc.ca/~andy/) | *Vancouver, BC, Canada*

As President of the CS Graduate Students' Association, liaised with students and UBC, led TA training sessions, organised social activities such as Tuesday Tea and the Undistinguished Lecture Series, and served on the UBC Grad Council. Ran the systems and security reading seminars. Received a TA award for my work supporting CPSC 110.

---

**2005–2009** | **The University of Alberta** — B.Sc. Specialization, Computing Science | *Edmonton, AB, Canada*

As an Undergraduate Association of Computing Science executive, interfaced with groups outside the department and advocated for students' issues within. As a member of the U of A's Cluster Challenge Team, configured and managed the GAMESS quantum chemistry package, and was the team's chemistry domain expert.

## Selected Publications and Presentations

I also maintain a [blog](https://ntaylor.ca/blog/) about formal methods, programming language theory, and low-level and concurrent systems.

| Date | Title | Venue |
|------|-------|-------|
| 09.2024 | **An Invitation to Liquid Types** | [Papers We Love NYC](https://www.meetup.com/papers-we-love/events/302943607/) \| [Video](https://www.youtube.com/watch?v=C5PuBeiWaSA) |
| 07.2024 | **SquirrelFS: Using the Rust Compiler to Check Filesystem Crash Consistency** | OSDI '24 \| [PDF](https://www.usenix.org/conference/osdi24/presentation/leblanc) |
| 05.2018 | **The Life of a FaunaDB Query** | Guest [post](https://web.archive.org/web/20180504210202/https://blog.fauna.com/the-life-of-a-faunadb-query) on the Fauna blog |
| 11.2016 | **Hands-on HTTP/2, a Fresh Start to The Web** | [QCon SF](https://qconsf.com/sf2016/workshop/http2-workshop) |
| 06.2016 | **Beyond Breakpoints: A Tour Of Dynamic Analysis** | [QCon NYC](https://www.infoq.com/presentations/dynamic-analysis-tools) \| [Materials](https://github.com/dijkstracula/QConNYC2016/) |
| 12.2015 | **Two Approaches Towards OS Scalability** | [Papers We Love SF](http://www.meetup.com/papers-we-love-too/events/224178870/) \| [Video](https://www.youtube.com/watch?v=kaig7CL4-KU) |
| 09.2015 | **Racing to Win: Correct Concurrency with Race Conditions** | [Surge '15](https://github.com/dijkstracula/Surge2015) \| [Video](https://www.youtube.com/watch?v=WaU_w7V_OqE) |
| 04.2015 | **Your Computer Is Already A Distributed System; Why Isn't Your OS?** | [Papers We Love SF](http://www.meetup.com/papers-we-love-too/events/212148242/) \| [Video](https://www.youtube.com/watch?v=A22wSN9WEpg&t=56s) |
| 06.2014 | **Your Heap And You: Garbage Collector Tuning for Twitter Services** | Internal tech talk |
| 05.2013 | **Cachekata: Memory Hierarchy Optimization via Dynamic Binary Translation** | M.Sc. Thesis \| [PDF](https://circle.ubc.ca/handle/2429/44335) |
| 04.2013 | **Whose Cache Line is it Anyway: OS Support for Live Detection & Repair of False Sharing** | EuroSys '13 \| [PDF](https://www.cs.ubc.ca/~mihirn/papers/plastic-eurosys.pdf) |
| 03.2012 | **Debugging Through Time with the Tralfamadore Debugger** | RESolVE '12 \| [PDF](http://www.dcs.gla.ac.uk/conferences/resolve12/papers/session4_paper1.pdf) |
| 08.2011 | **Herbert West: Deanonymizer** | HotSec'11 \| [PDF](https://www.usenix.org/legacy/event/hotsec11/tech/final_files/Nanavati.pdf) |
| 10.2010 | **Iodine: Interactive Program Partitioning** | OSDI '10 Poster Session |
