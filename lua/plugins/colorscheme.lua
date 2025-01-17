return {
    {
        "folke/tokyonight.nvim",
        lazy = false, -- make sure we load this during startup
        priority = 1000, -- load this before all other start plugins
        config = function()
            -- load the colorscheme here
            vim.cmd([[colorscheme tokyonight]])
            
            -- Optional: configure the theme variant
            -- Available options: "storm" (default), "moon", "night", "day"
            vim.g.tokyonight_style = "storm"
        end,
    },
}
