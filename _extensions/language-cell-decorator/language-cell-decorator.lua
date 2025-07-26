---
--- Extracts filename and language from a code block, decorates it for Quarto rendering.
---
--- @param code table: The code block object from Quarto AST.
--- @return table|quarto.DecoratedCodeBlock: Decorated code block with filename and language attributes if found.
function language_filename(code)
  local code_cell_filename = string.match(code.text, "^%s*.-|%s*filename:%s*([%w%._%-]+)")
  if code_cell_filename then
    code.attr = code.attr or {}
    code.attr.attributes = code.attr.attributes or {}
    code.attr.attributes.filename = code_cell_filename
    code.text = string.gsub(code.text, "^%s*.-|%s*filename:%s*([%w%._%-]+)", "")
  end

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
  if lang and lang ~= "" then
    lang = lang:upper()
  else
    return code
  end

  return quarto.DecoratedCodeBlock({
    filename = lang,
    code_block = code
  })
end

return {
  { CodeBlock = language_filename }
}
