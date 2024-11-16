return {
    {
        -- Add indentation guides even on blank lines
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
        -- Enable `lukas-reineke/indent-blankline.nvim`
        --- @type ibl.config
        opts = {
            scope = {
                highlight = {
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
        config = function(_, opts)
            require('ibl').setup(opts)
            local hooks = require 'ibl.hooks'
            hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
        end,
    },
}
