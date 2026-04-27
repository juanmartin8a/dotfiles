require("mini.pick").setup()

require("mini.surround").setup()

require("mini.completion").setup()

require("mini.pairs").setup()

require("mini.files").setup()

require("mini.ai").setup()

require("mini.icons").setup()

require("mini.move").setup({
    mappings = {
        left = '<S-h>',
        right = '<S-l>',
        down = '<S-j>',
        up = '<S-k>',

        line_left = '<S-h>',
        line_right = '<S-l>',
        line_down = '<S-j>',
        line_up = '<S-k>',
    },
})


-- keymaps

vim.keymap.set('n', '<leader>ff', function()
    require('mini.pick').builtin.files()
end)

vim.keymap.set('n', '<leader>fg', function()
    require('mini.pick').builtin.grep()
end)

vim.keymap.set('n', '<leader>fb', function()
    require('mini.pick').builtin.buffer()
end)

vim.keymap.set('n', '<leader>-', function()
    local mf = require('mini.files')

    if vim.bo.filetype == 'minifiles' then
        mf.close()
    else
        mf.open(vim.api.nvim_buf_get_name(0))
    end
end)
