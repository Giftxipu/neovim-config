return {
  {
      "folke/zen-mode.nvim",  -- For zen/focus mode
      cmd = "ZenMode",
      opts = {
          window = {
              width = 0.85,
              options = {
                  number = false,
                  relativenumber = false,
              }
          },
      },
      keys = {
          { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toggle Zen Mode" },
      }
  },
  {
      "folke/noice.nvim",  -- For enhanced notifications
      event = "VeryLazy",
      dependencies = {
          "MunifTanjim/nui.nvim",
          "rcarriga/nvim-notify",
      },
      opts = {
          lsp = {
              override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
              },
          },
          presets = {
              bottom_search = true,
              command_palette = true,
              long_message_to_split = true,
              inc_rename = false,
              lsp_doc_border = false,
          },
      },
      keys = {
          { "<leader>n", function() require("noice").cmd("history") end, desc = "Notification History" },
          { "<leader>.", "<cmd>NoiceDismiss<cr>", desc = "Dismiss Notifications" },
      }
  },
  {
      "folke/which-key.nvim",  -- For keybinding help
      event = "VeryLazy",
      init = function()
          vim.o.timeout = true
          vim.o.timeoutlen = 300
      end,
      opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
      }
  },
  {
      "lukas-reineke/indent-blankline.nvim",  -- For indent guides
      main = "ibl",
      opts = {
          indent = { char = "│" },
          scope = { enabled = false },
      }
  }
}