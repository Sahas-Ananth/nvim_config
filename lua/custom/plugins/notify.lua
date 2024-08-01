-- Nvim Notify for better notifications.

return {
    'rcarriga/nvim-notify',
    opts = {
        time_formats = {
            notification = '%c',
            notification_history = '%c',
        },
        -- timeout = 1000,
        -- render = 'wrapped-compact',
        -- max_width = 35,
        top_down = false,
        stages = 'static',
    },
}
