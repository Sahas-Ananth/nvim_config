return {
    'andrewferrier/debugprint.nvim',
    opts = {
        keymaps = {
            normal = {
                plain_below = '<leader>dp',
                plain_above = '<leader>dP',
                variable_below = '<leader>dv',
                variable_above = '<leader>dV',
                variable_below_alwaysprompt = nil,
                variable_above_alwaysprompt = nil,
                textobj_below = '<leader>do',
                textobj_above = '<leader>dO',
                toggle_comment_debug_prints = '<leader>dt',
                delete_debug_prints = '<leader>dD',
            },
            visual = {
                variable_below = '<leader>dv',
                variable_above = '<leader>dV',
            },
        },
    },
    lazy = true,
    version = '*',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
}
