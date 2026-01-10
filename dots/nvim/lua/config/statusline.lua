local function git_branch()
	local branch = vim.fn.systemlist("git branch --show-current")[1] or ""
	if branch == "" then
		return ""
	end
	return branch
end

local function nix_shell()
	local in_shell = vim.env.IN_NIX_SHELL
	local shell_name = vim.env.NIX_SHELL_NAME or ""
	if in_shell == nil then
		return ""
	end
	if shell_name ~= "" then
		return "󱄅 " .. shell_name -- nerd font icon (adjust if needed)
	end
	return "󱄅 nix"
end

function _G.statusline()
	local branch = git_branch()
	local nix = nix_shell()
	local components = {}

	if branch ~= "" then
		table.insert(components, branch)
	end
	if nix ~= "" then
		table.insert(components, nix)
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

-- vim.cmd("set laststatus=0")
-- vim.opt.statusline = ""
-- vim.cmd("set statusline=%{repeat('─',winwidth('.'))}")
-- vim.api.nvim_set_hl(0, "Statusline", { link = "Normal" })
-- vim.api.nvim_set_hl(0, "StatuslineNC", { link = "Normal" })
-- vim.opt_local.winbar = ""
-- vim.opt.winbar = ""
