if not vim.g.vscode then
	return {}
end

local enabled = {
	"flit.nvim",
	"lazy.nvim",
	"leap.nvim",
	"mini.ai",
	"mini.comment",
	"mini.pairs",
	"mini.surround",
	"nvim-treesitter",
	"nvim-treesitter-textobjects",
	"nvim-ts-context-commentstring",
	"vim-repeat",
}

local Config = require("lazy.core.config")
local Plugin = require("lazy.core.plugin")
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false

-- HACK: disable all plugins except the ones we want
local fix_disabled = Plugin.Spec.fix_disabled
function Plugin.Spec.fix_disabled(self)
	for _, plugin in pairs(self.plugins) do
		if not (vim.tbl_contains(enabled, plugin.name) or plugin.vscode) then
			plugin.enabled = false
		end
	end
	fix_disabled(self)
end

-- HACK: don't clean plugins in vscode
local update_state = Plugin.update_state
function Plugin.update_state()
	update_state()
	Config.to_clean = {}
end

-- Add some vscode specific keymaps
vim.api.nvim_create_autocmd("User", {
	pattern = "1llusionKeymaps",
	callback = function()
		vim.keymap.set("n", "<leader><space>", "<cmd>Find<cr>")
		vim.keymap.set("n", "<leader>/", [[<cmd>call VSCodeNotify('workbench.action.findInFiles')<cr>]])
		vim.keymap.set("n", "<leader>ss", [[<cmd>call VSCodeNotify('workbench.action.gotoSymbol')<cr>]])
	end,
})

return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = { highlight = { enable = false } },
	},
}
