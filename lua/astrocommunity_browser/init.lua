-- Import necessary modules
local api = vim.api

local M = {}

-- Default key mapping
local default_keymap = { "n", "<leader>po", ":OpenAstroCommunityPluginURL<CR>", { noremap = true, silent = true } }

-- Function to load the plugins specified in the configuration file
function M.load_plugins()
	local plugins = require("astrocommunity_browser")
	if type(plugins) == "table" then
		for _, plugin in ipairs(plugins) do
			require(plugin)
		end
	else
		print("Invalid plugin configuration. Please specify plugins as a table.")
	end
end

-- Function to setup the plugin and key mappings
function M.setup()
	M.load_plugins()
	-- Add additional setup logic here

	-- Setup custom key mappings if specified
	if M.keys then
		for _, keymap in ipairs(M.keys) do
			api.nvim_set_keymap(unpack(keymap))
		end
	else
		-- Apply default key mapping if no custom key mappings are provided
		api.nvim_set_keymap(unpack(default_keymap))
	end
end

-- Function to parse the import line and open the URL
function M.open_url()
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

return M
