return {
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.pyright.setup({})
            -- Change tsserver to typescript-language-server
            lspconfig.tsserver.setup({})  -- Change this line
            -- to:
            lspconfig.typescript.setup({})  -- New recommended way
        end,
    }
}