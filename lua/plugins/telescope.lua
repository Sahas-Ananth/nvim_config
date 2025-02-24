--- @type LazyPlugin
return {
    'nvim-telescope/telescope.nvim',
    -- event = { 'VimEnter' },
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- Fuzzy Finder Algorithm which requires local dependencies to be built.
        -- Only load if `make` is available. Make sure you have the system
        -- requirements installed.
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            -- NOTE: If you are having trouble with this installation,
            --       refer to the README for telescope-fzf-native for more instructions.
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        -- Pretty UI selection menu.
        'nvim-telescope/telescope-ui-select.nvim',

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    keys = {
        {
            '<leader>sG',
            function()
                local function find_git_root()
                    -- Use the current buffer's path as the starting point for the git search
                    local current_file = vim.api.nvim_buf_get_name(0)
                    local current_dir
                    local cwd = vim.fn.getcwd()
                    -- If the buffer is not associated with a file, return nil
                    if current_file == '' then
                        current_dir = cwd
                    else
                        -- Extract the directory from the current file's path
                        current_dir = vim.fn.fnamemodify(current_file, ':h')
                    end

                    -- Find the Git root directory from the current file's path
                    local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')[1]
                    if vim.v.shell_error ~= 0 then
                        print 'Not a git repository. Searching on current working directory'
                        return cwd
                    end
                    return git_root
                end

                local git_root = find_git_root()
                if git_root then
                    require('telescope.builtin').live_grep {
                        search_dirs = { git_root },
                    }
                end
            end,
            desc = '[S]earch by [G]rep on Git Root',
        },
        {
            '<leader>s/',
            function()
                require('telescope.builtin').live_grep {
                    grep_open_files = true,
                    prompt_title = 'Live Grep in Open Files',
                }
            end,
            desc = '[S]earch [/] in Open Files',
        },
        {
            '<leader>/',
            function()
                -- You can pass additional configuration to telescope to change theme, layout, etc.
                require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
                    winblend = 10,
                    previewer = false,
                })
            end,
            desc = '[/] Fuzzily search in current buffer',
        },
        { '<leader>?', '<cmd>Telescope oldfiles<cr>', desc = '[?] Find recently opened files' },
        { '<leader><space>', '<cmd>Telescope buffers<cr>', desc = '[ ] Find existing buffers' },
        { '<leader>ss', '<cmd>Telescope builtin<cr>', desc = '[S]earch [S]elect Telescope' },
        { '<leader>gf', '<cmd>Telescope git_files<cr>', desc = 'Search [G]it [F]iles' },
        { '<leader>sf', '<cmd>Telescope find_files<cr>', desc = '[S]earch [F]iles' },
        { '<leader>sh', '<cmd>Telescope help_tags<cr>', desc = '[S]earch [H]elp' },
        { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
        { '<leader>sg', '<cmd>Telescope live_grep<cr>', desc = '[S]earch by [G]rep' },
        { '<leader>sd', '<cmd>Telescope diagnostics<cr>', desc = '[S]earch [D]iagnostics' },
        { '<leader>sr', '<cmd>Telescope resume<cr>', desc = '[S]earch [R]esume' },
        {
            '<leader>ec',
            function()
                require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
            end,
            desc = '[E]dit Config Files',
        },
    },
    config = function()
        require('telescope').setup {
            extensions = {
                fzf = {
                    fuzzy = true, -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true, -- override the file sorter
                    case_mode = 'smart_case', -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                },
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }
        pcall(require('telescope').load_extension, 'fzf')
    end,
}
