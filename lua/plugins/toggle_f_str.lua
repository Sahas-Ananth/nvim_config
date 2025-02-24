--- @type LazySpec
return {
    'roobert/f-string-toggle.nvim',
    keys = {
        {
            '<leader>tf',
            function()
                require('f-string-toggle').toggle_fstring()
            end,
            desc = '[T]oggle f-string',
        },
    },
    opts = {},
    ft = { 'python' },
}
