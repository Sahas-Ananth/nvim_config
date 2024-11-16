-- Plugin to refactor code.

--- @type LazySpec
return {
    'ThePrimeagen/refactoring.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-treesitter/nvim-treesitter' },
    },
    keys = {
        {
            '<leader>rf',
            function()
                require('refactoring').refactor 'Extract Function'
            end,
            mode = 'x',
            desc = 'Extract [f]unction',
        },
        {
            '<leader>rF',
            function()
                require('refactoring').refactor 'Extract Function To File'
            end,
            mode = 'x',
            desc = 'Extract function To [F]ile',
        },
        {
            '<leader>rv',
            function()
                require('refactoring').refactor 'Extract Variable'
            end,
            mode = 'x',
            desc = 'Extract [v]ariable',
        },
        {
            '<leader>rI',
            function()
                require('refactoring').refactor 'Inline Function'
            end,
            mode = 'n',
            desc = '[I]nline Function',
        },
        {
            '<leader>ri',
            function()
                require('refactoring').refactor 'Inline Variable'
            end,
            mode = { 'n', 'x' },
            desc = '[i]nline variable',
        },
        {
            '<leader>rb',
            function()
                require('refactoring').refactor 'Extract Block'
            end,
            mode = 'n',
            desc = 'Extract [b]lock',
        },
        {
            '<leader>rB',
            function()
                require('refactoring').refactor 'Extract Block To File'
            end,
            mode = 'n',
            desc = 'Extract [B]lock to file',
        },
        {
            '<leader>rs',
            function()
                require('telescope').extensions.refactoring.refactors()
            end,
            mode = { 'n', 'x' },
            desc = '[S]elect',
        },
    },
}
