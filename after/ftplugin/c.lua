local function setMakeprgm()
    local cmake_path = vim.fn.getcwd() .. 'CMakeLists.txt'
    local make_path = vim.fn.getcwd() .. 'Makefile'
    local cmake_f = io.open(cmake_path, 'r')
    local make_f = io.open(make_path, 'r')
    if cmake_f ~= nil then
        io.close(cmake_f)
        vim.bo.makeprg = 'cmake -Bbuild . && cmake --build build -j'
        return
    end
    if make_f ~= nil then
        io.close(make_f)
        vim.bo.makeprg = 'make'
        return
    end
end

setMakeprgm()
vim.keymap.set('n', '<leader>cm', '<cmd>Make!<cr>', { noremap = true, buffer = true, silent = true, desc = '[C]ode [M]ake' })
vim.keymap.set('n', '<leader>cC', '<cmd>!rm -rf build<cr><cmd>Make!<cr>', { noremap = true, buffer = true, silent = true, desc = '[C]ode [C]lean Make' })
