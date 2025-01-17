
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

-- Add lazy.nvim to runtime path
vim.opt.rtp:prepend(lazypath)

-- Define events for "LazyFile"
local events = { "BufReadPost", "BufNewFile", "BufWritePre" }

vim.api.nvim_create_autocmd(events, {
    group = vim.api.nvim_create_augroup("LazyFile", { clear = true }),
    callback = function()
        vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile" })
    end,
})
-- Setup lazy.nvim with your plugins configuration
require("lazy").setup("plugins")
