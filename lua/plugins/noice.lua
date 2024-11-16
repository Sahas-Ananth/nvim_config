-- Better looking UI for messages and command prompt.
---@type NoiceRouteConfig[]
local routes = {
    -- redirect to popup when message is long
    -- { filter = { min_height = 10 }, view = 'split' },

    -- write/deletion messages
    { filter = { event = 'msg_show', find = '%d+B written$' }, view = 'mini' },
    { filter = { event = 'msg_show', find = 'yanked' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '%d+L, %d+B$' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '%-%-No lines in buffer%-%-' }, view = 'mini' },

    -- redo/undo messages
    { filter = { event = 'msg_show', find = '%d+ changes?; %a+ #%d+' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '1 more line' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '1 line less' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '%d+ more lines' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '%d+ fewer lines' }, view = 'mini' },
    { filter = { event = 'msg_show', find = '^Already at %a+ change$' }, view = 'mini' },

    -- unneeded info on search patterns
    { filter = { event = 'msg_show', find = '^E486: Pattern not found' }, view = 'mini' },

    { filter = { event = 'notify', find = 'completion request failed' }, skip = true },
    { filter = { event = 'msg_show', find = 'codeium.log' }, skip = true },

    -- Word added to spellfile via `zg`
    { filter = { event = 'msg_show', find = '^Word .*%.add$' }, view = 'mini' },

    -- Diagnostics
    {
        filter = { event = 'msg_show', find = 'No more valid diagnostics to move to' },
        view = 'mini',
    },
    { filter = { find = 'coding standard is not installed' }, view = 'mini' },

    -- Copilot
    { filter = { find = '%[Copilot%] Offline', event = 'msg_show' }, skip = true },
    { filter = { find = 'Hunk %d+ of %d+', event = 'msg_show' }, skip = true },

    -- :make
    -- { filter = { event = 'msg_show', find = '^:!make' }, skip = true },
    -- { filter = { event = 'msg_show', find = '^%(%d+ of %d+%):' }, skip = true },

    -----------------------------------------------------------------------------
    -- {
    --     filter = {
    --         event = 'lsp',
    --         kind = 'progress',
    --         cond = function(message)
    --             local client = vim.tbl_get(message.opts, 'progress', 'client')
    --             return client == 'lua_ls'
    --         end,
    --     },
    --     opts = { skip = true },
    -- },
    -- { -- nvim-early-retirement
    --     filter = {
    --         event = 'notify',
    --         cond = function(msg)
    --             return msg.opts and msg.opts.title == 'Auto-Closing Buffer'
    --         end,
    --     },
    --     view = 'mini',
    -- },

    -- nvim-treesitter
    { filter = { event = 'msg_show', find = '^%[nvim%-treesitter%]' }, view = 'mini' },
    { filter = { event = 'notify', find = 'All parsers are up%-to%-date' }, view = 'mini' },

    -- LSP
    { filter = { event = 'notify', find = 'Restarting…' }, view = 'mini' },

    -- Mason
    { filter = { event = 'notify', find = '%[mason%-tool%-installer%]' }, view = 'mini' },
    {
        filter = {
            event = 'notify',
            cond = function(msg)
                return msg.opts and msg.opts.title and msg.opts.title:find 'mason.*.nvim'
            end,
        },
        view = 'mini',
    },
}

--- @type LazyPlugin
return {
    'folke/noice.nvim',
    event = 'VeryLazy',
    enabled = true,
    opts = {
        -- add any options here
        lsp = {
            -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
            override = {
                ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
                ['vim.lsp.util.stylize_markdown'] = true,
                ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
            },
        },
        presets = {
            bottom_search = false, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = true, -- add a border to hover docs and signature help
        },
        routes = routes,
    },
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        { 'MunifTanjim/nui.nvim', lazy = true },
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        -- 'rcarriga/nvim-notify',
        -- 'hrsh7th/nvim-cmp',
    },
}
