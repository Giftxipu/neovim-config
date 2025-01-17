return{
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
          "saadparwaiz1/cmp_luasnip",  -- Adds support for luasnip
        },
        config = function()
          local cmp = require("cmp")
          cmp.setup({
            snippet = {
              expand = function(args)
                require("luasnip").lsp_expand(args.body)  -- Snippet expansion
              end,
            },
            mapping = {
              ["<Tab>"] = cmp.mapping.select_next_item(),
              ["<S-Tab>"] = cmp.mapping.select_prev_item(),
              ["<CR>"] = cmp.mapping.confirm({ select = true }),
            },
            sources = {
              { name = "nvim_lsp" },
              { name = "buffer" },
              { name = "path" },
              { name = "luasnip" },  -- Enables snippets
            },
          })
        end,
      }      
}