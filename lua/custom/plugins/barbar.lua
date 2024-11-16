--Plugin that does tab, window, and buffer management.

--- @type LazyPlugin
return {
    'romgrk/barbar.nvim',
    enabled = false,
    -- lazy = true,
    dependencies = {
        'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
        'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function()
        vim.g.barbar_auto_setup = false
        vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
        focus_on_close = 'previous',
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
