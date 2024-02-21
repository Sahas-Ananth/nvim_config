-- Plugin to automatically save the current document.

return {
    'okuuva/auto-save.nvim',
    config = function()
        require('auto-save').setup {
            debounce_delay = 10000,
        }
    end,
}
