return {
    {
        "folke/tokyonight.nvim",
        lazy = false, 
        priority = 1000, 
        config = function()
            vim.cmd([[colorscheme tokyonight]])
            vim.g.tokyonight_style = "storm"
        end,
    },
}
