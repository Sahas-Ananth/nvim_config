-- Plugin to automatically save the current document.

--- @type LazySpec
return {
    'okuuva/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
        debounce_delay = 10000,
        condition = function(buf)
            if vim.bo[buf].filetype == 'harpoon' then
                return false
            end
            return true
        end,
    },
}
