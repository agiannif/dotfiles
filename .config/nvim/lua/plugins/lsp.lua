return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets",
        "j-hui/fidget.nvim",
        "nvim-telescope/telescope.nvim",
    },
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        -- Set up Mason
        require("fidget").setup({})
        require("mason").setup()


        -- Function to check if the buffer has a supported language server attached
        local function has_lsp_with_formatting(bufnr)
            local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
            for _, client in ipairs(clients) do
                if client.supports_method("textDocument/formatting") then
                    return true
                end
            end
            return false
        end

        -- Autoformat function
        local function format_buffer()
            if has_lsp_with_formatting(0) then -- 0 means current buffer
                vim.lsp.buf.format({ async = false })
            end
        end

        -- Create autocmd for formatting on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*", -- All files
            callback = format_buffer,
        })

        local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
        local telescope_builtin = require("telescope.builtin")
        local set_keymaps = function(client, bufnr)
            local opts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "<leader>gd", telescope_builtin.lsp_definitions, opts)
            vim.keymap.set("n", "<leader>gi", telescope_builtin.lsp_implementations, opts)
            vim.keymap.set("n", "<leader>gr", telescope_builtin.lsp_references, opts)
            vim.keymap.set("n", "<leader>gn", vim.lsp.buf.rename, opts)
        end

        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "markdown_oxide",
                "ruff",
                "rust_analyzer",
                "taplo",
                "typos_lsp"
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        capabilities = lsp_capabilities,
                        on_attach = set_keymaps,
                    })
                end,
            },
        })

        -- Set up nvim-cmp
        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })


        -- Configure diagnostics
        vim.diagnostic.config({
            float = {
                focusable = false,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end
}
