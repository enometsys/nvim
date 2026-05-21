return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Treesitter Configuration (main branch — required for Neovim 0.12+)
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "TSUpdate",
        callback = function()
          require("nvim-treesitter.parsers").typespec = {
            install_info = {
              url = "https://github.com/happenslol/tree-sitter-typespec",
              branch = "main",
              generate = false,
            },
          }
        end,
      })

      require("nvim-treesitter").install({
        "lua", "luadoc", "printf", "vim", "vimdoc",
        "html", "css",
        "javascript", "typescript", "tsx", "vue",
        "json",
        "markdown", "markdown_inline",
        "typespec",
      })
    end,
  },

  -- Fugitive - Git integration
  {
    "tpope/vim-fugitive",
    cmd = {
      "G",
      "Git",
      "Gdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "GRemove",
      "GRename",
      "Glgrep",
      "Gedit"
    },
    ft = {"fugitive"}
  },

  -- Surround
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  -- Yanky - Better yank/paste
  {
    "gbprod/yanky.nvim",
    event = "VeryLazy",
    opts = {
      ring = {
        history_length = 100,
        storage = "shada",
        sync_with_numbered_registers = true,
        cancel_event = "update",
      },
      picker = {
        select = {
          action = nil,
        },
        telescope = {
          mappings = nil,
        },
      },
      system_clipboard = {
        sync_with_ring = true,
      },
      highlight = {
        on_put = true,
        on_yank = true,
        timer = 200,
      },
      preserve_cursor_position = {
        enabled = true,
      },
    },
  },

  -- Tmux navigator
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      -- Disable default NvChad window navigation mappings
      local unmap = vim.keymap.del
      pcall(unmap, "n", "<C-h>")
      pcall(unmap, "n", "<C-j>")
      pcall(unmap, "n", "<C-k>")
      pcall(unmap, "n", "<C-l>")
    end,
  },

  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_browser = ""
      vim.g.mkdp_theme = "dark"
    end,
  },
}
