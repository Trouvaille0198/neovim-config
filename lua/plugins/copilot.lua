return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    event = "InsertEnter",

    keys = {
      {
        "<Tab>",
        function()
          local suggestion = require("copilot.suggestion")

          if suggestion.is_visible() then
            suggestion.accept()
          else
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
          end
        end,
        desc = "Accept suggestion",
        mode = "i",
      },
    },

    config = function()
      require("copilot").setup({
        suggestion = {
          auto_trigger = true,
          keymap = {
            accept = false,
          },
        },
      })
    end,
  },
}
