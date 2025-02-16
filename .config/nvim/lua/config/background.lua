local function set_background()
    -- Function to execute shell command and return the result
    local function os_capture(cmd)
        local f = assert(io.popen(cmd, "r"))
        local s = assert(f:read("*a"))
        f:close()
        return s:gsub("[\n\r]+", "")
    end

    -- Check if we're on macOS
    if vim.fn.has("macunix") == 1 then
        -- Get the current appearance setting
        local appearance = os_capture("defaults read -g AppleInterfaceStyle 2>/dev/null")

        if appearance == "Dark" then
            vim.o.background = "dark"
        else
            vim.o.background = "light"
        end
    end
end

-- Call the function when Neovim starts
set_background()

-- Set up an autocommand to check periodically
vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Check every 2 minutes (120000 ms)
        vim.fn.timer_start(120000, function()
            set_background()
        end, { ["repeat"] = -1 })
    end
})
