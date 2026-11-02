require('mason').setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "gopls"
    },
    automatic_enable = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }

        -- Navigation
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

        -- Info
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

        -- Refactoring
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

        -- Diagnostics (navigation)
        vim.keymap.set("n", "[d", function()
            vim.diagnostic.jump({ count = -vim.v.count1 })
        end, opts)
        vim.keymap.set("n", "]d", function()
            vim.diagnostic.jump({ count = vim.v.count1 })
        end, opts)

        -- Diagnostics (view)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

        -- Formatting (optional, async)
        vim.keymap.set("n", "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end, opts)
    end,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = {
                version = "LuaJIT",
            },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = { vim.env.VIMRUNTIME },
                checkThirdParty = false,
            },
        },
    },
})

vim.lsp.enable("lua_ls")
