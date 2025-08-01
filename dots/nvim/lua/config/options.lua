vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=1")
vim.opt.showmode = false
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])

-- GUI Settings

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.swapfile = false

vim.o.background = "dark"
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Pmenu" })
-- vim.opt.list = true
-- vim.cmd("set updatetime=100")

vim.diagnostic.config({
	virtual_text = false,
	update_in_insert = false,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "lua" },
	callback = function()
		vim.b.autoformat = false
	end,
})
