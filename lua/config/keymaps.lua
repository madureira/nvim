-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>e", function()
  -- Always OPEN (don’t toggle-close)
  Snacks.explorer.open({
    cwd = require("lazyvim.util").root.get(), -- "root dir" behavior like LazyVim's <leader>e
    focus = "list",
  })
end, { desc = "Explorer Snacks (root dir)" })

vim.keymap.set("n", "<leader>E", function()
  Snacks.explorer.open({
    cwd = vim.fn.getcwd(), -- "cwd" behavior like LazyVim's <leader>E
    focus = "list",
  })
end, { desc = "Explorer Snacks (cwd)" })

vim.keymap.set("n", "q", function()
  local bt = vim.bo.buftype
  local ft = vim.bo.filetype

  -- If it's a "special" buffer/window, close the window
  if bt == "help" or bt == "quickfix" or bt == "nofile" or bt == "prompt" or ft == "qf" then
    vim.cmd("close")
    return
  end

  -- Otherwise, delete the current buffer (LazyVim usually has mini.bufremove)
  local ok, bufremove = pcall(require, "mini.bufremove")
  if ok then
    bufremove.delete(0, false) -- (bufnr=0 current), (force=false)
  else
    vim.cmd("bdelete") -- fallback
  end
end, { desc = "Close window / delete buffer" })
