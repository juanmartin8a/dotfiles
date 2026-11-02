require('nvim-treesitter').install {
    'rust',
    'javascript',
    'typescript',
    'zig',
    'go',
    'python'
}

vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start, arg.buf)
    end,
})

-- syntax aware folding

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99
