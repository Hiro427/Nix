vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=1")
vim.cmd("colorscheme gruvbox")
vim.o.background = "dark"

vim.o.ignorecase = true -- Ignore casing when searching
vim.o.smartcase = true -- Turn off Ignore case when a capital letter is detected

vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.opt.fillchars = { eob = " " }
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.swapfile = false

-- GUI Settings
-- vim.g.neovide_opacity = 0.2
vim.o.guifont = "JetbrainsMono Nerd Font:h12"

-- vim.diagnostic.config({
-- 	virtual_text = true,
-- 	underline = true,
-- 	float = { border = "rounded" },
-- 	update_in_insert = true,
-- 	wrap = true,
-- })
-- vim.api.nvim_create_autocmd("ModeChanged", {
-- 	pattern = { "n:i", "i:n" },
-- 	callback = function(args)
-- 		if args.match == "n:i" then
-- 			vim.opt.relativenumber = false
-- 		elseif args.match == "i:n" then
-- 			vim.opt.relativenumber = true
-- 		end
-- 	end,
-- })
