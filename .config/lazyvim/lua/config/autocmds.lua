-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "*.slim",
  command = "setlocal filetype=slim",
})

-- Strip trailing whitespace
function StripTrailingWhitespaces()
  -- Preparation: save last search, and cursor position.
  local _s = vim.fn.getreg("/")
  local l = vim.fn.line(".")
  local c = vim.fn.col(".")
  -- Do the business:
  vim.cmd("%s/\\s\\+$//e")
  -- Clean up: restore previous search history, and cursor position
  vim.fn.setreg("/", _s)
  vim.fn.cursor(l, c)
end

vim.api.nvim_create_user_command("StripTrailingWhitespaces", StripTrailingWhitespaces, {})

-- Copy relative file path
function CopyRelativeFilePath()
  local filepath = vim.fn.expand("%")
  vim.fn.setreg("+", filepath)
  print("Relative file path copied to clipboard: " .. filepath)
end

vim.api.nvim_create_user_command("CopyRelativeFilePath", CopyRelativeFilePath, {})
