local function git_branch()
	local branch = vim.fn.systemlist("git branch --show-current")[1] or ""
	if branch == "fatal: not a git repository (or any of the parent directories): .git" or "" then
		return ""
	end
	return branch
end

function _G.statusline()
	local branch = git_branch()
	local components = {}

	if branch ~= "" then
		table.insert(components, branch)
	end

	local left = table.concat(components, " | ")
	local file = vim.fn.expand("%:t") ~= "" and vim.fn.expand("%:t") or "[No Name]"
	return string.format(" %s %%=%s ", left, file)
end

vim.opt.statusline = "%!v:lua.statusline()"
vim.opt.laststatus = 3
vim.cmd("set noshowcmd")
vim.opt.showmode = false
vim.cmd("set noru")

-- NOTE no statusline
-- vim.cmd("set laststatus=0")
-- vim.opt.statusline = ""
-- vim.cmd("set statusline=%{repeat('─',winwidth('.'))}")
-- vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
-- vim.opt_local.winbar = ""
-- vim.opt.winbar = ""
