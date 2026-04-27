require('nvim-treesitter').install {
    'rust',
    'javascript',
    'zig',
    'go',
    'python'
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})
