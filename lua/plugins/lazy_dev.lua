--- @type LazySpec
return {
    {
        -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                -- Load luvit types when the `vim.uv` word is found
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                -- Load Lazy.nvim stuff
                'lazy.nvim',
                'Snacks',
                { path = '/usr/local/share/awesome/lib' },
                { path = '~/.config/awesome' },
            },
        },
    },
    { 'Bilal2453/luvit-meta', lazy = true },
}
