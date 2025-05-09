function language_filename(code)
  local lang = code.attr.classes[1] 
  if lang == "cell-code" then 
    _, _, matched_lang = string.find(code.text, "^`+%{%{([^%}]*)%}%}")
    lang = matched_lang or lang
  elseif lang ~= nil and lang:find('{{', 1, true) == 1 then
    _, _, matched_lang = string.find(lang, "{{+(.-)}}+")
    if matched_lang then
      lang = matched_lang
    end
  end
  
  -- Use quarto.doc.is_format() to detect formats
  local is_html = quarto.doc.is_format("html")
  local is_latex = quarto.doc.is_format("latex") or quarto.doc.is_format("pdf")
  local is_typst = quarto.doc.is_format("typst")
  
  -- Map languages to their icons based on output format
  local lang_icon = lang
  if lang == "html" then
    if is_html then
      lang_icon = '<i class="fa-brands fa-html5" aria-hidden="true"></i>'
    elseif is_latex then
      lang_icon = "\\faHtml5{}" -- Requires \usepackage{fontawesome5} in LaTeX
    elseif is_typst then
      lang_icon = "#emoji.computer" -- Simple computer icon as fallback in Typst
    end
  elseif lang == "latex" or lang == "tex" then
    if is_html then
      lang_icon = '<i class="fa-solid fa-square-root-variable" aria-hidden="true"></i>'
    elseif is_latex then
      lang_icon = "\\TeX{}"
    elseif is_typst then
      lang_icon = "#sym.nabla" -- Using nabla symbol for LaTeX in Typst
    end
  elseif lang == "typst" then
    if is_html then
      lang_icon = '<i class="fa-solid fa-t" aria-hidden="true"></i>'
    elseif is_latex then
      lang_icon = "\\textbf{T}" -- Bold T for Typst in LaTeX
    elseif is_typst then
      lang_icon = "#text(weight: \"bold\")[T]" -- Bold T for Typst in Typst
    end
  end
  
  return quarto.DecoratedCodeBlock({
    filename = lang_icon,
    code_block = code:clone()
  })
end

return {
  { CodeBlock = language_filename }
}
