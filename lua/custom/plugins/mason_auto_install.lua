-- Plugin to automatically install Mason plugins if not installed.
-- Useful link:
-- https://www.josean.com/posts/neovim-linting-and-formatting

return {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = {
        'williamboman/mason.nvim',
    },
    opts = {
        ensure_installed = {
            'black',
            'clang-format',
            'cmakelint',
            'cmakelang',
            'debugpy',
            'isort',
            'latexindent',
            'markdown-toc',
            'marksman',
            'mdformat',
            'mypy',
            'stylua',
            'ruff',
        },
    },
}
-- Stuff installed in NAIL lab computer:
--  bash-debug-adapter
--  bash-language-server bashls, bashls
--  beautysh
--  bibtex-tidy
--  black
--  clang-format
--  clangd
--  cmakelint
--  codespell
--  debugpy
--  gitlint
--  grammarly-languageserver grammarly, grammarly
--  html-lsp html, html
--  isort
--  latexindent
--  lua-language-server lua_ls, lua_ls
--  markdown-toc
--  marksman
--  mdformat
--  mypy
--  prettierd
--  pyright
--  ruff
--  shellcheck
--  stylua
--  yaml-language-server yamlls, yamlls
--  yamlfmt
--  yamllint
