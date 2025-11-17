return {
  -- Enhanced file explorer navigation
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      -- Quick access to file explorer with cursor focus
      {
        "<C-e>",
        function()
          require("neo-tree.command").execute({ toggle = false, dir = vim.fn.getcwd() })
          -- Focus the neo-tree window after opening
          vim.defer_fn(function()
            local neo_tree_win = nil
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local buf = vim.api.nvim_win_get_buf(win)
              local buf_name = vim.api.nvim_buf_get_name(buf)
              if string.match(buf_name, "neo%-tree") then
                neo_tree_win = win
                break
              end
            end
            if neo_tree_win then
              vim.api.nvim_set_current_win(neo_tree_win)
            end
          end, 50)
        end,
        desc = "Focus File Explorer"
      },

      -- Quick toggle with focus on current file
      {
        "<leader>ef",
        function()
          require("neo-tree.command").execute({
            action = "focus",
            source = "filesystem",
            position = "left",
            reveal = true
          })
        end,
        desc = "Focus Explorer on Current File"
      },
    },

    opts = {
      -- Make file explorer more accessible
      filesystem = {
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },
        use_libuv_file_watcher = true, -- Auto-refresh when files change
        hijack_netrw_behavior = "open_current", -- Replace netrw
      },

      window = {
        -- Auto-resize and focus behavior
        auto_expand_width = true,
        width = 30,
        mappings = {
          -- Additional navigation mappings when in neo-tree
          ["l"] = "open", -- Use 'l' to open files (like hjkl navigation)
          ["h"] = "close_node", -- Use 'h' to close folders
          ["<Tab>"] = "toggle_node", -- Tab to toggle folders
          ["P"] = { "toggle_preview", config = { use_float = true } }, -- Preview files
        },
      },

      -- Better icons and display
      default_component_configs = {
        git_status = {
          symbols = {
            -- Cleaner git status symbols
            added = "✚",
            modified = "✱",
            deleted = "✖",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
      },
    },
  },
}