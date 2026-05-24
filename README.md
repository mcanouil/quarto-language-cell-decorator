# Language Cell Decorator

This extension adds a decorator to the code cells to display the language name.

> [!WARNING]
> This extension has been superseded by the [Code Window extension](https://github.com/mcanouil/quarto-code-window).
> Code Window shows the language name on code blocks by default and adds window-style decorations.
> Please update your project to use the new extension.
>
> To install the new extension, see the [installation instructions](https://github.com/mcanouil/quarto-code-window?tab=readme-ov-file#installation).

## Installation

```bash
quarto add mcanouil/quarto-language-cell-decorator@0.4.0
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
