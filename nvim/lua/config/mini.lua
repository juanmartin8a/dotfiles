require("mini.surround").setup()

require("mini.completion").setup()

-- disable autocomplete on snacks picker
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("DisableSnacksCompletion", { clear = true }),
    pattern = "snacks_picker_input",
    callback = function(event)
        vim.b[event.buf].minicompletion_disable = true
    end,
})

require("mini.pairs").setup()

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

-- vim.keymap.set('n', '<leader>-', function()
--     local mf = require('mini.files')
--
--     if vim.bo.filetype == 'minifiles' then
--         mf.close()
--     else
--         mf.open(vim.api.nvim_buf_get_name(0))
--     end
-- end)
