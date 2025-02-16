return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
                rust = { "rustfmt" },
                python = { "ruff_organize_imports", "ruff_format" },
                fish = { "fish_indent" },
            },
            default_format_opts = {
                lsp_format = "fallback",
            },
            format_on_save = {
                timeout_ms = 500,
            },
        })
    end
}
