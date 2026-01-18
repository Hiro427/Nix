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
vim.keymap.set("n", "<leader>dq", ":cexpr []<CR>", { desc = "Clear QuickFix List", silent = true })

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

vim.keymap.set("n", "<leader>dm", ":delm! | delm A-Z0-9<CR>", { desc = "Clear Marks", silent = true })

-- local imap_expr = function(lhs, rhs)
-- 	vim.keymap.set("i", lhs, rhs, { expr = true })
-- end
-- imap_expr("<Tab>", [[pumvisible() ? "\<C-n>" : "\<Tab>"]])
-- imap_expr("<S-Tab>", [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]])

vim.keymap.set("n", "<leader><space>", ":Pick files<CR>", { desc = "Find Files (mini)", silent = true })
vim.keymap.set("n", "<leader>fr", ":Pick oldfiles<CR>", { desc = "Find Recent Files (mini)", silent = true })
vim.keymap.set("n", "<leader>fm", ":Pick marks<CR>", { desc = "Find Marks (mini)", silent = true })
vim.keymap.set("n", "<leader>fc", ":Pick commands<CR>", { desc = "Find Commands (mini)", silent = true })
vim.keymap.set(
	"n",
	"<leader>fb",
	":Pick buffers include_current=false<CR>",
	{ desc = "Find Buffers (mini)", silent = true }
	--
)
vim.keymap.set("n", "<leader>fd", ":Pick diagnostic<CR>", { desc = "Find Symbols (mini)", silent = true })
vim.keymap.set("n", "<leader>fk", ":Pick keymaps<CR>", { desc = "Find Symbols (mini)", silent = true })
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>", { desc = "Find help (mini)", silent = true })
vim.keymap.set(
	"n",
	"<leader>fq",
	":Pick list scope='quickfix'<CR>",
	{ desc = "Search Quickfix List (mini)", silent = true }
)
vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "Find Grep Match (mini)", silent = true })
vim.keymap.set("n", "<leader>fl", ":Pick buf_lines scope='current'<CR>", { desc = "Find Lines (mini)", silent = true })
vim.keymap.set(
	"n",
	"<leader>fs",
	":Pick lsp scope='document_symbol'<CR>",
	{ desc = "Find Symbols (mini)", silent = true }
)
vim.keymap.set("n", "<leader>gb", ":Pick git_branches<CR>", { desc = "Find Git Branches (mini)", silent = true })
vim.keymap.set("n", "<leader>gc", ":Pick git_commits<CR>", { desc = "Find Git Commits (mini)", silent = true })
vim.keymap.set(
	"n",
	"<leader>fS",
	":Pick lsp scope='workspace_symbol'<CR>",
	{ desc = "Find Symbols (mini)", silent = true }
)

vim.keymap.set("n", "<leader>ft", function()
	require("mini.pick").builtin.grep({
		pattern = "TODO|FIXME|HACK|NOTE",
		command = { "rg", "--no-heading", "--line-number", "--column" },
		prompt = "Find TODOs > ",
	})
end, { desc = "Find TODO comments (mini)", silent = true })

vim.keymap.set("n", "<leader>e", ":lua MiniFiles.open()<CR>", { desc = "Toggle Mini Files", silent = true })
