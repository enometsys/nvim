require "nvchad.options"

-- add yours here!

local o = vim.o

-- Disable text wrapping by default
o.wrap = false
o.linebreak = false

-- Folding configuration
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]
