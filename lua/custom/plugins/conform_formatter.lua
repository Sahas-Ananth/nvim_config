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
            latex = { 'latexindent' },
            markdown = { 'markdown-toc', 'mdformat' },
            lua = { 'stylua' },
            ['*'] = { 'codespell' },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 500,
        },
    },
}
