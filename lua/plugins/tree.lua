return{
    {
    "nvim-tree/nvim-tree.lua",
    lazy = false, 
    dependencies = {
      "nvim-tree/nvim-web-devicons", 
    },
    config = function()
      require("nvim-tree").setup({
        view = {
          width = 30, 
          side = "left", 
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
