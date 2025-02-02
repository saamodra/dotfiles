local M = {}

function M.map(mode, l, r, desc, opts)
  vim.keymap.set(mode, l, r, vim.tbl_extend('force', opts or {}, { desc = desc }))
end

return M

