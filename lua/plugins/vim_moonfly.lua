return {
    'bluz71/vim-moonfly-colors',
    name = 'moonfly',
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.moonflyCursorColor = true
        vim.g.moonflyVirtualTextColor = true
        vim.g.moonflyNormalFloat = true
        vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋' }
        vim.g.moonflyWinSeparator = 2
        vim.cmd.colorscheme 'moonfly'
    end,
}