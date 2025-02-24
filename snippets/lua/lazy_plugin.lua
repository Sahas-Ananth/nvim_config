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

local new_plugin = s(
    { trig = 'newp', dscr = 'Add a new lazy plugin' },
    fmta(
        [[
        -- Desc: <>
        -- URL: <>

        --- @type LazySpec
        return <>
        <>
        ]],
        {
            i(2),
            i(3),
            i(1),
            i(0),
        }
    )
)

local LUAS = {
    new_plugin,
}

return LUAS
