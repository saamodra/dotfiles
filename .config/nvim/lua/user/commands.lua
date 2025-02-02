local group = vim.api.nvim_create_augroup('user_cmds', {clear = true})

vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = group,
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = group,
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "*.slim",
  command = "setlocal filetype=slim"
})

-- Strip trailing whitespace
function StripTrailingWhitespaces()
  -- Preparation: save last search, and cursor position.
  local _s = vim.fn.getreg('/')
  local l = vim.fn.line('.')
  local c = vim.fn.col('.')
  -- Do the business:
  vim.cmd('%s/\\s\\+$//e')
  -- Clean up: restore previous search history, and cursor position
  vim.fn.setreg('/', _s)
  vim.fn.cursor(l, c)
end

vim.api.nvim_create_user_command('StripTrailingWhitespaces', StripTrailingWhitespaces, {})

-- Copy relative file path
function CopyRelativeFilePath()
  local filepath = vim.fn.expand('%')
  vim.fn.setreg('+', filepath)
  print("Relative file path copied to clipboard: " .. filepath)
end

vim.api.nvim_create_user_command('CopyRelativeFilePath', CopyRelativeFilePath, {})
