-- FileTree plugin.

-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
    local dir = require('oil').get_current_dir()
    if dir then
        return vim.fn.fnamemodify(dir, ':~')
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

--- @type LazySpec
return {
    'stevearc/oil.nvim',
    lazy = false,
    opts = {
        default_file_explorer = true,
        delete_to_trash = true,
        skip_confirm_for_simple_edits = true,
        prompt_save_on_new_entry = false,
        watch_for_changes = true,
        buf_options = {
            buflisted = false,
            bufhidden = 'hide',
        },
        win_options = { wrap = true, winbar = '%!v:lua.get_oil_winbar()' },
        keymaps = {
            ['gd'] = {
                desc = 'Toggle file detail view',
                callback = function()
                    detail = not detail
                    if detail then
                        require('oil').set_columns { 'icon', 'permissions', 'size', 'mtime' }
                    else
                        require('oil').set_columns { 'icon' }
                    end
                end,
            },
        },
    },
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
        {
            '-',
            '<cmd>Oil<CR>',
            mode = 'n',
            desc = 'Oil',
        },
    },
}
