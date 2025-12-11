-- Create Splits
vim.keymap.set("n", "<leader>vs", ":vsplit<CR>", { desc = "increase vertical split size", silent = true })
vim.keymap.set("n", "<leader>hs", ":split<CR>", { desc = "increase vertical split size", silent = true })

-- Resizing Splits
vim.keymap.set("n", "<leader>vd", ":vertical resize -15<CR>", { desc = "decrease vertical split", silent = true })
vim.keymap.set("n", "<leader>vi", ":vertical resize +15<CR>", { desc = "increase vertical split size", silent = true })
vim.keymap.set("n", "<leader>hd", ":resize -15<CR>", { desc = "decrease vertical split", silent = true })
vim.keymap.set("n", "<leader>hi", ":resize +15<CR>", { desc = "increase vertical split size", silent = true })

-- Move Splits
vim.keymap.set("n", "<leader>sh", "<C-w>H", { desc = "Move Split to Left", silent = true }) -- move to far left
vim.keymap.set("n", "<leader>sl", "<C-w>L", { desc = "Move Split to Right", silent = true }) -- move to far right
vim.keymap.set("n", "<leader>sk", "<C-w>K", { desc = "Move Split to Top", silent = true }) -- move to top
vim.keymap.set("n", "<leader>sj", "<C-w>J", { desc = "Move Split to Bottom", silent = true }) -- move to bottom

-- Navigating Splits
vim.keymap.set("n", "<leader>wh", "<C-w>h", { desc = "Move to split left", silent = true }) -- move to far left
vim.keymap.set("n", "<leader>wl", "<C-w>l", { desc = "Move to split right", silent = true }) -- move to far right
vim.keymap.set("n", "<leader>wk", "<C-w>k", { desc = "Move to split top", silent = true }) -- move to top
vim.keymap.set("n", "<leader>wj", "<C-w>j", { desc = "Move to split bottom", silent = true }) -- move to bottom

-- Terminal Stuff
vim.keymap.set("t", "<C-w>t", "<C-\\><C-n>", { desc = "Temporarily exit Terminal", silent = true })
-- vim.keymap.set("t", "<C-w>t", ":belowright split | resize 15 | terminal<CR>", { desc = "New Term Split", silent = true })

-- Extra Keymaps (terminal, commenting)
vim.keymap.set("i", "<C-p>", "<C-x><C-f>", { noremap = true, silent = true })

vim.keymap.set({ "n", "v" }, "<leader>c", "gcc", { remap = true, desc = "Comment Line (remap)", silent = true })
-- vim.keymap.set({ "n" }, "<leader>z", "za", { remap = true, desc = "Toggle Fold Under Cursor", silent = true })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "increase vertical split size", silent = true })
vim.keymap.set("n", "<leader>u", ":update<CR> :source<CR>", { desc = "reload config", silent = true })
vim.keymap.set("n", "<leader>qc", ":cexpr []<CR>", { desc = "Clear QuickFix List", silent = true })

-- Buffers
vim.keymap.set("n", "<leader>k", ":bprevious<CR>", { desc = "Buffer Previous", silent = true })
vim.keymap.set("n", "<leader>j", ":bnext<CR>", { desc = "Buffer Next", silent = true })

vim.keymap.set("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Buffer Next", silent = true })
vim.keymap.set("n", "<leader>ft", ":TodoQuickFix<CR>", { desc = "Buffer Next", silent = true })

vim.keymap.set("n", "dm", function()
	local key = vim.fn.getchar()
	local char = type(key) == "number" and vim.fn.nr2char(key) or key
	vim.cmd("delmarks " .. char)
end, { desc = "Delete a single mark" })

vim.keymap.set("n", "<leader>dm", ":delm! | delm A-Z0-9<CR>", { desc = "Clear All Extra Marks", silent = true })
