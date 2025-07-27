# Language Cell Decorator

This extension adds a decorator to the code cells to display the language name.

## Installation

```bash
quarto add mcanouil/quarto-language-cell-decorator
```

This will install the extension under the `_extensions` subdirectory.
If you're using version control, you will want to check in this directory.

## Usage

- Add the extension to your Quarto project using the installation command above.
- Render your document as usual with `quarto render`.
- Code cells will automatically display the language name as a decorator in all supported output formats.
- No further configuration is required.

## Example

Here is the source code for a minimal example: [example.qmd](example.qmd).

Outputs of `example.qmd`:

- [HTML](https://m.canouil.dev/quarto-language-cell-decorator/)
- [Typst (PDF)](https://m.canouil.dev/quarto-language-cell-decorator/example-typst.pdf)
- [LaTeX (PDF)](https://m.canouil.dev/quarto-language-cell-decorator/example-latex.pdf)
- [Word (DOCX)](https://m.canouil.dev/quarto-language-cell-decorator/example-openxml.docx)
- [Reveal.js (HTML)](https://m.canouil.dev/quarto-language-cell-decorator/example-revealjs.html)
- [Beamer (PDF)](https://m.canouil.dev/quarto-language-cell-decorator/example-beamer.pdf)
- [PowerPoint (PPTX)](https://m.canouil.dev/quarto-language-cell-decorator/example-pptx.pptx)
