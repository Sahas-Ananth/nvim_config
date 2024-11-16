--- @type LazyPlugin
return {
    'ThePrimeagen/harpoon',
    dependencies = { 'nvim-lua/plenary.nvim' },
    branch = 'harpoon2',
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    config = function(_, opts)
        local harpoon = require 'harpoon'
        harpoon:setup(opts)
        harpoon:extend {
            UI_CREATE = function(cx)
                vim.keymap.set('n', '<C-v>', function()
                    harpoon.ui:select_menu_item { vsplit = true }
                end, { buffer = cx.bufnr })

                vim.keymap.set('n', '<C-x>', function()
                    harpoon.ui:select_menu_item { split = true }
                end, { buffer = cx.bufnr })

                vim.keymap.set('n', '<C-t>', function()
                    harpoon.ui:select_menu_item { tabedit = true }
                end, { buffer = cx.bufnr })
            end,
        }
    end,
    keys = function()
        --- @type LazyKeys
        local keys = {
            {
                '<leader>ma',
                function()
                    require('harpoon'):list():add()
                end,
                desc = 'Harpoon Add',
            },
            {
                '<leader>mm',
                function()
                    require('harpoon').ui:toggle_quick_menu(require('harpoon'):list(), {
                        title_pos = 'center',
                        ui_max_width = 50,
                    })
                end,
                desc = 'Harpoon Menu',
            },
            {
                '<C-n>',
                function()
                    require('harpoon'):list():next()
                end,
                desc = 'Harpoon Next',
            },
            {
                '<C-p>',
                function()
                    require('harpoon'):list():prev()
                end,
                desc = 'Harpoon Previous',
            },
            {
                '<leader>mt',
                '<cmd>Telescope harpoon marks<cr>',
                desc = 'Harpoon Telescope',
            },
        }
        for i = 1, 9 do
            table.insert(keys, {
                '<C-' .. i .. '>',
                function()
                    require('harpoon'):list():select(i)
                end,
            })
        end
        return keys
    end,
}
