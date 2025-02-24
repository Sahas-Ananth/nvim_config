--- @type LazySpec
return {
    dir = '/home/sahas/Documents/Projects/custom_nvim_plugins/Code_Annotate_nvim',
    name = 'code_annotate',
    dependencies = {
        'kkharji/sqlite.lua',
        -- 'nvim-lua/plenary.nvim',
        -- 'nvim-telescope/telescope.nvim',
    },
    -- event = 'VeryLazy',
    lazy = true,
    opts = {
        auto_confirm_delete = true,
    },
    keys = {
        {
            '<leader>na',
            '<cmd>NoteCreate<cr>',
            desc = '[N]ote [A]dd',
        },
        {
            '<leader>nd',
            '<cmd>NoteDelete<cr>',
            desc = '[N]ote [D]elete',
        },
        {
            '<leader>nv',
            '<cmd>NoteView<cr>',
            desc = '[N]ote pre[V]iew',
        },
        {
            '<leader>sn',
            '<cmd>NoteTelescope<cr>',
            desc = '[S]earch [N]ote',
        },
    },
}
