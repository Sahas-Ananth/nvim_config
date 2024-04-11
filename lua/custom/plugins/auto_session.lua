-- Plugin to save and restore session automatically.
return {
    'rmagatti/auto-session',
    lazy = false,
    opts = {
        log_level = 'error',
        auto_session_suppress_dirs = { '~/', '/' },
        auto_session_enabled = true,
        auto_session_create_enabled = true,
        auto_restore_enabled = true,
        auto_session_enable_last_session = vim.loop.cwd() == vim.loop.os_homedir(),
        session_lens = {
            buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
            load_on_setup = true,
            theme_conf = { border = true },
            previewer = false,
        },
        pre_save_cmds = { 'Neotree close' },
        -- post_restore_cmds = { 'Neotree toggle ' },
    },
    keys = {
        {
            '<leader>ls',
            function()
                require('auto-session.session-lens').search_session()
            end,
            desc = 'Telescope Search AutoSession',
        },
    },
}
