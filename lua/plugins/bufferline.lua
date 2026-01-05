return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = {'nvim-tree/nvim-web-devicons', "moll/vim-bbye"},
    keys = {
      -- 禁用 LazyVim 默认的 Shift+H/L buffer 切换
      { "<S-h>", false },
      { "<S-l>", false },
      -- 使用 Ctrl+Q/E 切换 buffer
      { "<C-q>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
      { "<C-e>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    },
  }
}
