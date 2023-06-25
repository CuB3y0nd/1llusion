require("config.options")
-- bootstrap lazy.nvim
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
	group = vim.api.nvim_create_augroup("1llusion", { clear = true }),
	pattern = "VeryLazy",
	callback = function()
		require("config.autocmds")
		require("config.keymaps")
	end,
})
