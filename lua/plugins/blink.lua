-- A faster alternative for nvim-cmp

--- @type LazySpec
return {
    'saghen/blink.cmp',
    version = '*',
    enabled = true,
    dependencies = {
        'L3MON4D3/LuaSnip',
        'giuxtaposition/blink-cmp-copilot',
        'folke/lazydev.nvim',
    },
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'fallback' },
            ['<S-Tab>'] = { 'fallback' },
            ['<C-k>'] = { 'snippet_forward', 'fallback' },
            ['<C-j>'] = { 'snippet_backward', 'fallback' },
        },
        appearance = {
            -- Sets the fallback highlight groups to nvim-cmp's highlight groups
            -- Useful for when your theme doesn't support blink.cmp
            -- Will be removed in a future release
            -- use_nvim_cmp_as_default = true,
            -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
            -- Adjusts spacing to ensure icons are aligned
            nerd_font_variant = 'mono',
        },
        snippets = { preset = 'luasnip' },
        sources = {
            default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
            providers = {
                lazydev = {
                    name = 'LazyDev',
                    module = 'lazydev.integrations.blink',
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
                copilot = {
                    name = 'copilot',
                    module = 'blink-cmp-copilot',
                    -- score_offset = 100,
                    async = true,
                },
            },
        },
        completion = {
            keyword = { range = 'full' },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                window = {
                    border = 'single',
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
                },
            },
            ghost_text = { enabled = true },
            trigger = {
                show_on_insert_on_trigger_character = true,
                show_on_x_blocked_trigger_characters = { "'", '"', '(', '{', '[' },
            },
            menu = {
                winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
                border = 'single',
                draw = {
                    columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
                },
            },
        },
        signature = { enabled = true, window = { border = 'single' } },
    },
    opts_extend = { 'sources.default' },
}
--[[ return {
    'Sahas-Ananth/blink.cmp',
    dir = '/home/sahas/Documents/Projects/blink.cmp',
    dev = true,
    event = 'VimEnter',
    enabled = false,
    -- optional: provides snippets for the snippet source
    dependencies = {
        'L3MON4D3/LuaSnip',
        'giuxtaposition/blink-cmp-copilot',
    },

    -- use a release tag to download pre-built binaries
    -- version = 'v0.*',
    build = 'cargo build --release',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        -- 'default' for mappings similar to built-in completion
        keymap = {
            preset = 'default',
            ['<Tab>'] = { 'fallback' },
            ['<S-Tab>'] = { 'fallback' },
            ['<C-k>'] = { 'snippet_forward', 'fallback' },
            ['<C-j>'] = { 'snippet_backward', 'fallback' },
        },

        snippets = {
            expand = function(snippet)
                require('luasnip').lsp_expand(snippet)
            end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction)
                require('luasnip').jump(direction)
            end,
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
        },
        completion = {
            accept = {
                auto_brackets = { enabled = false },
            },
            menu = {
                winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
                draw = {
                    columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon', 'kind', gap = 1 } },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 0,
                update_delay_ms = 0,
                window = {
                    winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
                },
            },
            ghost_text = {
                enabled = false,
            },
        },

        -- default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, via `opts_extend`
        sources = {
            default = { 'lsp', 'path', 'luasnip', 'buffer', 'lazydev', 'copilot' },
            -- default = { 'luasnip' },
            providers = {
                lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', fallbacks = { 'lsp' } },
                copilot = {
                    name = 'copilot',
                    module = 'blink-cmp-copilot',
                    score_offset = 100,
                    async = true,
                    -- enabled = not require('copilot.client').is_disabled(),
                    transform_items = function(_, items)
                        local CompletionItemKind = require('blink.cmp.types').CompletionItemKind
                        local kind_idx = #CompletionItemKind + 1
                        CompletionItemKind[kind_idx] = 'Copilot'
                        for _, item in ipairs(items) do
                            item.kind = kind_idx
                        end
                        return items
                    end,
                },
            },
        },

        -- experimental signature help support
        signature = {
            enabled = true,
            window = {
                winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel',
            },
        },
    },
    -- allows extending the providers array elsewhere in your config
    -- without having to redefine it
    opts_extend = { 'sources.default' },
} ]]
