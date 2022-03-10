local M = {}
function M.initialize()
  require("todo-comments").setup{}

    require("transparent").setup({
        enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be clear
        },
        exclude = {}, -- table: groups you don't want to clear
    })

    require'nvim-tree'.setup{
      auto_close = true,
      hijack_cursor = true,
    }

    --shade
    require'shade'.setup({
      overlay_opacity = 70,
      opacity_step = 1,
      keys = {
        brightness_up    = '<C-Up>',
        brightness_down  = '<C-Down>',
        toggle           = '<Leader>s',
      }
    })

    --telescope
    require('telescope').setup{}
    
      --icons
    require'nvim-web-devicons'.setup {
        default = true,
    }
    --toggleterm

    require('toggleterm').setup{
        close_on_exit = true,
        start_in_insert = false,
        shade_terminals = false
    }
    local Terminal  = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction ="float" })

    function _lazygit_toggle()
      lazygit:toggle()
    end


    --autotags
    require'nvim-treesitter.configs'.setup {
    autotag = {
        enable = true,
    }
    }

    --notify
    vim.notify = require("notify")
    require("notify").setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Default timeout for notifications
  timeout = 5000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = "#000000",

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})

end
return M
