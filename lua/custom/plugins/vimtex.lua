-- Plugin to enable vimtex for latex files

require('which-key').add {
    { '<leader>l', group = 'Vimtex' },
    { '<leader>ll', desc = 'Compi[l]e' },
    { '<leader>lL', desc = 'Compile Se[L]ected' },
    { '<leader>li', desc = '[i]nfo' },
    { '<leader>lI', desc = '[I]nfo full' },
    { '<leader>lt', desc = '[t]OC' },
    { '<leader>lT', desc = '[T]oggle TOC' },
    { '<leader>lq', desc = '[l]og' },
    { '<leader>lv', desc = '[v]iew' },
    { '<leader>lr', desc = '[r]everse search' },
    { '<leader>lk', desc = '[k]ill' },
    { '<leader>lK', desc = '[K]ill all' },
    { '<leader>le', desc = '[e]rrors' },
    { '<leader>lo', desc = 'Compile [O]utput' },
    { '<leader>lg', desc = 'Status' },
    { '<leader>lG', desc = 'Full Status' },
    { '<leader>lc', desc = '[c]lean' },
    { '<leader>lC', desc = 'Full [C]lean' },
    { '<leader>lx', desc = 'Reload' },
    { '<leader>lX', desc = 'Reload State' },
    { '<leader>lm', desc = 'Insert [m]aps list' },
    { '<leader>ls', desc = 'Toggle main' },
    { '<leader>la', desc = 'Context menu' },
}

return {
    'lervag/vimtex',
    lazy = false,
    dependencies = {
        'micangl/cmp-vimtex',
    },
    init = function()
        vim.g.vimtex_view_general_viewer = 'okular'
        vim.g.vimtex_view_general_options = '--unique file:@pdf#src:@line@tex'
        vim.g.vimtex_imaps_leader = ';'
        vim.g.vimtex_delim_stopline = 200
        vim.g.vimtex_compiler_latexmk = {
            aux_dir = './build',
            out_dir = '.',
            options = {
                '-shell-escape',
                '-verbose',
                '-file-line-error',
                '-synctex=1',
                '-interaction=nonstopmode',
            },
        }
        vim.g.vimtex_quickfix_open_on_warning = 0
        vim.g.vimtex_syntax_packages = {
            minted = { load = 2 },
        }
        -- TODO: Try setting this see: https://ejmastnak.com/tutorials/vim-latex/vimtex/#example-change-delim
        -- vim.g.vimtex_delim_toggle_mod_list = {
        --     { '\\left', '\\right' },
        --     { '\\big',  '\\big' },
        -- }
    end,
}
