require("kanagawa-paper").setup({})
require("rose-pine").setup({})

local function apply_colorscheme()
    local colorscheme = vim.o.background == "light" and "rose-pine-dawn" or "kanagawa-paper-ink"
    vim.cmd.colorscheme(colorscheme)
end

-- Follow terminal appearance changes and the Snacks background toggle.
vim.api.nvim_create_autocmd("OptionSet", {
    group = vim.api.nvim_create_augroup("AppearanceColorscheme", { clear = true }),
    pattern = "background",
    callback = apply_colorscheme,
})

apply_colorscheme()
