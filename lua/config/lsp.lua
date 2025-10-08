-- lua/config/lsp.lua
--local cmp_caps = require("cmp_nvim_lsp").default_capabilities()

local function on_attach(client, bufnr)
  if client.name == "ts_ls" then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end
  local map = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end
  map("n", "gd", vim.lsp.buf.definition, "LSP: Go to definition")
  map("n", "gr", vim.lsp.buf.references, "LSP: References")
  map("n", "K",  vim.lsp.buf.hover, "LSP: Hover")
  map("n", "<leader>rn", vim.lsp.buf.rename, "LSP: Rename")
  map("n", "<leader>ca", vim.lsp.buf.code_action, "LSP: Code action")
end

require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = { "eslint", "html", "cssls", "ts_ls" },
  handlers = {
    function(server)
      require("lspconfig")[server].setup({
        capabilities = cmp_caps,
        on_attach = on_attach,
      })
    end,
    ["eslint"] = function()
      require("lspconfig").eslint.setup({
        capabilities = cmp_caps,
        on_attach = function(client, bufnr)
          on_attach(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr, command = "EslintFixAll",
          })
        end,
      })
    end,
    ["ts_ls"] = function()
      require("lspconfig").ts_ls.setup({
        capabilities = cmp_caps,
        on_attach = on_attach,
        settings = {
          javascript = { suggest = { completeFunctionCalls = true } },
          typescript = { suggest = { completeFunctionCalls = true } },
        },
      })
    end,
  },
})

