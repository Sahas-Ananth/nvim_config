-- Desc: A lua neovim plugin to generate shareable file permalinks (with line ranges) for several git web frontend hosts
-- URL: https://github.com/ruifm/gitlinker.nvim

--- @type LazySpec
return {
    'ruifm/gitlinker.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    opts = {
        callbacks = {
            ['sahas_gh'] = function()
                return require('gitlinker.hosts').get_github_type_url
            end,
        },
        mappings = nil,
    },
    keys = {
        {
            '<leader>hl',
            '<cmd>lua require"gitlinker".get_buf_range_url("n")<cr>',
            mode = 'n',
            desc = 'git [l]ink to line',
            silent = true,
        },
        {
            '<leader>hl',
            '<cmd>lua require"gitlinker".get_buf_range_url("v")<cr>',
            mode = 'v',
            desc = 'git [l]ink to line',
            silent = true,
        },
    },
}
