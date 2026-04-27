-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- Cursor
vim.opt.guicursor = "n-v-c:block,i:block-blinkwait0-blinkon200-blinkoff150"

-- Line numbers / UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.wrap = false
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Files / recovery
vim.opt.backup = false
vim.opt.writebackup = true

vim.opt.swapfile = true
vim.opt.undofile = true
vim.opt.undolevels = 10000
vim.opt.undoreload = 10000

-- External file changes
vim.opt.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
    callback = function()
        if vim.fn.mode() ~= "c" then
            vim.cmd("checktime")
        end
    end,
})

vim.api.nvim_create_autocmd("FileChangedShellPost", {
    callback = function()
        vim.notify("File changed on disk. Buffer reloaded.", vim.log.levels.INFO)
    end,
})

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- Indentation
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Responsiveness
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400

vim.pack.add {
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/sainnhe/everforest",
}

require('config.colorscheme')
require('config.lsp')
require('config.treesitter')
require('config.mini')
