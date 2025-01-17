return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            
            -- Python setup
            lspconfig.pyright.setup({})
            
            -- TypeScript setup
            lspconfig.ts_ls.setup({
                filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
                cmd = { "typescript-language-server", "--stdio" },
                init_options = {
                    hostInfo = "neovim"
                },
            })
        end,
    }
}
