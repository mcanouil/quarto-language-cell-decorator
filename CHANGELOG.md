# Changelog

## Unreleased

### Refactoring

- refactor: Target the Quarto Wizard v2 extension schema in `_schema.yml`.

## 0.4.2 (2026-08-01)

### Documentation

- docs: List `code-window` under `filters` by name alone. The long form `path`/`at` overrides the entry point of every filter that extension contributes.

## 0.4.1 (2026-08-01)

### Documentation

- docs: Add a documentation website under `docs/`, built on the `atelier` project type and published to <https://m.canouil.dev/quarto-language-cell-decorator/>, leading with the supersession by Code Window.
- docs: Trim `README.md` to a landing page pointing at the website, and `example.qmd` to a short starting point to copy.
- docs: Add the Pages workflow, which renders `docs/` on pull requests and deploys it from the release tag.
- docs: Add the Quarto Extensions Updates workflow, scanning `docs` for the website's own dependencies.

## 0.4.0 (2026-05-24)

### Documentation

- docs: Deprecate Language Cell Decorator extension in favour of Code Window.

## 0.3.1 (2026-02-21)

### New Features

- feat: Rename element-attributes to attributes in schema (#13).

## 0.3.0 (2026-02-21)

### New Features

- feat: Add _schema.yml for configuration validation and IDE support (#10).

## 0.2.1 (2026-02-11)

### Bug Fixes

- fix: Update copyright year.

## 0.2.0 (2025-10-25)

### New Features

- feat: Add author information to example.qmd.

### Bug Fixes

- fix: Correct function declaration syntax.
- fix: Add licence header.

### Style

- style: Correct output phrasing in README.
- style: Standardise string pattern delimiters.

## 0.1.0 (2025-07-27)

### New Features

- feat: Add CITATION file for project citation.
- feat: Basic filter.

### Bug Fixes

- fix: Only html is supported.
- fix: Example for revealjs.
- fix: Use filename to add language.

### Refactoring

- refactor: Rename and try to handle already existing filename attribute.

### Documentation

- docs: Update readme with usage instructions.
