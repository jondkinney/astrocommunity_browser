-- lua/astrocommunity_browser/config.lua

local M = {}

M.options = {
	keys = {
		{ "n", "<leader>po", ":OpenAstroCommunityPluginURL<CR>", { noremap = true, silent = true } },
	},
}

function M.setup(opts)
	M.options = vim.tbl_deep_extend("force", M.options, opts or {})
end

return M
