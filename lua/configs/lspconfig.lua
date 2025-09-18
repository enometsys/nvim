require("nvchad.configs.lspconfig").defaults()

local servers = { 
  "html", 
  "cssls",
  "ts_ls",     -- TypeScript/JavaScript
  "vls",       -- Vue Language Server
  "eslint",    -- ESLint for JS/TS linting
}

-- Enable the servers
vim.lsp.enable(servers)

-- TypeScript/JavaScript specific settings
vim.lsp.config.ts_ls = {
  root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
  init_options = {
    preferences = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayVariableTypeHintsWhenTypeMatchesName = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    }
  }
}

-- Vue Language Server specific settings
vim.lsp.config.vls = {
  root_markers = { 'package.json', 'vue.config.js', 'vite.config.js', 'vite.config.ts' },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {}
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {}
      },
      vetur = {
        completion = {
          autoImport = true,
          tagCasing = "kebab",
          useScaffoldSnippets = true
        },
        format = {
          defaultFormatter = {
            js = "none",
            ts = "none"
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false
        },
        useWorkspaceDependencies = true,
        validation = {
          script = true,
          style = true,
          template = true
        }
      }
    }
  }
}

-- ESLint specific settings
vim.lsp.config.eslint = {
  root_markers = { '.eslintrc', '.eslintrc.js', '.eslintrc.json', 'package.json' },
  settings = {
    codeAction = {
      disableRuleComment = {
        enable = true,
        location = "separateLine"
      },
      showDocumentation = {
        enable = true
      }
    },
    codeActionOnSave = {
      enable = false,
      mode = "all"
    },
    format = true,
    nodePath = "",
    onIgnoredFiles = "off",
    packageManager = "npm",
    quiet = false,
    rulesCustomizations = {},
    run = "onType",
    useESLintClass = false,
    validate = "on",
    workingDirectory = {
      mode = "location"
    }
  }
}

-- TypeSpec Language Server configuration
-- Note: You need to install @typespec/compiler globally:
-- npm install -g @typespec/compiler
vim.lsp.config.typespec = {
  cmd = { "tsp-server", "--stdio" },
  filetypes = { "typespec" },
  root_markers = { "tspconfig.yaml", "package.json", ".git" },
  init_options = {
    preferences = {
      includeInlayParameterNameHints = 'all',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
    }
  },
  settings = {
    typespec = {
      -- Add any TypeSpec-specific settings here if needed
    }
  }
}

-- Enable TypeSpec server if the command is available
local function is_executable(cmd)
  return vim.fn.executable(cmd) == 1
end

if is_executable("tsp-server") then
  vim.lsp.enable({"typespec"})
end 
