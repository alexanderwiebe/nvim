return {
  {
    "stevearc/overseer.nvim",
    config = function()
      local overseer = require("overseer")

      overseer.setup({
        strategy = "toggleterm", -- optional
      })

      -- Keymaps
      vim.keymap.set("n", "<leader>rt", "<cmd>OverseerRun<CR>", { desc = "Run Task" })
      vim.keymap.set("n", "<leader>rl", "<cmd>OverseerRunLast<CR>", { desc = "Run Last Task" })
    end,
  },
}
