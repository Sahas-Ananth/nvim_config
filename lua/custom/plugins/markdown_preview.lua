-- Plugin to view Markdown Files
return {
  "iamcco/markdown-preview.nvim",
  ft = "markdown",
  cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
  build = function() vim.fn["mkdp#util#install"]() end,
  init = function()
    local g = vim.g
    g.mkdp_auto_start = 1
    g.mkdp_auto_close = 0
    g.mkdp_theme = 'light'
  end,
}
