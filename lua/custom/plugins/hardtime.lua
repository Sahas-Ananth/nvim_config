-- Plugin that will make you use the homerow keys for navigation, reduce mouse usage, and make you a better Vim user.

--- @type LazyPlugin
return {
    'm4xshen/hardtime.nvim',
    enabled = false,
    opts = {
        -- max_time = 0,
        disable_mouse = false,
        disabled_filetypes = { 'neo-tree', 'neo-tree-popup', 'notify', 'lazy', 'mason', 'oil' },
    },
}
