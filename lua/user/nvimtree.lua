-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
  print("couln't load nvim-tree" .. nvim_tree)
  return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not config_status_ok then
  print("couln't load nvim-tree-config" .. nvim_tree_config)
  return
end

-- Replaces auto_close
-- local tree_cb = nvim_tree_config.nvim_tree_callback
-- vim.api.nvim_create_autocmd("BufEnter", {
--   nested = true,
--   callback = function()
--     if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
--       vim.cmd "quit"
--     end
--   end
-- })

nvim_tree.setup()
