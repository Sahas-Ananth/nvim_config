--- @type LazyPlugin
return {
    'tpope/vim-sleuth',
    event = { 'BufReadPost', 'BufWritePost', 'BufNewFile' },
}
