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
-- removed '~' from empty lines
vim.opt.fillchars = { eob = " " }

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

local function match_buffer_bg()
	local normal_hl = vim.api.nvim_get_hl(0, { name = "Normal" })
	local bg_color = normal_hl.bg
	local fg_color = normal_hl.fg

	vim.api.nvim_set_hl(0, "StatusLine", {
		fg = fg_color,
		bg = bg_color,
	})
	vim.api.nvim_set_hl(0, "StatusLineNC", {
		fg = fg_color,
		bg = bg_color,
	})
end

-- Apply after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.schedule(match_buffer_bg)
	end,
})

match_buffer_bg()
