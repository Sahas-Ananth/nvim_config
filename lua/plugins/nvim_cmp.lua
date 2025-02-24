-- Autocompletion plugin
-- Repo: https://github.com/hrsh7th/nvim-cmp

--- @type LazySpec
return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        --- @type LazyPlugin
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                -- Build Step is needed for regex support in snippets.
                -- This step is not supported in many windows environments.
                -- Remove the below condition to re-enable on windows.
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
            dependencies = {
                -- Adds a number of user-friendly snippets
                'rafamadriz/friendly-snippets',
                lazy = true,
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
            opts = {
                keep_roots = true,
                link_roots = true,
                link_children = true,
                exit_roots = false,
                update_events = { 'TextChanged', 'TextChangedI' },
                enable_autosnippets = true,
            },
        },
        { 'saadparwaiz1/cmp_luasnip', lazy = true },

        -- Adds LSP completion capabilities
        { 'hrsh7th/cmp-nvim-lsp', lazy = true },
        { 'hrsh7th/cmp-path', lazy = true },

        -- Additional Cmp sources
        { 'hrsh7th/cmp-path', lazy = true },
        { 'hrsh7th/cmp-buffer', lazy = true },
        { 'hrsh7th/cmp-cmdline', lazy = true },

        -- LSP Kind Icons (Nicer icons in CMP.)
        { 'onsails/lspkind.nvim', lazy = true },

        -- Autopair plugin.
        -- Repo: https://github.com/windwp/nvim-autopairs
        {
            'windwp/nvim-autopairs',
            event = 'InsertEnter',
            config = true,
        },
    },
    opts = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        return {
            view = {
                entries = {
                    follow_cursor = true,
                },
            },
            formatting = {
                format = require('lspkind').cmp_format {
                    symbol_map = { Copilot = '' },
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },
            mapping = cmp.mapping.preset.insert {
                ['<C-n>'] = cmp.mapping.select_next_item(),
                ['<C-p>'] = cmp.mapping.select_prev_item(),
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete {},
                ['<C-CR>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = false,
                },
                ['<C-k>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-j>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
            },
            sources = {
                -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
                { name = 'lazydev', group_index = 0 },
                { name = 'vimtex' },
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
                { name = 'buffer' },
                { name = 'copilot' },
            },
        }
    end,
    config = function(_, opts)
        local cmp = require 'cmp'
        cmp.setup(opts)
        cmp.event:on('confirm_done', require('nvim-autopairs.completion.cmp').on_confirm_done())
        vim.api.nvim_set_hl(0, 'CmpItemKindCopilot', { fg = '#6CC644' })
        -- `/` cmdline setup.
        cmp.setup.cmdline('/', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            },
        })

        -- `:` cmdline setup.
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'cmdline' },
            }, {
                { name = 'path' },
                { name = 'buffer', keyword_length = 2 },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })
    end,
}
