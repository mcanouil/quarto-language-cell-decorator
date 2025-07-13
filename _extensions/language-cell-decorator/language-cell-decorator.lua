function language_filename(code)
  local lang = code.attr.classes[1]
  if lang == "cell-code" then
    _, _, matched_lang = string.find(code.text, "^`+%{%{([^%}]*)%}%}")
    lang = matched_lang or lang
  elseif lang ~= nil and lang:find('{{', 1, true) == 1 then
    local matched_lang = string.match(lang, "{{(.-)}}")
    if matched_lang then
      lang = matched_lang
    end
  end

  local is_html = quarto.doc.is_format("html")
  local is_latex = quarto.doc.is_format("latex") or quarto.doc.is_format("pdf")
  local is_typst = quarto.doc.is_format("typst")

  if lang then
    lang = lang:upper()
  end

  local code_clone = code:clone()
  code_clone.attr.attributes.filename = nil

  local extracted_filename = nil
  local clean_text = code_clone.text

  if clean_text then
    extracted_filename = string.match(clean_text, "^.+%| filename:%s*([^\n]*)")
    if not extracted_filename then
      extracted_filename = string.match(clean_text, "\n%s*.+%| filename:%s*([^\n]*)")
    end

    clean_text = string.gsub(clean_text, "\n%s*.+| filename: [^\n]*", "")
    clean_text = string.gsub(clean_text, "^%s*.+| filename: [^\n]*\n?", "")
    code_clone.text = clean_text
  end

  local filename = lang
  if code.attr.attributes.filename then
    filename = lang .. " - " .. code.attr.attributes.filename
  elseif extracted_filename then
    filename = lang .. " - " .. extracted_filename
  end

  return quarto.DecoratedCodeBlock({
    filename = filename,
    code_block = code_clone
  })
end

return {
  { CodeBlock = language_filename }
}
