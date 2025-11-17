return {
  -- Ensure formatters are installed via Mason
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "prettier",
        "stylua"
      })
    end,
  },

  -- Configure conform.nvim for formatting
  -- Note: LazyVim handles format_on_save automatically, so we only configure formatters
  {
    "stevearc/conform.nvim",
    opts = {
      -- Configure formatters by filetype
      formatters_by_ft = {
        -- TypeScript/JavaScript formatting
        typescript = { "prettier" },
        javascript = { "prettier" },
        typescriptreact = { "prettier" },
        javascriptreact = { "prettier" },

        -- Angular templates and HTML
        html = { "prettier" },

        -- Styling
        css = { "prettier" },
        scss = { "prettier" },
        sass = { "prettier" },
        less = { "prettier" },

        -- Configuration files
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        yml = { "prettier" },

        -- Markdown
        markdown = { "prettier" },

        -- Lua (for your Neovim config)
        lua = { "stylua" },
      },

      -- Prettier configuration - simplified for reliability
      formatters = {
        prettier = {
          -- Let prettier find its own config files
          args = { "--stdin-filepath", "$FILENAME" },
        },
      },
    },
  },

  -- Add formatting keybindings
  {
    "stevearc/conform.nvim",
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_fallback = true })
        end,
        mode = { "n", "v" },
        desc = "Format buffer",
      },
      {
        "<leader>cF",
        function()
          require("conform").format({ async = true, lsp_fallback = true, range = nil })
        end,
        mode = "n",
        desc = "Format entire buffer",
      },
    },
  },
}