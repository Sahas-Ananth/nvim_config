-- Highlight todo, notes, etc in comments
--- @type LazyPlugin
return {
    'folke/todo-comments.nvim',
    -- dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    keys = {
        { '<leader>st', '<cmd>TodoTelescope<CR>', desc = '[S]earch [T]ODOs' },
        {
            ']t',
            function()
                require('todo-comments').jump_next()
            end,
            desc = 'Next TODO comment',
        },
        {
            '[t',
            function()
                require('todo-comments').jump_prev()
            end,
            desc = 'Previous TODO comment',
        },
    },
}
