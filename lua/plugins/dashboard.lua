return {
  "nvimdev/dashboard-nvim",
  lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
  opts = function()
    local logo = [[
       ....               ..      ...           ....        .         ....        .  
   .xH888888Hx.        :~"8888x :"%888x      .x88" `^x~  xH(`      .x88" `^x~  xH(`  
 .H8888888888888:     8    8888Xf  8888>    X888   x8 ` 8888h     X888   x8 ` 8888h  
 888*"""?""*88888X   X88x. ?8888k  8888X   88888  888.  %8888    88888  888.  %8888  
'f     d8x.   ^%88k  '8888L'8888X  '%88X  <8888X X8888   X8?    <8888X X8888   X8?   
'>    <88888X   '?8   "888X 8888X:xnHH(`` X8888> 488888>"8888x  X8888> 488888>"8888x 
 `:..:`888888>    8>    ?8~ 8888X X8888   X8888>  888888 '8888L X8888>  888888 '8888L
        `"*88     X   -~`   8888> X8888   ?8888X   ?8888>'8888X ?8888X   ?8888>'8888X
   .xHHhx.."      !   :H8x  8888  X8888    8888X h  8888 '8888~  8888X h  8888 '8888~
  X88888888hx. ..!    8888> 888~  X8888     ?888  -:8*"  <888"    ?888  -:8*"  <888" 
 !   "*888888888"     48"` '8*~   `8888!`    `*88.      :88%       `*88.      :88%   
        ^"***"`        ^-==""      `""          ^"~====""`            ^"~====""`     
    ]]

    logo = string.rep("\n", 8) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        -- this is taken care of by lualine
        -- enabling this messes up the actual laststatus setting after loading a file
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        -- stylua: ignore
        center = {
          { action = LazyVim.telescope("files"),                                    desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                                        desc = " New File",        icon = " ", key = "n" },
          { action = "Telescope oldfiles",                                       desc = " Recent Files",    icon = " ", key = "r" },
          { action = "Telescope live_grep",                                      desc = " Find Text",       icon = " ", key = "g" },
          { action = [[lua LazyVim.telescope.config_files()()]], desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',                        desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                               desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                                     desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = "qa",                                                       desc = " Quit",            icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      button.key_format = "  %s"
    end

    -- close Lazy and re-open when the dashboard is ready
    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
