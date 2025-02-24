--- @type LazySpec
return {
    'rmagatti/auto-session',
    lazy = false,
    init = function()
        vim.o.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions,resize'
    end,
    ---enables autocomplete for opts
    ---@module "auto-session"
    ---@type AutoSession.Config
    opts = {
        suppressed_dirs = { '/' },
        -- log_level = 'debug',
        session_lens = {
            -- buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
            load_on_setup = false,
            theme_conf = { border = true },
            previewer = false,
        },
    },
    keys = {
        {
            '<leader>sS',
            function()
                require('auto-session.session-lens').search_session {}
            end,
            desc = 'Telescope Search AutoSession',
        },
    },
}
