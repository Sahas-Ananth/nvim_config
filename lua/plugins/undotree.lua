-- Undo Tree Plugin

--- @type LazySpec
return {
    'mbbill/undotree',
    keys = {
        {
            '<leader>u',
            '<cmd>UndotreeToggle<cr>',
            desc = 'Toggle undo tree.',
        },
    },
}
