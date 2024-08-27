-- Import necessary modules
local api = vim.api

local M = {}

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

-- Setup function to create the command and key mapping
function M.setup()
	-- Create a Neovim command to trigger the function
	api.nvim_create_user_command("OpenAstroCommunityPluginURL", M.open_url, {})

	-- Optional: Create a key mapping to easily trigger the command
	api.nvim_set_keymap("n", "<leader>po", ":OpenAstroCommunityPluginURL<CR>", { noremap = true, silent = true })
end

return M
