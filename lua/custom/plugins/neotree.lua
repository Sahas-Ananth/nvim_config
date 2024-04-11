-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd [[ let g:neo_tree_remove_legacy_commands = 1 ]]

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      popup_border_style = 'rounded',
      -- enable_normal_mode_for_inputs = true,
      filesystem = {
        follow_current_file = {
          enabled = false,         -- This will find and focus the file in the active buffer every time
          -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
        hijack_netrw_behavior = 'open_default',
      },
      event_handlers = {
        {
          event = 'neo_tree_buffer_enter',
          handler = function()
            vim.cmd [[ setlocal relativenumber ]]
            vim.cmd [[ setlocal number ]]
          end,
        },
        {
          event = 'neo_tree_popup_input_ready',
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            vim.cmd 'stopinsert'
            vim.keymap.set('i', '<esc>', vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    }
  end,
}
-- Look at: https://github.com/nvim-neo-tree/neo-tree.nvim/issues/943 if you don't want netrw to flash.
