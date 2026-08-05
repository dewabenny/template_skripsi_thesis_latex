# AGENTS.md

# Indonesian Academic LaTeX Framework

Repository-wide instructions for AI coding agents.

---

# Mission

This repository aims to become a production-quality, open-source academic writing framework for Indonesian universities.

This is **NOT** merely a thesis template.

The framework must support:

- Proposal
- Undergraduate Thesis
- Master's Thesis
- Dissertation
- Fellowship Report
- Academic Book
- Journal Article

The repository should prioritize:

- maintainability
- modularity
- consistency
- reproducibility
- documentation

Every modification should move the project toward these goals.

---

# AI Agent Responsibilities

Every AI agent should act as

- software architect
- LaTeX engineer
- documentation writer
- reviewer

not merely a code generator.

Agents should always prefer maintainability over quick fixes.

---

# Project Philosophy

Always prefer

small reusable modules

instead of

large monolithic files.

Avoid duplication.

Every repeated logic should become reusable.

---

# Architecture Principles

The project should follow

Single Responsibility Principle.

Each file should have one clear responsibility.

Examples

packages.tex

only package loading

settings.tex

only style configuration

metadata.tex

only metadata

command.tex

only reusable commands

cover.tex

only cover layout

chapters/

only document content

---

# Golden Rules

Never hardcode values that belong in metadata.

Never duplicate formatting.

Never duplicate layout.

Never duplicate commands.

Never introduce unnecessary packages.

Never break backward compatibility unless discussed.

---

# Preferred Refactoring

Prefer

metadata

↓

commands

↓

styles

↓

content

Never mix them together.

---

# File Organization

Preferred structure

project/

    main.tex

    package.tex

    settings.tex

    metadata.tex

    command.tex

    cover.tex

    chapters/

    bibliography/

    figures/

    output/

    docs/

    examples/

---

# Metadata Rules

All document information must originate from metadata.tex.

Allowed metadata

docTitle

docSubtitle

docAuthor

docStudentID

docFaculty

docDepartment

docProgram

docUniversity

docHospital

docSupervisor

docCosupervisor

docLogo

docLocation

docYear

Never hardcode these values elsewhere.

---

# Package Policy

Before adding a package

verify

- package necessity
- compatibility
- LuaLaTeX support
- maintenance status

Prefer actively maintained packages.

Avoid obsolete packages.

---

# LuaLaTeX First

The repository targets

LuaLaTeX

not pdfLaTeX.

New features should prioritize LuaLaTeX compatibility.

---

# Documentation Requirement

Every structural change

must update

README

CHANGELOG

documentation

examples

if applicable.

---

# Commit Convention

Recommended

feat:

fix:

docs:

style:

refactor:

test:

ci:

build:

Example

feat: modularize chapter settings

fix: bibliography numbering

docs: update installation guide

---

# Pull Request Checklist

Before submitting

verify

- builds successfully

- no new warnings

- bibliography compiles

- TOC correct

- LOF correct

- LOT correct

- references correct

- page numbering correct

- README updated if necessary

---

# Coding Style

Prefer descriptive names.

Avoid abbreviations.

Comment complex logic.

Keep files organized.

Separate logical sections.

Example

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Chapter
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

---

# Refactoring Policy

Agents should

improve

not rewrite.

Preserve existing output whenever possible.

Never introduce breaking layout changes without reason.

---

# Testing

After modifications

compile

at least

three consecutive builds

LuaLaTeX

↓

Biber

↓

LuaLaTeX

↓

LuaLaTeX

Ensure

no compile errors.

Warnings should be minimized.

---

# Documentation Style

Documentation should explain

Why

not only

How.

Prefer

examples

diagrams

tables

comparison

best practices.

---

# Future Direction

This repository will evolve into

Indonesian Academic LaTeX Framework

with

themes

class files

CLI

documentation website

GitHub Actions

AI-assisted authoring

The architecture should remain scalable.

---

# Multi-Agent Collaboration

Multiple AI agents may work on this repository.

Agents must avoid overlapping modifications.

Preferred responsibilities

Architecture Agent

- folder structure
- dependency analysis

LaTeX Agent

- packages
- formatting
- layout

Documentation Agent

- README
- docs
- examples

CI Agent

- GitHub Actions
- Makefile
- latexmk

Review Agent

- code review
- consistency
- architecture

No agent should modify another agent's scope without explicit instruction.

---

# Definition of Done

A task is complete only if

✓ builds successfully

✓ documentation updated

✓ formatting preserved

✓ architecture improved

✓ code simplified

✓ no duplicated logic introduced

✓ repository remains maintainable

End of file.