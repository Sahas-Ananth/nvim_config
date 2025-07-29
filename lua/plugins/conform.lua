--- @type LazySpec
return {
    'stevearc/conform.nvim',
    lazy = true,
    -- event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    init = function()
        vim.g.disable_autoformat = false
        vim.b.disable_autoformat = false
        vim.api.nvim_create_user_command('FormatDisable', function(args)
            if args.bang then
                -- FormatDisable! will disable formatting just for this buffer
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, {
            desc = 'Disable Autoformat',
            bang = true,
        })
        vim.api.nvim_create_user_command('FormatEnable', function(args)
            if args.bang then
                vim.b.disable_autoformat = false
            else
                vim.g.disable_autoformat = false
            end
        end, {
            desc = 'Enable Autoformat',
            bang = true,
        })
    end,
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>cf',
            function()
                require('conform').format { async = false, lsp_fallback = true }
            end,
            mode = '',
            desc = '[C]ode [F]ormat',
        },
    },
    opts = {
        formatters_by_ft = {
            python = { 'isort', 'black', 'docformatter' },
            bash = { 'beautysh' },
            bib = { 'bibtex-tidy' },
            c = { 'clang_format' },
            h = { 'clang_format' },
            cpp = { 'clang_format' },
            hpp = { 'clang_format' },
            cuda = { 'clang_format' },
            cmake = { 'cmake_format' },
            tex = { 'latexindent' },
            markdown = { 'markdown-toc' },
            lua = { 'stylua' },
            ['*'] = { 'codespell' },
        },
        format_on_save = function(bufnr)
            -- Disable with a global or buffer-local variable
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return {
                lsp_fallback = true,
                async = false,
                timeout_ms = 500,
            }
        end,
        -- Modifying Latex Indent to take search for a local formatting specs. See: https://ctan.uib.no/support/latexindent/documentation/latexindent.pdf#page=98&zoom=264
        formatters = {
            latexindent = {
                prepend_args = { '-l', '-m' },
            },
            -- cmake_format = {
            --     args = { '--tab-size 2', '--' },
            -- },
            docformatter = {
                prepend_args = { '--black' },
            },
        },
    },
}
