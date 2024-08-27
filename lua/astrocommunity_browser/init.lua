-- lua/astrocommunity_browser/init.lua

local M = {}

function M.setup(opts)
	require("astrocommunity_browser.config").setup(opts)
	require("astrocommunity_browser.commands").setup()
end

return M
