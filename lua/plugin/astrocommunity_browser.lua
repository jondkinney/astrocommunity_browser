-- plugin/astrocommunity_browser.lua

if vim.fn.has("nvim-0.7.0") == 0 then
	vim.api.nvim_err_writeln("astrocommunity_browser requires at least nvim-0.7.0")
	return
end

-- prevent loading file twice
if vim.g.loaded_astrocommunity_browser == 1 then
	return
end
vim.g.loaded_astrocommunity_browser = 1

-- Create the command
vim.api.nvim_create_user_command("OpenAstroCommunityPluginURL", function()
	require("astrocommunity_browser.commands").open_url()
end, {})
