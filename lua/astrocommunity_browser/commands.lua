-- lua/astrocommunity_browser/commands.lua

local config = require("astrocommunity_browser.config")
local api = vim.api

local M = {}

local function open_url()
	-- Get the current line under the cursor
	local line = api.nvim_get_current_line()

	-- Pattern to match the import string
	local pattern = '{ import = "(.-)" }'
	local import_path = line:match(pattern)

	-- If the import path is found, construct the URL and open it
	if import_path then
		local url = "https://github.com/AstroNvim/astrocommunity/tree/main/lua/" .. import_path:gsub("%.", "/")

		-- Determine the OS and use the appropriate command to open the URL
		local open_cmd
		if vim.fn.has("mac") == 1 then
			open_cmd = "open"
		elseif vim.fn.has("unix") == 1 then
			open_cmd = "xdg-open"
		elseif vim.fn.has("win32") == 1 then
			open_cmd = "start"
		else
			print("Unsupported OS")
			return
		end

		-- Open the URL in the default browser
		os.execute(open_cmd .. " " .. url)
	else
		print("No valid import path found in the current line.")
	end
end

function M.setup()
	-- Create the command
	vim.api.nvim_create_user_command("OpenAstroCommunityPluginURL", open_url, {})

	-- Setup key mappings
	for _, keymap in ipairs(config.options.keys) do
		api.nvim_set_keymap(unpack(keymap))
	end
end

return M
