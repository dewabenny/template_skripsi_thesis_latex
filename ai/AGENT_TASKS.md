# AGENT_TASKS.md

# Indonesian Academic LaTeX Framework
## Refactoring & Improvement Roadmap

---

# Objective

Refactor this repository into a production-ready, reusable, open-source academic LaTeX framework for Indonesian universities.

The repository should support:

- Proposal
- Undergraduate Thesis
- Master Thesis
- Dissertation
- Academic Book

Maintain backward compatibility whenever possible.

---

# Global Requirements

- Keep code clean and modular.
- Avoid duplicated configuration.
- Preserve existing document appearance unless improvements are explicitly requested.
- Maintain compatibility with LuaLaTeX + Biber.
- Every refactoring must update documentation.
- Every completed task should result in a Git commit.

---

# Priority 1
## Repository Structure

### Task 1

Review repository structure.

Expected result

- consistent folder naming
- remove unused files
- simplify hierarchy

Deliverables

- updated tree
- README updated

---

### Task 2

Improve README.

README should contain

- Project overview
- Features
- Installation
- Quick Start
- Build
- Repository structure
- Screenshots
- Roadmap
- Contributing
- License

---

### Task 3

Generate preview images.

Create

/docs/images/

including

- Cover
- TOC
- Chapter
- Figure
- Table
- Bibliography

---

# Priority 2
## Configuration Refactoring

Current configuration

settings.tex

is becoming too large.

Split into modules.

Expected structure

setting/

    chapter.tex

    section.tex

    spacing.tex

    caption.tex

    toc.tex

    bibliography.tex

    numbering.tex

    hyperlink.tex

    typography.tex

Main settings.tex should only import modules.

---

### Metadata

Generalize metadata.

Replace hardcoded values with

docTitle

docAuthor

docFaculty

docUniversity

docDepartment

docProgram

docSupervisor

docLogo

docYear

All components should read metadata from one source.

---

# Priority 3
## Cover

Current cover is functional.

Improve into reusable template.

Requirements

- configurable logo
- configurable title
- configurable institution
- automatic spacing
- support proposal/thesis/dissertation

Future API

\makecover

instead of manually inputting cover.tex

---

# Priority 4
## Chapters

Use

\include

instead of

\input

for chapter files.

Support

\includeonly

for fast compilation.

---

# Priority 5
## Commands

Expand command.tex

Introduce reusable commands

\Figure

\Table

\Equation

\Appendix

\Source

Avoid repeated formatting.

---

# Priority 6
## Themes

Introduce

themes/

classic

modern

minimal

book

User should be able to select

\usetheme{classic}

---

# Priority 7
## Documentation

Create

docs/

using Markdown.

Documentation should include

- installation
- architecture
- packages
- settings
- metadata
- bibliography
- troubleshooting
- FAQ

---

# Priority 8
## Build System

Improve Makefile.

Add

make pdf

make watch

make clean

make release

make lint

Support latexmk.

---

# Priority 9
## GitHub

Improve repository.

Add

GitHub Actions

Automatically

- compile PDF
- upload artifacts
- generate release assets

---

# Priority 10
## Examples

Create

examples/

proposal

thesis

dissertation

book

Each example should compile successfully.

---

# Priority 11
## Documentation Website

Create

MkDocs Material

Documentation website.

Include

search

navigation

diagrams

examples

API reference

---

# Priority 12
## Class File

Long-term objective

Convert current template into

academic-id.cls

User should only write

\documentclass{academic-id}

instead of manually importing multiple files.

---

# Future Vision

Transform this repository into

Indonesian Academic LaTeX Framework

rather than only a thesis template.

Support

- universities
- hospitals
- journals
- academic books
- fellowship reports

with reusable architecture.
