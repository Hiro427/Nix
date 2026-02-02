vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set cursorline")
vim.cmd("set conceallevel=1")
vim.cmd("set pumheight=8")
vim.cmd("colorscheme gruvbox")
vim.o.background = "dark"

vim.o.ignorecase = true -- Ignore casing when searching
vim.o.smartcase = true -- Turn off Ignore case when a capital letter is detected

-- mapleader and maplocalleader are in lazy.lua
vim.o.number = true
vim.o.relativenumber = true
vim.opt.termguicolors = true
vim.opt.fillchars = { eob = " " }
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true -- Enable folding by default
vim.opt.foldlevel = 99 -- Start with all folds open
vim.opt.swapfile = false

-- GUI Settings
-- vim.g.neovide_opacity = 0.2
vim.o.guifont = "JetbrainsMono Nerd Font:h12"

vim.diagnostic.config({
	virtual_text = false,
	underline = true,
	signs = true,
	severity_sort = true,
	float = {
		-- border = "rounded",
		focusable = false,
		style = "minimal",
	},
	update_in_insert = false,
	wrap = true,
})

vim.opt.updatetime = 300
vim.api.nvim_create_autocmd("CursorHold", {
	buffer = bufnr,
	callback = function()
		local opts = {
			focusable = false,
			close_events = { "CursorMoved", "CursorMovedI", "BufLeave" },
			scope = "cursor",
		}
		vim.diagnostic.open_float(nil, opts)
	end,
})
