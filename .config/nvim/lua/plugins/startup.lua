return {
    "startup-nvim/startup.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
        require("startup").setup({
            header = {
                type = "text",
                oldfiles_directory = false,
                align = "center",
                fold_section = false,
                title = "Header",
                margin = 5,
                content = {
                    "",
                    "",
                    "",
                    " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
                    " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
                    " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
                    " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
                    " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
                    " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
                },
                highlight = "Statement",
                default_color = "",
                oldfiles_amount = 0,
            },
            options = {
                mapping_keys = true,
                cursor_column = 0.5,
                empty_lines_between_mappings = true,
                disable_statuslines = true,
                paddings = { 1, 3, 3, 0 },
            },
            mappings = {
                execute_command = "<CR>",
                open_file = "o",
                open_file_split = "<c-o>",
                open_section = "<TAB>",
                open_help = "?",
            },
            parts = { "header" },
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "startup",
            callback = function()
                vim.opt_local.colorcolumn = ""
            end
        })
    end
}
