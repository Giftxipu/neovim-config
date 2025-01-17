return{
    {
        'stevearc/oil.nvim',
        opts = {
            -- Oil configuration
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },
            view_options = {
                show_hidden = true,
            },
        },
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
        },
    }
}