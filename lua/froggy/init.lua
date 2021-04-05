-- luacheck: globals vim
vim.cmd("syntax reset")

local NONE = "NONE"

local function blend(command, attrs)
  if attrs.blend then command[#command + 1] = " blend=" .. attrs.blend end
end

local function colorize(command, attrs)
  command[#command + 1] = (" guibg=%s guifg=%s"):format(attrs.bg, attrs.fg)
  blend(command, attrs)
end

local function stylize(command, style, color)
  command[#command + 1] = " gui=" .. style
  if color then command[#command + 1] = " guisp=" .. color end
end

-- Generate a `:highlight` command from a group and some attributes.
local function highlight(highlight_group, attributes)
  local highlight_cmd = {"hi! ", highlight_group}

  if attributes[vim.o.background] then
    attributes.__index = attributes
    attributes = setmetatable(attributes[vim.o.background], attributes)
  end

  local link = (type(attributes) == "string" and attributes) or attributes.link

  if link then
    highlight_cmd[3] = highlight_cmd[2] .. " "
    highlight_cmd[2] = "link "
    highlight_cmd[4] = link
  else
    colorize(highlight_cmd, attributes)

    local style = attributes.style or NONE
    if type(style) == "table" then
      stylize(highlight_cmd, table.concat(style, ","), style.color)
    else
      stylize(highlight_cmd, style)
    end
  end

  vim.cmd(table.concat(highlight_cmd))
end

return function(highlights)
  local normal = highlights.Normal
  if normal then
    highlight("Normal", normal)
    highlights.Normal = nil
  end

  for highlight_group, attributes in pairs(highlights) do
    highlight(highlight_group, attributes)
  end
end
