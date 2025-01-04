-- Get the directory of the current script (init.lua)
local config_dir = vim.fn.stdpath('config') .. '/lua/custom'

-- Add the directory to Lua's package path
package.path = config_dir .. '/?.lua;' .. package.path


Files = {'CusConfigs', 'functions'}


for _, File in pairs(Files) do
  require(File)
end
-- require 'CusConfigs' 
-- require 'functions'
