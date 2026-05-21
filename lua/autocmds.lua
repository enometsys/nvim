require "nvchad.autocmds"

-- Ensure tmux navigator mappings are set after all plugins load
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Force unmap NvChad's window navigation
    pcall(vim.keymap.del, "n", "<C-h>")
    pcall(vim.keymap.del, "n", "<C-l>")
    pcall(vim.keymap.del, "n", "<C-j>")
    pcall(vim.keymap.del, "n", "<C-k>")
    
    -- Set tmux navigator mappings
    vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Navigate left (tmux aware)" })
    vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Navigate down (tmux aware)" })
    vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Navigate up (tmux aware)" })
    vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Navigate right (tmux aware)" })
  end,
})

-- Enable treesitter highlighting, folding, and indentation per filetype.
-- On nvim-treesitter `main` branch, highlighting is opt-in per buffer.
vim.api.nvim_create_autocmd({"FileType"}, {
  pattern = {
    "javascript", "typescript", "tsx", "vue",
    "lua", "vim", "vimdoc",
    "html", "css", "json",
    "markdown", "markdown_inline",
    "typespec",
  },
  callback = function()
    pcall(vim.treesitter.start)
    vim.wo.foldmethod = "expr"
    vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo.foldenable = true
    vim.wo.foldlevel = 99
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})

-- TypeSpec file type detection
vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*.tsp",
  callback = function()
    vim.bo.filetype = "typespec"
  end,
})
