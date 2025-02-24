--- @type LazySpec
return {
    'folke/snacks.nvim',
    priority = 1000,
    enabled = true,
    lazy = false,
    init = function()
        vim.api.nvim_create_autocmd('User', {
            pattern = 'VeryLazy',
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.bt = function()
                    Snacks.debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                Snacks.toggle.option('wrap', { name = 'Wrap' }):map '<leader>Tw'
                Snacks.toggle.diagnostics():map '<leader>Td'
                Snacks.toggle.dim():map '<leader>TD'
            end,
        })
    end,
    ---@type snacks.Config
    opts = {
        bigfile = { enabled = true },
        dashboard = { enabled = true },
        indent = {
            enabled = true,
            ---@class snacks.indent.Scope.Config: snacks.scope.Config
            scope = {
                enabled = true,
                underline = true,
                hl = {
                    'MoonflyRed',
                    'MoonflyYellow',
                    'MoonflyBlue',
                    'MoonflyOrange',
                    'MoonflyGreen',
                    'MoonflyViolet',
                    'MoonflyTurquoise',
                },
            },
        },
        input = { enabled = true },
        notifier = {
            enabled = true,
            timeout = 1000,
        },
        quickfile = { enabled = true },
        scroll = { enabled = false },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        zen = { enabled = false },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            },
        },
    },
    keys = {
        {
            '<M-d>',
            function()
                Snacks.scratch()
            end,
            desc = 'Toggle Scratch Buffer',
        },
        {
            '<leader>S',
            function()
                Snacks.scratch.select()
            end,
            desc = 'Select Scratch Buffer',
        },
        {
            '<leader>Nh',
            function()
                Snacks.notifier.show_history()
            end,
            desc = 'Notification History',
        },
        {
            '<M-c>',
            function()
                Snacks.bufdelete()
            end,
            desc = 'Delete Buffer',
        },
        {
            '<leader>fR',
            function()
                Snacks.rename.rename_file()
            end,
            desc = 'Rename File',
        },
        {
            '<leader>hB',
            function()
                Snacks.gitbrowse()
            end,
            desc = 'Git Browse',
            mode = { 'n', 'v' },
        },
        {
            '<leader>hf',
            function()
                Snacks.lazygit.log_file()
            end,
            desc = 'Lazygit Current File History',
        },
        {
            '<leader>gl',
            function()
                Snacks.lazygit()
            end,
            desc = 'Lazygit',
        },
        {
            '<leader>hc',
            function()
                Snacks.lazygit.log()
            end,
            desc = 'Lazygit Log (cwd)',
        },
        {
            '<leader>Nc',
            function()
                Snacks.notifier.hide()
            end,
            desc = 'Dismiss All Notifications',
        },
        {
            ']r',
            function()
                Snacks.words.jump(vim.v.count1)
            end,
            desc = 'Next Reference',
            mode = { 'n', 't' },
        },
        {
            '[r',
            function()
                Snacks.words.jump(-vim.v.count1)
            end,
            desc = 'Prev Reference',
            mode = { 'n', 't' },
        },
    },
}
