-- Plugin that will do better % matchup.
return {
    'andymass/vim-matchup',
    enabled = true,
    dependencies = 'nvim-treesitter/nvim-treesitter',
    opts = {},
    lazy = true,
    config = function()
        require('nvim-treesitter.configs').setup {
            matchup = {
                enable = true,
            },
        }
    end,
}
