
-- Custom Format commands Per File
-- Define a table of formatters based on file types
local formatters = {
  c = function(curr_file)
    vim.cmd 'w'
    os.execute(string.format("clang-format.exe %s -i --style=Microsoft", curr_file))
    vim.cmd 'e!'
  end,
  cpp = function(curr_file)
    vim.cmd 'w'
    os.execute( string.format("clang-format.exe %s -i --style=Microsoft", curr_file))
    vim.cmd 'e!'
    -- vim.cmd(string.format("!clang-format.exe %s -i --style=Microsoft", curr_file))
  end,
}

-- Define the Format command
vim.api.nvim_create_user_command("Format", function()
  -- Get the current filetype
  local filetype = vim.bo.filetype
  local curr_file = vim.fn.expand("%") -- Get the current file name

  -- Check if a formatter exists for the current filetype
  if formatters[filetype] then
    formatters[filetype](curr_file) -- Call the appropriate formatter
  else
    print("No formatter defined for filetype: " .. filetype)
  end
end, {})
-- Usage: Run :Format in Neovim

