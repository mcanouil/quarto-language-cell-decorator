# Language Cell Decorator

This extension adds a decorator to the code cells to display the language name.

## Installation

```bash
quarto add mcanouil/quarto-language-cell-decorator@0.3.1
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Usage

Add the extension to your document's YAML front matter:

```yaml
filters:
  - language-cell-decorator
```

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

Output of `example.qmd`:

- [HTML](https://m.canouil.dev/quarto-language-cell-decorator/)
- [Reveal.js (HTML)](https://m.canouil.dev/quarto-language-cell-decorator/example-revealjs.html)
