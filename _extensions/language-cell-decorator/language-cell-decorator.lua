--[[
# MIT License
#
# Copyright (c) 2025 Mickaël Canouil
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
]]

--- Extracts filename and language from a code block, decorates it for Quarto rendering.
--- Supports extracting filename from special comment syntax: `language | filename: name.ext`
--- Also handles language extraction from cell-code blocks and template syntax.
--- The extracted language is displayed in uppercase as a decoration label.
---
--- @param code table The code block object from Quarto AST
--- @return table Decorated code block with filename and language attributes if found, otherwise original code block
local function language_filename(code)
  --- @type string|nil Extracted filename from code block comment
  local code_cell_filename = string.match(code.text, '^%s*.-|%s*filename:%s*([%w%._%-]+)')
  if code_cell_filename then
    code.attr = code.attr or {}
    code.attr.attributes = code.attr.attributes or {}
    code.attr.attributes.filename = code_cell_filename
    code.text = string.gsub(code.text, '^%s*.-|%s*filename:%s*([%w%._%-]+)', '')
  end

  --- @type string|nil Language identifier from code block classes
  local lang = code.attr.classes[1]
  if lang == 'cell-code' then
    _, _, matched_lang = string.find(code.text, '^`+%{%{([^%}]*)%}%}')
    lang = matched_lang or lang
  elseif lang ~= nil and lang:find('{{', 1, true) == 1 then
    --- @type string|nil Language extracted from template syntax
    local matched_lang = string.match(lang, '{{(.-)}}')
    if matched_lang then
      lang = matched_lang
    end
  end
  if lang and lang ~= '' then
    lang = lang:upper()
  else
    return code
  end

  return quarto.DecoratedCodeBlock({
    filename = lang,
    code_block = code
  })
end

--- Pandoc filter configuration.
--- Defines CodeBlock processing to add language decorations.
--- @type table
return {
  { CodeBlock = language_filename }
}
