--- @type LazySpec
return {
    'lervag/vimtex',
    lazy = false,
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
