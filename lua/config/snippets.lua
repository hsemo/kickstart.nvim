local ls = require 'luasnip'

local t = ls.text_node
local i = ls.insert_node
local snip = ls.snippet
local node = ls.snippet_node
local func = ls.function_node
local choice = ls.choice_node
local dynamicn = ls.dynamic_node

ls.add_snippets(nil, {
  typescript = {
    snip({
      trig = 'rnsts',
      name = 'StyleSheet',
      desc = 'React Native StyleSheet shortcut',
    }, {
      t {
        "import { StyleSheet } from 'react-native';",
        '',
        'function getThemedStyles() {',
        '  return StyleSheet.create({',
      },
      i { 1, 'custom_styles' },
      t {
        '  })',
        '}',
        '',
        'export default getThemedStyles;',
      },
      i { 0 },
    }),
  },
})
