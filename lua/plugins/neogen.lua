-- Plugin to generate Documentation/Docstrings
--- @type LazyPlugin
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
}
