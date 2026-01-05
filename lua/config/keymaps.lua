-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local Util = require("lazyvim.util")
local map = vim.api.nvim_set_keymap
-- 复用 opt 参数
local opt = { noremap = true, silent = true }
-- Alt + hjkl  窗口之间跳转
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 上下左右比例控制
map("n", "<A-Left>", ":vertical resize -2<CR>", opt)
map("n", "<A-Right>", ":vertical resize +2<CR>", opt)
map("n", "<A-Up>", ":resize -2<CR>", opt)
map("n", "<A-Down>", ":resize +2<CR>", opt)
-- 等比例
map("n", "s=", "<C-w>=", opt)
-- Terminal相关
map("n", "<leader>t", ":sp | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
-- 上下滚动浏览
map("n", "<C-j>", "5j", opt)
map("n", "<C-k>", "5k", opt)
map("v", "<C-j>", "5j", opt)
map("v", "<C-k>", "5k", opt)
-- 命令行下 Ctrl+j/k  上一个下一个
map("c", "<C-j>", "<C-n>", { noremap = false })
map("c", "<C-k>", "<C-p>", { noremap = false })
-- 取消 s 默认功能
map("n", "s", "", opt)
map("n", "sv", ":vsp<CR>", opt)
map("n", "sb", ":sp<CR>", opt)
-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt)
-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- insert 模式下，跳到行首行尾
map("i", "H", "<ESC>I", opt)
map("i", "L", "<ESC>A", opt)
-- normal 模式下，跳到行首行尾
map("n", "H", "0", opt)
map("n", "L", "$", opt)
-- visual 模式下，跳到行首行尾
map("v", "H", "0", opt)
map("v", "L", "$", opt)

-- 取消 J 和 K
map("n", "J", "", opt)
map("n", "K", "", opt)
-- save buffer
map("n", "<C-s>", ":w<cr>", opt)
map("i", "<C-s>", "<Esc>:w<cr>", opt)

-- 关闭buffer
if Util.has("vim-bbye") then
	map("n", "<C-w>", ":Bdelete!<CR>", opt)
	map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
	map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
	map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)
end

-- Telescope
if Util.has("telescope.nvim") then
  -- 查找文件
  map("n", "<C-p>", ":Telescope find_files<CR>", opt)
  -- 全局搜索
  map("n", "<C-f>", ":Telescope live_grep<CR>", opt)
  map("n", "<C-c>", '"+y', opt)
end

-- 切换 Neo-tree 侧边栏（Ctrl+b）
map("n", "<C-b>", ":Neotree toggle<CR>", opt)
map("i", "<C-b>", "<Esc>:Neotree toggle<CR>", opt)
map("t", "<C-b>", [[ <C-\><C-N>:Neotree toggle<CR> ]], opt)

-- treesitter 折叠
map("n", "zc", ":foldclose<CR>", opt)
map("n", "zo", ":foldopen<CR>", opt)

-- Ctrl+Backspace -> 删除上一个词（兼容多种终端表示）
map("i", "<C-h>", "<C-o>db", opt) -- 在 Insert 模式下执行一次 normal db
map("n", "<C-h>", "db", opt)
map("v", "<C-h>", "d", opt)
map("t", "<C-h>", [[ <C-\><C-N>db ]], opt)
map("c", "<C-h>", "<C-w>", { noremap = false })

-- -- git
-- if vim.fn.executable("lazygit") == 1 then
-- 	map("n", "<leader>gg", function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = "Lazygit (Root Dir)" })
-- 	map("n", "<leader>gG", function() Snacks.lazygit() end, { desc = "Lazygit (cwd)" })
--   end
  
--   map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log (cwd)" })
--   map("n", "<leader>gb", function() Snacks.picker.git_log_line() end, { desc = "Git Blame Line" })
--   map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Current File History" })
--   map("n", "<leader>gl", function() Snacks.picker.git_log({ cwd = LazyVim.root.git() }) end, { desc = "Git Log" })
--   map({ "n", "x" }, "<leader>gB", function() Snacks.gitbrowse() end, { desc = "Git Browse (open)" })
--   map({"n", "x" }, "<leader>gY", function()
-- 	Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
--   end, { desc = "Git Browse (copy)" })

-- -- quit
-- map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
