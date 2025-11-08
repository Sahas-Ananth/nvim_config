-- Desc: GitHub plugin to review and create PRs
-- URL: https://www.github.com/pwntester/octo.nvim

--- @type LazySpec
return {
    'pwntester/octo.nvim',
    enabled = true,
    cmd = 'Octo',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        mappings_disable_default = true,
        picker = 'snacks',
    },
    config = function(_, opts)
        require('octo').setup(opts)
    end,
}
