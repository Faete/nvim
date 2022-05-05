local view = require'nvim-tree.view'

local _M = {}
_M.toggle_tree = function()
  if view.is_visible() then
    require'nvim-tree'.toggle()
    require'bufferline.state'.set_offset(0)
  else
    require'bufferline.state'.set_offset(31, '')
    require'nvim-tree'.find_file(true)
  end

end

return _M
