
-- Custom Format commands Per File
local formatters = {
  c = function(curr_file)
    vim.cmd 'w'
    vim.cmd(string.format("silent! !clang-format.exe %s -i --style='{BasedOnStyle: GNU, IndentWidth: 2}'", curr_file))
  end,
  cpp = function(curr_file)
    vim.cmd 'w'
    -- os.execute(string.format("clang-format.exe %s -i --style='{BasedOnStyle: Microsoft, IndentWidth: 2}'", curr_file))
    vim.cmd(string.format("silent! !clang-format.exe %s -i --style='{BasedOnStyle: GNU, IndentWidth: 2}'", curr_file))
    -- print(string.format("clang-format.exe %s -i --style='{BasedOnStyle: Microsoft, IndentWidth: 2}'", curr_file))
    -- vim.cmd 'e!'
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

