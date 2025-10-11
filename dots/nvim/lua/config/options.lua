vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=1")
vim.cmd("colorscheme rose-pine")
vim.opt.showmode = false
vim.o.number = true
vim.o.relativenumber = true
vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- removed '~' from empty lines
vim.opt.fillchars = { eob = " " }

-- GUI Settings
vim.opt.laststatus = 3 --limit statusline to 1

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.swapfile = false

vim.keymap.set("n", "<leader>vd", ":vertical resize -15<CR>", { desc = "decrease vertical split" })
vim.keymap.set("n", "<leader>vi", ":vertical resize +15<CR>", { desc = "increase vertical split size" })
vim.keymap.set("n", "<leader>hd", ":resize -5<CR>", { desc = "decrease vertical split" })
vim.keymap.set("n", "<leader>hi", ":resize +5<CR>", { desc = "increase vertical split size" })

vim.keymap.set("n", "<leader>sh", "<C-w>H") -- move to far left
vim.keymap.set("n", "<leader>sl", "<C-w>L") -- move to far right
vim.keymap.set("n", "<leader>sk", "<C-w>K") -- move to top
vim.keymap.set("n", "<leader>sj", "<C-w>J") -- move to bottom
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>")
vim.keymap.set("n", "<leader>hs", ":split<CR>")
vim.keymap.set("n", "<leader>u", ":update<CR> :source<CR>", { desc = "reload config", silent = true })
-- Example: Set a dark gray background for mini.notify notifications

vim.o.background = "dark"
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Pmenu" })

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
