return {
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			local function generate_harpoon_picker()
				local file_paths = {}
				for _, item in ipairs(harpoon:list().items) do
					table.insert(file_paths, {
						text = item.value,
						file = item.value,
					})
				end
				return file_paths
			end
			vim.keymap.set("n", "<leader>fh", function()
				Snacks.picker({
					finder = generate_harpoon_picker,
					win = {
						input = {
							keys = {
								["dd"] = { "harpoon_delete", mode = { "n", "x" } },
							},
						},
						list = {
							keys = {
								["dd"] = { "harpoon_delete", mode = { "n", "x" } },
							},
						},
					},
					actions = {
						harpoon_delete = function(picker, item)
							local to_remove = item or picker:selected()
							table.remove(harpoon:list().items, to_remove.idx)
							picker:find({
								refresh = true, -- refresh picker after removing values
							})
						end,
					},
				})
			end)
			harpoon:setup({})
			vim.keymap.set("n", "<leader>k", function()
				harpoon:list():prev()
			end, { desc = "Harpoon Previous File" })
			vim.keymap.set("n", "<leader>j", function()
				harpoon:list():next()
			end, { desc = "Harpoon Next File" })
			vim.keymap.set("n", "<leader>ha", function()
				harpoon:list():add()
			end, { desc = "Harpoon Add file" })
			vim.keymap.set("n", "<leader>hh", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open Harpoon Menu" })

			vim.keymap.set("n", "<leader>1", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<leader>2", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<leader>3", function()
				harpoon:list():select(3)
			end)
			vim.keymap.set("n", "<leader>4", function()
				harpoon:list():select(4)
			end)
		end,
	},
}
