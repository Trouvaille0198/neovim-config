-- 放到 ~/.config/nvim/lua/plugins/osc52.lua（或你 LazyVim 的插件目录）
return {
	{
		"ojroques/nvim-osc52",
		config = function()
			require("osc52").setup({
				max_length = 0, -- 0 = 不限制（按需改）
				silent = true,
				trim = false,
				tmux_passthrough = false, -- 你说没用 tmux，设为 false
			})

			-- Visual 模式 Ctrl-C -> 通过 osc52 复制（稳妥）
			vim.keymap.set("v", "<C-c>", require("osc52").copy_visual, { desc = "OSC52 copy (visual)" })

			-- 可选：Normal 模式 Ctrl-C 复制当前行（如果你想用 Ctrl-C 在普通模式复制整行）
			-- 注意：这会覆盖默认的 <C-c> 行为（通常等同于 <Esc>），若你不想覆盖可以注释掉下面一行
			vim.keymap.set("n", "<C-c>", function()
				vim.cmd("normal! yy") -- 触发 yy，之后 TextYankPost 会把内容发出去
			end, { desc = "Copy current line via OSC52" })

			-- 核心：在每次 yank 后把被 yank 的寄存器通过 osc52.copy_register 发送
			vim.api.nvim_create_autocmd("TextYankPost", {
				callback = function()
					-- 仅处理 yank 操作
					if vim.v.event.operator ~= "y" then
						return
					end

					-- 获取被 yank 的寄存器名：为空或 nil 表示 unnamed -> 用 '"'
					local regname = vim.v.event.regname
					if regname == "" or regname == nil then
						regname = '"'
					end

					-- 使用插件提供的函数把寄存器内容发送到 OSC52
					local ok, err = pcall(require("osc52").copy_register, regname)
					if not ok then
						vim.notify("osc52.copy_register failed: " .. tostring(err), vim.log.levels.WARN)
					end
				end,
				desc = "Send yanked text to local clipboard via OSC52",
			})
		end,
	},
}
