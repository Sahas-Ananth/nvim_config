-- Plugin to automatically save the current document.

return {
    'okuuva/auto-save.nvim',
    event = { 'InsertLeave', 'TextChanged' },
    opts = {
        debounce_delay = 10000,
    },
}
