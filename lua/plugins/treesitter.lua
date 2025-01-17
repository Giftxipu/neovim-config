return{
    {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = "all", -- or list of languages to install
      highlight = {
        enable = true,
      },
    })
    end
    }
}
