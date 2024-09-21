-- copy to the system clipboard by yanking
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"

-- enabling flash search
require("flash").toggle()

vim.opt.number = true
vim.wo.relativenumber = true

vim.opt.termbidi = true
vim.opt.encoding = "utf-8"
-- vim.opt.fileencoding = "utf-8"
vim.opt.guifont = "Vazirmatn"

-- Tab
vim.opt.tabstop = 2 -- number of visual spaces per TAB
vim.opt.softtabstop = 2 -- number of spacesin tab when editing
vim.opt.shiftwidth = 2 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of python
