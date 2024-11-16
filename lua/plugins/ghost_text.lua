-- Ghost text plugin for Nvim

--- @type LazyPlugin
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
