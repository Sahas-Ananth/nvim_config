-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
    -- NOTE: Yes, you can install new plugins here!
    'mfussenegger/nvim-dap',
    lazy = true,
    -- NOTE: And you can specify dependencies as well
    dependencies = {
        -- Creates a beautiful debugger UI
        'rcarriga/nvim-dap-ui',
        'nvim-neotest/nvim-nio',

        -- Installs the debug adapters for you
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',

        'theHamsta/nvim-dap-virtual-text',

        -- Add your own debuggers here
        -- 'leoluz/nvim-dap-go',
    },
    config = function()
        local dap = require 'dap'
        local dapui = require 'dapui'

        require('nvim-dap-virtual-text').setup()

        require('mason-nvim-dap').setup {
            -- Makes a best effort to setup the various debuggers with
            -- reasonable debug configurations
            automatic_setup = true,

            -- You can provide additional configuration to the handlers,
            -- see mason-nvim-dap README for more information
            handlers = {},

            -- You'll need to check that you have the required things installed
            -- online, please don't ask me how to install them :)
            ensure_installed = {
                -- Update this to ensure that you have the debuggers for the langs you want
                'debugpy',
                -- FIX: DAP C++
                'codelldb',
                -- 'delve',
            },
        }

        -- Basic debugging keymaps, feel free to change to your liking!
        vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Debug: Start/Continue' })
        vim.keymap.set('n', '<F1>', dap.step_into, { desc = 'Debug: Step Into' })
        vim.keymap.set('n', '<F2>', dap.step_over, { desc = 'Debug: Step Over' })
        vim.keymap.set('n', '<F3>', dap.step_out, { desc = 'Debug: Step Out' })
        vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
        vim.keymap.set('n', '<leader>B', function()
            dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
        end, { desc = 'Debug: Set Breakpoint' })
        vim.keymap.set('n', '<F4>', dap.terminate, { desc = 'Debug: Terminate' })
        vim.keymap.set('n', '<F6>', dap.list_breakpoints, { desc = 'Debug: List Breakpoints' })
        vim.keymap.set('n', '<F7>', dap.clear_breakpoints, { desc = 'Debug: Clear Breakpoints' })

        -- Dap UI setup
        -- For more information, see |:help nvim-dap-ui|
        dapui.setup {
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            -- icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            -- controls = {
            --   icons = {
            --     pause = '⏸',
            --     play = '▶',
            --     step_into = '⏎',
            --     step_over = '⏭',
            --     step_out = '⏮',
            --     step_back = 'b',
            --     run_last = '▶▶',
            --     terminate = '⏹',
            --     disconnect = '⏏',
            --   },
            -- },
        }

        -- Sahas Debug Breakpoint UI colors given by: https://github.com/bluz71/vim-moonfly-colors/blob/master/lua/moonfly/init.lua
        vim.fn.sign_define('DapBreakpoint', {
            text = '🔴',
            texthl = 'MoonflyRed',
            linehl = '',
            numhl = 'MoonflyRed',
        })
        vim.fn.sign_define('DapBreakpointCondition', {
            text = '',
            texthl = 'MoonflyRed',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapBreakpointRejected', {
            text = '',
            texthl = 'MoonflyOrange',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapStopped', {
            text = '',
            texthl = 'MoonflyLime',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })
        vim.fn.sign_define('DapLogPoint', {
            text = '',
            texthl = 'MoonflyYellow',
            linehl = 'DapBreakpoint',
            numhl = 'DapBreakpoint',
        })

        -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set('n', '<F8>', dapui.toggle, { desc = 'Debug: See last session result.' })

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close

        -- Install golang specific config
        -- require('dap-go').setup()
    end,
}
