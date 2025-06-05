-- Set up lazy nvim plugin manager                          
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
vim.opt.rtp:prepend(lazypath)                               
                                                            
require("lazy").setup({                                     
    {                                                       
        "neanias/everforest-nvim",                          
        config = function()                                 
            vim.cmd.colorscheme("everforest")               
        end,                                                
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query"},
                auto_install = true,
                highlight = {
                    enable = true
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd",
                    }
                }
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
    }
})                                                          
