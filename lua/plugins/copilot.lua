--- @type LazyPlugin
return {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    -- event = 'InsertEnter',
    dependencies = { 'zbirenbaum/copilot-cmp' },
    build = ':Copilot auth',
    keys = {
        {
            '<leader>tc',
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
        filetypes = { yaml = true, markdown = true, gitcommit = true, gitrebase = true },
    },
    -- config = function()
    --     vim.cmd 'silent! Copilot disable'
    --     vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
    -- end,
}
