-- Neovim Fold Plugin
--- @type LazySpec
return {
    'kevinhwang91/nvim-ufo',
    dependencies = 'kevinhwang91/promise-async',
    event = 'VeryLazy',
    event = 'BufRead',
    opts = {
        -- INFO: Uncomment to use treeitter as fold provider, otherwise nvim lsp is used
        -- provider_selector = function(bufnr, filetype, buftype)
        --     return { 'treesitter', 'indent' }
        -- end,
        open_fold_hl_timeout = 400,
        close_fold_kinds_for_ft = { default = { 'imports', 'comment' } },
        preview = {
            win_config = {
                border = { '', '─', '', '', '', '─', '', '' },
                -- winhighlight = "Normal:Folded",
                winblend = 0,
            },
            mappings = {
                scrollU = '<C-u>',
                scrollD = '<C-d>',
                jumpTop = '[',
                jumpBot = ']',
            },
        },
    },
    init = function()
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        vim.o.foldcolumn = 'auto:2' -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
    end,
    config = function(_, opts)
        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local totalLines = vim.api.nvim_buf_line_count(0)
            local foldedLines = endLnum - lnum
            local suffix = (' 󰁂 %d %d%%'):format(foldedLines, foldedLines / totalLines * 100)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            local rAlignAppndx = math.max(math.min(vim.opt.textwidth['_value'], width - 1) - curWidth - sufWidth, 0)
            suffix = (' '):rep(rAlignAppndx) .. suffix
            table.insert(newVirtText, { suffix, 'MoreMsg' })
            return newVirtText
        end
        opts['fold_virt_text_handler'] = handler

        -- Custom Fold By Filetype -- Sahas -- Copied from: https://github.com/kevinhwang91/nvim-ufo/blob/553d8a9c611caa9f020556d4a26b760698e5b81b/doc/example.lua#L4
        -- local ftMap = {
        --     vim = 'indent',
        --     -- python = { 'indent' },
        --     git = '',
        -- }
        --
        -- local fold_by_ft_handler = function(bufnr, filetype, buftype)
        --     return ftMap[filetype]
        -- end
        -- opts['provider_selector'] = fold_by_ft_handler

        -- Make YAML LS work maybe? This works but I think this is better: https://github.com/redhat-developer/yaml-language-server/issues/912#issuecomment-1984586934
        -- local capabilities = vim.lsp.protocol.make_client_capabilities()
        -- capabilities.textDocument.foldingRange = {
        --     dynamicRegistration = false,
        --     lineFoldingOnly = true,
        -- }
        -- local language_servers = require('lspconfig').util.available_servers() -- or list servers manually like {'gopls', 'clangd'}
        -- for _, ls in ipairs(language_servers) do
        --     require('lspconfig')[ls].setup {
        --         capabilities = capabilities,
        --         -- you can add other fields for setting up lsp server in this table
        --     }
        -- end
        -- Custom Fold By Filetype -- Sahas

        require('ufo').setup(opts)
        vim.keymap.set('n', 'zR', require('ufo').openAllFolds, { desc = 'UFO: Open all folds' })
        vim.keymap.set('n', 'zM', require('ufo').closeAllFolds, { desc = 'UFO: Close all folds' })
        vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds, { desc = 'UFO: Open all folds except kinds' })
        vim.keymap.set('n', 'zk', require('ufo').peekFoldedLinesUnderCursor, { desc = 'UFO: Peek under fold.' })
    end,
}
