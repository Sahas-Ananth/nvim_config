-- Plugin to generate Documentation/Docstrings
--- @type LazySpec
return {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    cmd = 'Neogen',
    opts = {
        enabled = true,
        snippet_engine = 'luasnip',
        languages = {
            python = {
                template = {
                    annotation_convention = 'google_docstrings',
                },
            },
        },
    },
    keys = {
        {
            '<leader>gd',
            '<cmd>Neogen<cr>',
            desc = '[G]enerate [D]ocstring',
        },
    },
}
