-- Plugin to generate Documentation/Docstrings

return {
    'danymat/neogen',
    dependencies = 'nvim-treesitter/nvim-treesitter',
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
}
