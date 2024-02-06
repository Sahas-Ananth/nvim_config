-- Plugin that will make you use the homerow keys for navigation, reduce mouse usage, and make you a better Vim user.

return {
  "m4xshen/hardtime.nvim",
  opts = {
    max_time = 0,
    disable_mouse = false,
    disabled_filetypes = { 'neo-tree', "neo-tree-popup", "notify", "lazy", "mason" },
  },
}
