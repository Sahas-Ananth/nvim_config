-- Plugin to handle formatting.
--
return {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' }, -- to disable, comment this out
    cmd = { 'ConformInfo' },
    keys = {
        {
            -- Customize or remove this keymap to your liking
            '<leader>ff',
            function()
                require('conform').format { async = false, lsp_fallback = true }
            end,
            mode = '',
            desc = 'Format File or range (in visual mode).',
        },
    },
    opts = {
        formatters_by_ft = {
            python = { 'isort', 'black' },
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
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
        -- Modifying Latex Indent to take search for a local formatting specs. See: https://ctan.uib.no/support/latexindent/documentation/latexindent.pdf#page=98&zoom=264
        formatters = {
            latexindent = {
                prepend_args = { '-l', '-m' },
            },
        },
    },
}
