local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs,rhs, options)
end

vim.g.mapleader = ' ' -- Set leader key

-------------------------------------------------
-- Neovim shortcuts
-------------------------------------------------

map('n', '<F12>', ':nohl<CR>')  -- Clear search highlight
map('n', '<C-s>', ':w<CR>')      -- Save

-------------------------------------------------
-- Nvim tree keymaps
-------------------------------------------------

map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close
map('n', '<C-a>', ':NvimTreeFocus<CR>')  -- focus

-------------------------------------------------
-- Buffer line
-------------------------------------------------

map('n', '<C-h>', ':BufferLineCyclePrev<CR>') -- move left
map('n', '<C-l>', ':BufferLineCycleNext<CR>') -- move right
-------------------------------------------------
map('n', '<C-x>', ':BufferLinePickClose<CR>') -- close

-------------------------------------------------
-------------------------------------------------
