--- @type LazyPlugin
return {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
        { 'nvim-treesitter/nvim-treesitter-textobjects', event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' } },
        'nvim-treesitter/nvim-treesitter-context',
        'windwp/nvim-ts-autotag',
        { 'andymass/vim-matchup', lazy = true },
    },
    build = ':TSUpdate',
    lazy = true, -- vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    opts = {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'c', 'cpp', 'lua', 'python', 'rust', 'vimdoc', 'vim', 'bash' },

        -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
        auto_install = true,
        -- Install languages synchronously (only applied to `ensure_installed`)
        sync_install = false,
        -- List of parsers to ignore installing
        ignore_install = { 'latex' },
        -- You can specify additional Treesitter modules here: -- For example: -- playground = {--enable = true,-- },
        modules = {},
        highlight = { enable = true, disable = { 'latex' }, additional_vim_regex_highlighting = { 'latex', 'markdown' } },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = '<c-space>',
                node_incremental = '<c-space>',
                scope_incremental = '<c-s>',
                node_decremental = '<M-space>',
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ['aa'] = '@parameter.outer',
                    ['ia'] = '@parameter.inner',
                    ['af'] = '@function.outer',
                    ['if'] = '@function.inner',
                    ['ac'] = '@class.outer',
                    ['ic'] = '@class.inner',
                    ['as'] = { query = '@local.scope.outer', query_group = 'locals' },
                    ['is'] = { query = '@local.scope.inner', query_group = 'locals' },
                    ['al'] = '@loop.outer',
                    ['il'] = '@loop.inner',
                    ['an'] = '@call.outer',
                    ['in'] = '@call.inner',
                    ['a='] = '@assignment.outer',
                    ['i='] = '@assignment.inner',
                    ['l='] = '@assignment.lhs',
                    ['r='] = '@assignment.rhs',
                    ['ao'] = '@comment.outer',
                    ['io'] = '@comment.inner',
                    ['ad'] = '@condition.outer',
                    ['id'] = '@condition.inner',
                },
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    [']]'] = '@function.outer',
                    [']m'] = '@class.outer',
                    [']n'] = '@conditional.outer',
                    [']a'] = '@assignment.outer',
                    [']l'] = '@loop.outer',
                    [']p'] = '@parameter.outer',
                    [']o'] = '@comment.outer',
                    -- [']n'] = '@call.outer',
                },
                goto_next_end = {
                    [']['] = '@function.outer',
                    [']M'] = '@class.outer',
                    [']N'] = '@conditional.outer',
                    [']A'] = '@assignment.outer',
                    [']L'] = '@loop.outer',
                    [']P'] = '@parameter.outer',
                    [']O'] = '@comment.outer',
                    -- [']N'] = '@call.outer',
                },
                goto_previous_start = {
                    ['[['] = '@function.outer',
                    ['[m'] = '@class.outer',
                    ['[n'] = '@conditional.outer',
                    ['[a'] = '@assignment.outer',
                    ['[l'] = '@loop.outer',
                    ['[p'] = '@parameter.outer',
                    ['[o'] = '@comment.outer',
                    -- ['[n'] = '@call.outer',
                },
                goto_previous_end = {
                    ['[]'] = '@function.outer',
                    ['[M'] = '@class.outer',
                    ['[N'] = '@conditional.outer',
                    ['[A'] = '@assignment.outer',
                    ['[L'] = '@loop.outer',
                    ['[P'] = '@parameter.outer',
                    ['[O'] = '@comment.outer',
                    -- ['[N'] = '@call.outer',
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ['<leader>a'] = '@parameter.inner',
                },
                swap_previous = {
                    ['<leader>A'] = '@parameter.inner',
                },
            },
            lsp_interop = {
                enable = true,
                border = 'none',
                floating_preview_opts = {},
                peek_definition_code = {
                    ['<leader>pf'] = '@function.outer',
                    ['<leader>pc'] = '@class.outer',
                },
            },
        },
        autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
        },
        matchup = {
            enable = true,
        },
    },
}
