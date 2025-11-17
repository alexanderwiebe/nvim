return {
  -- Configure noice.nvim for better notification visibility
  {
    "folke/noice.nvim",
    opts = {
      notify = {
        -- Make notifications stay visible longer (default is 3000ms)
        timeout = 5000, -- 5 seconds
      },
      messages = {
        -- Show more messages in the message area
        view_search = false, -- Don't show search count in messages
      },
      lsp = {
        -- Show LSP progress notifications
        progress = {
          enabled = true,
          -- Throttle LSP progress updates to reduce noise
          throttle = 1000 / 30, -- frequency to update lsp progress message
        },
      },
    },
  },
}