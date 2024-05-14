-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- add everforest
  { "sainnhe/everforest" },
  { "liuchengxu/vista.vim" },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  "OlegGulevskyy/better-ts-errors.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  config = {
    keymaps = {
      toggle = "<leader>dd", -- default '<leader>dd'
      go_to_definition = "<leader>dx", -- default '<leader>dx'
    },
  },

  -- disable flash
  { "folke/flash.nvim", enabled = false },
}
