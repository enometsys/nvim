# TypeSpec Support for Neovim

## Installation Complete

TypeSpec support has been successfully added to your Neovim configuration with the following features:

### ✅ Completed Setup

1. **File Type Detection**: `.tsp` files are now recognized as TypeSpec files
2. **TreeSitter Grammar**: Custom parser configured for syntax highlighting
3. **LSP Support**: TypeSpec language server configuration added
4. **Code Folding**: TreeSitter-based folding enabled for TypeSpec files

### 📦 Required Installation Steps

To fully enable TypeSpec support, you need to:

1. **Install TypeSpec Compiler/Language Server** (provides LSP features):
   ```bash
   npm install -g @typespec/compiler
   ```

2. **Install TreeSitter Parser** (provides syntax highlighting):
   - Open Neovim
   - Run: `:TSInstall typespec`
   - This will download and compile the TypeSpec grammar

### 🧪 Testing

A test file `test.tsp` has been created in this directory. After completing the installation steps:

1. Open the test file: `nvim test.tsp`
2. Verify syntax highlighting is working (colors should appear)
3. Test LSP features:
   - Hover over symbols (K in normal mode)
   - Go to definition (gd)
   - Show diagnostics (:lua vim.diagnostic.open_float())

### 🔧 Configuration Files Modified

- `/lua/autocmds.lua` - Added TypeSpec file type detection and folding
- `/lua/plugins/init.lua` - Added TreeSitter parser configuration
- `/lua/configs/lspconfig.lua` - Added TypeSpec language server configuration

### 📝 Notes

- The TypeSpec language server will only be enabled if `tsp-server` is available in your PATH
- The TreeSitter grammar is from the community repository: https://github.com/happenslol/tree-sitter-typespec
- TypeSpec root markers are: `tspconfig.yaml`, `package.json`, `.git`

### 🔗 Resources

- [TypeSpec Documentation](https://typespec.io/)
- [TypeSpec VS Code Extension](https://marketplace.visualstudio.com/items?itemName=typespec.typespec-vscode)
- [Tree-sitter TypeSpec Grammar](https://github.com/happenslol/tree-sitter-typespec)