-- FileTree plugin.

return {
    'stevearc/oil.nvim',
    opts = {
        default_file_explorer = false,
        buf_options = {
            buflisted = true,
            bufhidden = 'hide',
        },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
}
