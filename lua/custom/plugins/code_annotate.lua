-- Custom plugin my me to annotate code

require('which-key').add {
    { '<leader>n', group = '[N]ote' },
}
--- @type LazyPlugin
return {
    dir = '/home/sahas/Documents/Projects/custom_nvim_plugins/Code_Annotate_nvim',
    name = 'code_annotate',
    dependencies = {
        'kkharji/sqlite.lua',
        -- 'nvim-lua/plenary.nvim',
        -- 'nvim-telescope/telescope.nvim',
    },
    lazy = false,
    opts = {
        auto_confirm_delete = false,
    },
    keys = {
        {
            '<leader>nc',
            '<cmd>NoteCreate<cr>',
            desc = '[n]ote [c]reate',
        },
        {
            '<leader>nd',
            '<cmd>NoteDelete<cr>',
            desc = '[n]ote [d]elete',
        },
        {
            '<leader>nv',
            '<cmd>NoteView<cr>',
            desc = '[n]ote [p]review',
        },
        {
            '<leader>sn',
            '<cmd>NoteTelescope<cr>',
            desc = '[s]earch [n]ote',
        },
    },
}
