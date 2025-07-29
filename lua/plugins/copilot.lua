--- @type LazySpec
return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    -- dependencies = { 'zbirenbaum/copilot-cmp', config = true },
    build = ':Copilot auth',
    keys = {
        {
            '<leader>Tc',
            function()
                if require('copilot.client').is_disabled() then
                    require('copilot.command').enable()
                else
                    require('copilot.command').disable()
                end
            end,
            desc = 'Toggle Copilot',
        },
    },
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
    },
    config = function(_, opts)
        require('copilot').setup(opts)
        require('copilot.command').disable()
    end,
}
