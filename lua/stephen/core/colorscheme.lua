local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
    print("Colorscheme not found!")
    return
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

-- this should do something
vim.cmd('highlight Normal guibg=NONE ctermbg=NONE')
vim.cmd('highlight StatusLine guibg=NONE ctermbg=NONE')

