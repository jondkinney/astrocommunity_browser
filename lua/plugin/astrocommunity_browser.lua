-- prevent loading file twice
if vim.g.loaded_astrocommunity_browser then
	return
end

-- Load and setup the plugin
require("astrocommunity_browser").setup()

-- Create the command
vim.api.nvim_create_user_command("OpenAstroCommunityPluginURL", function()
	require("astrocommunity_browser.commands").open_url()
end, {})

vim.g.loaded_astrocommunity_browser = true
