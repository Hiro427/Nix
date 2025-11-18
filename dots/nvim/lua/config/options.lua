vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=1")
vim.cmd("colorscheme nordic")
vim.o.background = "dark"

vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.opt.fillchars = { eob = " " }
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.swapfile = false

-- Hide StatusLine Completely
-- NOTE: Some commands probably redundant
vim.cmd("set laststatus=0")
vim.cmd("set noru")
vim.opt.statusline = ""
vim.cmd("set statusline=%{repeat('─',winwidth('.'))}")
vim.cmd("set noshowcmd")
vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
vim.opt.showmode = false
vim.opt.winbar = ""
vim.opt_local.winbar = ""

-- GUI Settings
-- vim.g.neovide_opacity = 0.2
vim.o.guifont = "JetbrainsMono Nerd Font:h12"

vim.diagnostic.config({ virtual_text = false, update_in_insert = false })
