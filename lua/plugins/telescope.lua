return{
    {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-u>"] = false, -- Disable scrolling up
            ["<C-d>"] = false, -- Disable scrolling down
          },
        },
      },
    })
     end
    }
}
