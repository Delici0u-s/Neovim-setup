-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls", "clangd", "pyright" }
local nvlsp = require "nvchad.configs.lspconfig"

nvlsp.defaults() -- loads nvchad's defaults

-- lsps with default config

-- Older
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

--New V
-- for _, lsp in ipairs(servers) do
--   if lsp == "clangd" then
--     -- Custom configuration for clangd
--     lspconfig[lsp].setup {
--       on_attach = nvlsp.on_attach,
--       on_init = nvlsp.on_init,
--       capabilities = nvlsp.capabilities,
--       -- cmd = { "clangd", "--std=c++23" }, -- Pass C++23 standard flag
--     }
--   else
--     lspconfig[lsp].setup {
--       on_attach = nvlsp.on_attach,
--       on_init = nvlsp.on_init,
--       capabilities = nvlsp.capabilities,
--     }
--   end
-- end
-- configuring single server, example: typescript
-- lspconfig.ts_ls.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
