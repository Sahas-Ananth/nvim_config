-- Plugin to have brackets have same color.
return {
    'hiphish/rainbow-delimiters.nvim',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    config = function()
        local rainbow_delimiters = require 'rainbow-delimiters'
        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
            },
            highlight = {
                'MoonflyRed',
                'MoonflyYellow',
                'MoonflyBlue',
                'MoonflyOrange',
                'MoonflyGreen',
                'MoonflyViolet',
                'MoonflyTurquoise',
            },
        }
    end,
}
