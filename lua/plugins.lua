local packer = require("packer")
packer.startup({
	function(use)
		-- Packer 可以管理自己本身
		use("wbthomason/packer.nvim")
		-- 主题
		use("folke/tokyonight.nvim")
		-- use("glepnir/zephyr-nvim")
		use("ful1e5/onedark.nvim")
		-- 侧边栏
		use({"nvim-tree/nvim-tree.lua", requires = {"nvim-tree/nvim-web-devicons"}})
		-- bufferline
		use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
		-- lualine
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use("arkav/lualine-lsp-progress")
		-- telescope
		use { 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim" } }
		-- dashboard-nvim
		use("glepnir/dashboard-nvim")
		-- project
		use("ahmedkhalf/project.nvim")
		-- treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
		})

		-- -- lsp installer
		-- -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
		-- -- Lspconfig
		-- -- use({ "neovim/nvim-lspconfig" })
		-- use {
		-- 	'junnplus/nvim-lsp-setup',
		-- 	requires = {
		-- 		'neovim/nvim-lspconfig',
		-- 		'williamboman/nvim-lsp-installer',
		-- 	}
		-- }
		-- use("github/copilot.vim")
		-- 补全引擎
		use("hrsh7th/nvim-cmp")
		-- -- snippet 引擎
		-- use("hrsh7th/vim-vsnip")
		-- -- 补全源
		-- use("hrsh7th/cmp-vsnip")
		-- use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		-- use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		-- use("hrsh7th/cmp-path") -- { name = 'path' }
		-- use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		-- -- 常见编程语言代码段
		-- use("rafamadriz/friendly-snippets")
		-- -- ui
		-- use("onsails/lspkind-nvim")

		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")
		use("tami5/lspsaga.nvim") -- 新增
		-- git
		use("lewis6991/gitsigns.nvim")
		--括号补全
		use("windwp/nvim-autopairs")
		-- 注释代码快捷键
		use("numToStr/Comment.nvim")
		-- coc
		use({'neoclide/coc.nvim', branch='release',run = function() require('plugin-config.coc-setup').setup() end})
	end,
	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			default_url_format = 'git@github.com:%s'
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
	},
}
)
-- 每次保存 plugins.lua 自动安装插件
pcall(
	vim.cmd,
	[[
	augroup packer_user_config
	autocmd!
	autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
  ]]
)
