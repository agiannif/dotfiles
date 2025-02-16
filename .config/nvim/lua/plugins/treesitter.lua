return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "bash",
                "dockerfile",
                "fish",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "go",
                "html",
                "json",
                "lua",
                "make",
                "markdown",
                "python",
                "rust",
                "ssh_config",
                "toml",
                "vim",
                "vimdoc",
                "yaml",
            },
            sync_install = false,
            auto_install = true,
            indent = { enable = true },
            highlight = { enable = true },
        })
    end
}
