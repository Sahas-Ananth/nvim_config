-- Plugin to view Markdown Files
--- @type LazySpec
return {
    'iamcco/markdown-preview.nvim',
    ft = { 'markdown' },
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install && git restore .',
    init = function()
        local g = vim.g
        g.mkdp_filetypes = { 'markdown' }
        g.mkdp_auto_start = 1
        g.mkdp_auto_close = 0
        g.mkdp_theme = 'light'
    end,
}
