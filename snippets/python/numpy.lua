local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local c = ls.choice_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep

local ndf64 = s({ trig = 'ndf64', dscr = 'Type Annotation for NDArray[np.float64]' }, { t 'NDArray[np.float64]' })
-- local eg = s('hip', { t 'Hello World Python' })

local PYS = {
    ndf64,
    -- eg,
}

return PYS
