function languageFilename(code)
  local lang = code.attr.classes[1] 
  if lang == "cell-code" then 
    _, _, matchedLang = string.find(code.text, "^`+%{%{([^%}]*)%}%}")
    lang = matchedLang or lang
  elseif lang ~= nil and lang:find('{{', 1, true) == 1 then
    _, _, matchedLang = string.find(lang, "{{+(.-)}}+")
    if matchedLang then
      lang = matchedLang
    end
  end
  return quarto.DecoratedCodeBlock({
    filename = lang,
    code_block = code:clone()
  })
end

return {
  { CodeBlock = languageFilename }
}
