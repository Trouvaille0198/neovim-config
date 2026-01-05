-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable spell check by default unless in vscode
if not vim.g.vscode then
  vim.o.spell = true
end

local opt = vim.opt
opt.shiftwidth = 4 -- Size of an indent

vim.g.lazyvim_picker = "telescope"

-- python
vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"