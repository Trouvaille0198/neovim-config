-- 自动安装 coc 插件

local function setup()
  vim.g.coc_global_extensions = {
    "coc-eslint",
    "coc-go",
    "coc-highlight",
    "coc-snippets",
    "coc-html",
    "coc-json",
    "coc-stylua",
    "coc-markdownlint",
    "coc-pyright",
    "coc-sh",
    "coc-snippets",
    "coc-xml",
    "coc-yaml",
    "coc-yank",
  }
end

return {
  setup = setup,
}