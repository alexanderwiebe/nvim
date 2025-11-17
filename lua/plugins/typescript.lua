-- TypeScript configuration overrides
-- The base TypeScript support is loaded via lazyvim.plugins.extras.lang.typescript in lazy.lua
return {
  -- Enhance TypeScript server with better auto-import settings and custom keymaps
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          -- Add TypeScript-specific keymaps
          keys = {
            { "<leader>ci", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add Missing Imports" },
            { "<leader>co", "<cmd>TypescriptOrganizeImports<cr>", desc = "Organize Imports" },
            { "<leader>cu", "<cmd>TypescriptRemoveUnused<cr>", desc = "Remove Unused Imports" },
          },
          settings = {
            typescript = {
              -- Enhanced auto-import preferences
              preferences = {
                disableSuggestions = false,
                quotePreference = "auto",
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                includeCompletionsWithSnippetText = true,
                includeAutomaticOptionalChainCompletions = true,
              },
              suggest = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                includeCompletionsWithSnippetText = true,
                includeAutomaticOptionalChainCompletions = true,
              },
            },
            javascript = {
              preferences = {
                disableSuggestions = false,
                quotePreference = "auto",
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                includeCompletionsWithSnippetText = true,
                includeAutomaticOptionalChainCompletions = true,
              },
              suggest = {
                includeCompletionsForModuleExports = true,
                includeCompletionsForImportStatements = true,
                includeCompletionsWithSnippetText = true,
                includeAutomaticOptionalChainCompletions = true,
              },
            },
          },
        },
      },
    },
  },
}