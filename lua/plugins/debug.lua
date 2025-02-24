--- @type LazySpec
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
    },
    keys = {
        {
            '<leader>db',
            function()
                require('dap').toggle_breakpoint()
            end,
            desc = 'Toggle Breakpoint',
        },
        {
            '<leader>dB',
            function()
                require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ')
            end,
            desc = 'Breakpoint Condition',
        },
        {
            '<F1>',
            function()
                require('dap').step_into()
            end,
            desc = 'Step Into',
        },
        {
            '<F2>',
            function()
                require('dap').step_over()
            end,
            desc = 'Step Over',
        },
        {
            '<F3>',
            function()
                require('dap').step_out()
            end,
            desc = 'Step Out',
        },
        {
            '<F4>',
            function()
                require('dap').terminate()
            end,
            desc = 'Stop',
        },
        {
            '<F5>',
            function()
                require('dap').continue()
            end,
            desc = 'Run/Continue',
        },
        {
            '<leader>dl',
            function()
                require('dap').list_breakpoints()
            end,
            desc = 'List Breakpoints',
        },
        {
            '<leader>dc',
            function()
                require('dap').clear_breakpoints()
            end,
            desc = 'Clear Breakpoints',
        },
        {
            '<leader>du',
            function()
                require('dapui').toggle()
            end,
            desc = 'See Last Session.',
        },
        -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
        {
            '<leader>dR',
            function()
                require('dap').run_to_cursor()
            end,
            desc = 'Run to Cursor',
        },
        {
            '<leader>dg',
            function()
                require('dap').goto_()
            end,
            desc = 'Go to Line (No Execute)',
        },
        {
            '<leader>dj',
            function()
                require('dap').down()
            end,
            desc = 'Down',
        },
        {
            '<leader>dk',
            function()
                require('dap').up()
            end,
            desc = 'Up',
        },
        {
            '<leader>dl',
            function()
                require('dap').run_last()
            end,
            desc = 'Run Last',
        },
        {
            '<leader>dC',
            function()
                require('dap').pause()
            end,
            desc = 'Pause',
        },
        {
            '<leader>dr',
            function()
                require('dap').repl.toggle()
            end,
            desc = 'Toggle REPL',
        },
        {
            '<leader>dS',
            function()
                require('dap').session()
            end,
            desc = 'Session',
        },
        {
            '<leader>dw',
            function()
                require('dap.ui.widgets').hover()
            end,
            desc = 'Widgets',
        },
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
        dapui.setup {}
        vim.fn.sign_define('DapBreakpoint', {
            -- text = '🔴',
            text = '',
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
        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
}
