--- @type LazySpec
return {
    'nvim-neotest/neotest',
    dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',

        -- Each Language Adapter
        'nvim-neotest/neotest-python',
    },
    opts = function()
        return {
            adapters = {
                require 'neotest-python',
            },
        }
    end,
    keys = {
        {
            '<leader>tr',
            function()
                require('neotest').run.run()
            end,
            desc = 'Neotest run the nearest test',
        },
        {
            '<leader>tF',
            function()
                require('neotest').run.run(vim.fn.expand '%')
            end,
            desc = 'Neotest run the file',
        },
        {
            '<leader>tw',
            function()
                require('neotest').watch.toggle(vim.fn.expand '%')
            end,
            desc = 'Neotest toggle watch',
        },
        {
            '<leader>to',
            function()
                require('neotest').output.open {
                    enter = true, --[[auto_close=true]]
                }
            end,
            desc = 'Neotest show output',
        },
        {
            '<leader>ts',
            function()
                require('neotest').summary.open()
            end,
            desc = 'Neotest show summary',
        },
    },
}
