-- 基础设置
require('basic')
-- 快捷键映射
require("keybindings")
-- Packer 插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 插件配置
-- 文件树
require("plugin-config.nvim-tree")
-- 标签页
require("plugin-config.bufferline")
-- 底栏
require("plugin-config.lualine")
-- 模糊搜索
require("plugin-config.telescope")
-- 仪表盘
require("plugin-config.dashboard")
require("plugin-config.project")
-- 语法高亮
require("plugin-config.nvim-treesitter")
-- 将neovim中的内容复制到windows剪贴板中
require("yank-to-win")
-- 缩进竖线
require("plugin-config.indent-blankline")
-- autopairs
require("plugin-config.nvim-autopairs")
-- comment
require("plugin-config.comment")
-- coc
require("plugin-config.coc")