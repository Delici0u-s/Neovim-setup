-- load defaults i.e lua_lsp
--

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


local function is_c_file()
  local bufname = vim.api.nvim_buf_get_name(0)
  local ext = bufname:match("^.+%.(.+)$")
  return ext == "c" or ext == "h"
end

require('lspconfig').clangd.setup {
  cmd = { "C:\\msys64\\mingw64\\bin\\clangd.exe" },
  on_new_config = function(new_config, _)
    new_config.init_options = new_config.init_options or {}
    if is_c_file() then
      new_config.init_options.fallbackFlags = { "--std=c2x" }
    else
      new_config.init_options.fallbackFlags = { "--std=c++23" }
    end
  end,
}
