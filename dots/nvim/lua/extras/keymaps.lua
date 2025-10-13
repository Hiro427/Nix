local function keymaps(mode, keys, command, description)
	vim.keymap.set(mode or { mode }, keys, command, { desc = description, silent = true })
end
