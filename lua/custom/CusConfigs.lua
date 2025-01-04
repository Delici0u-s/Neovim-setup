-- auto NvimTree
vim.cmd('NvimTreeToggle')
vim.cmd 'vertical resize -8'

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd 'wincmd l'
  end,
})

-- Quit nvimTree if its the only one open 
vim.api.nvim_create_autocmd("WinEnter", {
    callback = function()
        -- Check the current number of open windows
        if #vim.api.nvim_list_wins() == 1 then
            local bufname = vim.api.nvim_buf_get_name(0)
            -- Check if the current buffer name is "NvimTree_1"
            if bufname:match("NvimTree_1") then
                vim.cmd("quit") -- Close NvimTree if it's the only window
            end
        end
    end,
    desc = "Close NvimTree if it's the only window open",
})

