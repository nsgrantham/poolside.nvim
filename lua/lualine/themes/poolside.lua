local poolside = require("poolside")

return {
  inactive = {
    a = { fg = poolside.normal.hex, bg = nil, gui = "bold" },
    b = { fg = poolside.normal.hex, bg = nil },
    c = { fg = poolside.normal.hex, bg = nil }
  },
  visual = {
    a = { fg = poolside.base.hex,   bg = poolside.orange.hex, gui = "bold" },
    b = { fg = poolside.orange.hex, bg = poolside.muted.hex },
    c = { fg = poolside.normal.hex, bg = poolside.surface.hex }
  },
  replace = {
    a = { fg = poolside.base.hex,   bg = poolside.red.hex, gui = "bold" },
    b = { fg = poolside.red.hex,    bg = poolside.muted.hex },
    c = { fg = poolside.normal.hex, bg = poolside.surface.hex }
  },
  normal = {
    a = { fg = poolside.base.hex,   bg = poolside.purple.hex, gui = "bold" },
    b = { fg = poolside.purple.hex, bg = poolside.muted.hex },
    c = { fg = poolside.normal.hex, bg = poolside.surface.hex }
  },
  insert = {
    a = { fg = poolside.base.hex,   bg = poolside.yellow.hex, gui = "bold" },
    b = { fg = poolside.yellow.hex, bg = poolside.muted.hex },
    c = { fg = poolside.normal.hex, bg = poolside.surface.hex }
  },
  command = {
    a = { fg = poolside.base.hex,   bg = poolside.blue.hex, gui = "bold" },
    b = { fg = poolside.blue.hex,   bg = poolside.muted.hex },
    c = { fg = poolside.normal.hex, bg = poolside.surface.hex }
  },
  terminal = {
    a = { fg = poolside.base.hex,   bg = poolside.pink.hex, gui = "bold" },
    b = { fg = poolside.pink.hex,   bg = poolside.muted.hex },
    c = { fg = poolside.normal.hex, bg = poolside.surface.hex }
  }
}
