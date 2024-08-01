-- GitHub Copilot Plugin.
-- This is the official plugin for GitHub Copilot.
-- return {
-- "github/copilot.vim",
-- }

-- When time permits, try and work with the unofficial plugin for GitHub Copilot which integrates well will nvim-cmp.
return {
    {
        'zbirenbaum/copilot.lua',
        cmd = 'Copilot',
        event = 'InsertEnter',
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
        config = function()
            require('copilot').setup {
                suggestion = { enabled = false },
                panel = { enabled = false },
                filetypes = { yaml = true, markdown = true, gitcommit = true, gitrebase = true },
            }
            vim.cmd 'silent! Copilot disable'
        end,
    },
    {
        'zbirenbaum/copilot-cmp',
        config = function()
            require('copilot_cmp').setup()
            vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
        end,
    },
}
