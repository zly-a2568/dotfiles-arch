require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    github = {
        ---@since 1.0.0
        -- The template URL to use when downloading assets from GitHub.
        -- The placeholders are the following (in order):
        -- 1. The repository (e.g. "rust-lang/rust-analyzer")
        -- 2. The release version (e.g. "v0.3.0")
        -- 3. The asset name (e.g. "rust-analyzer-v0.3.0-x86_64-unknown-linux-gnu.tar.gz")
        download_url_template = "https://gitproxy.mrhjx.cn/https://github.com/%s/releases/download/%s/%s",
    },
})
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" },
  handlers = {
    function(server_name)
      -- 获取 cmp-nvim-lsp 提供的补全能力
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- 针对 clangd 的额外参数（可选）
      local server_opts = { capabilities = capabilities }
      if server_name == "clangd" then
        server_opts.cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=iwyu",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        }
      end
      
      require("lspconfig")[server_name].setup(server_opts)
    end,
  },
})
