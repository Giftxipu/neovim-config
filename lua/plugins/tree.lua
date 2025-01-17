return{
    {
    "nvim-tree/nvim-tree.lua",
    lazy = false, -- Load immediately
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- Optional, for file icons
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30, -- Width of the explorer
          side = "left", -- Position: "left" or "right"
        },
        renderer = {
          highlight_opened_files = "name",
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
          },
        },
        git = {
          enable = true,
        },
      })
    end,
  }
}
