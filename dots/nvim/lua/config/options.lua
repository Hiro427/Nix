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

vim.o.background = "dark"
vim.api.nvim_set_hl(0, "NormalFloat", { link = "Pmenu" })
-- vim.api.nvim_set_hl(0, "WhichKey", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = "#000000" })
-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { bg = "#000000" })
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
	vim.api.nvim_set_hl(0, "FloatBorder", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "NormalFloat", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "Float", {
		bg = "none",
	})
	vim.api.nvim_set_hl(0, "WhichKeyNormal", {
		bg = "none",
	})

	-- vim.api.nvim_set_hl(0, "SnacksPickerBoxBorder", {
	-- 	bg = "none",
	-- })
	-- vim.api.nvim_set_hl(0, "SnacksPickerBox", {
	-- 	bg = "none",
	-- })
end

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
-- 		vim.api.nvim_set_hl(0, "SnacksPickerBorder", { bg = "none", nocombine = true })
-- 	end,
-- })
-- Apply after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.schedule(match_buffer_bg)
	end,
})

match_buffer_bg()
