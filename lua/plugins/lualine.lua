return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    init = function()
        vim.g.lualine_laststatus = vim.o.laststatus
        if vim.fn.argc(-1) > 0 then
            -- set an empty statusline till lualine loads
            vim.o.statusline = ' '
        else
            -- hide the statusline on the starter page
            vim.o.laststatus = 0
        end
    end,
    -- See `:help lualine.txt`
    opts = {
        options = {
            icons_enabled = true,
            theme = 'auto',
            component_separators = '|',
            -- section_separators = '',
        },
        sections = {
            lualine_a = {
                'mode',
                {
                    function()
                        return require('noice').api.status.mode.get()
                    end,
                    cond = function()
                        return package.loaded['noice'] and require('noice').api.status.mode.has()
                    end,
                    -- FG: MoonflyOrange, BG = Moonfly Lua line standard BG.
                    color = { fg = '#de935f', bg = '#303030' },
                },
            },
            lualine_b = {
                -- function()
                --     return ' ' .. os.date '%c'
                -- end,
                'branch',
                'diff',
                'diagnostics',
            },
            lualine_c = {
                'buffers',
            },
            lualine_x = { 'tabs', 'fileformat', 'filetype' },
            lualine_y = { 'encoding', 'filetype' },
            lualine_z = { 'searchcount', 'selectioncount', 'location' },
        },
    },
}
