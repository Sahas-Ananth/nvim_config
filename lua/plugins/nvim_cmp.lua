-- Autocompletion plugin
-- Repo: https://github.com/hrsh7th/nvim-cmp

--- @type LazySpec
return {
    'hrsh7th/nvim-cmp',
    event = { 'InsertEnter', 'CmdlineEnter' },
    enabled = true,
    dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        'L3MON4D3/LuaSnip',
        { 'saadparwaiz1/cmp_luasnip', lazy = true },

        -- Adds LSP completion capabilities
        { 'hrsh7th/cmp-nvim-lsp', lazy = true, config = true },

        -- Additional Cmp sources
        { 'micangl/cmp-vimtex', lazy = true, config = true },
        { 'hrsh7th/cmp-path', lazy = true },
        { 'hrsh7th/cmp-buffer', lazy = true },
        { 'hrsh7th/cmp-cmdline', lazy = true },

        -- LSP Kind Icons (Nicer icons in CMP.)
        { 'onsails/lspkind.nvim', lazy = true, config = true },
        'windwp/nvim-autopairs',
        'zbirenbaum/copilot.lua',
    },
    opts = function()
        local cmp = require 'cmp'
        local luasnip = require 'luasnip'

        local winhighlight = {
            winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
        }

        return {
            view = {
                entries = {
                    follow_cursor = true,
                },
            },
            formatting = {
                format = require('lspkind').cmp_format {
                    symbol_map = { Copilot = '' },
                    maxwidth = 30,
                    show_labelDetails = true,
                },
            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },
            window = {
                completion = cmp.config.window.bordered(winhighlight),
                documentation = cmp.config.window.bordered(winhighlight),
            },
            sorting = {
                comparators = {
                    cmp.config.compare.offset,
                    cmp.config.compare.exact,
                    cmp.config.compare.score,
                    -- Copied from TJ who copied from cmp-under. better sorting for stuff that starts with __.
                    function(entry1, entry2)
                        local _, entry1_under = entry1.completion_item.label:find '^_+'
                        local _, entry2_under = entry2.completion_item.label:find '^_+'
                        entry1_under = entry1_under or 0
                        entry2_under = entry2_under or 0
                        if entry1_under > entry2_under then
                            return false
                        elseif entry1_under < entry2_under then
                            return true
                        end
                    end,
                    cmp.config.compare.kind,
                    cmp.config.compare.sort_text,
                    cmp.config.compare.length,
                    cmp.config.compare.order,
                },
            },

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
                { name = 'buffer' },
                { name = 'copilot' },
                { name = 'path' },
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
