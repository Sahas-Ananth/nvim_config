-- Ghost text plugin for Nvim

--- @type LazySpec
return {
    'raghur/vim-ghost',
    build = ':GhostInstall',
    cmd = {
        'GhostStart',
        'GhostStop',
        'GhostToggleSync',
        'GhostSync',
    },
}
