require "nvchad.options"

-- add yours here!

local o = vim.o

-- Disable text wrapping by default
o.wrap = false
o.linebreak = false

-- Folding configuration
o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldenable = true
o.foldlevel = 99
o.foldlevelstart = 99
o.foldnestmax = 10
o.fillchars = [[eob: ,fold: ,foldopen:▾,foldsep: ,foldclose:▸]]
