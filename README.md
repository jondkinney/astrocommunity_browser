# AstroCommunity Browser

A Neovim plugin designed to simplify navigation to AstroNvim community plugin repositories. This plugin parses a given line containing an AstroNvim community plugin import statement, constructs the corresponding GitHub URL, and opens it in the default web browser.

## Motivation

Navigating to the specific GitHub repository of an AstroNvim community plugin can be cumbersome. This plugin automates the process, allowing developers to quickly access the repository for documentation, issues, or contributions. By simply placing the cursor on the import line and running a command, the corresponding repository URL is opened in the default browser.

## Features

- Parses lines containing AstroNvim community plugin import statements.
- Constructs the corresponding GitHub URL.
- Opens the URL in the default web browser.
- Provides a user command and customizable key mappings for ease of use.
- Supports lazy loading with lazy.nvim.

## Requirements

- Neovim 0.7.0 or later
- AstroNvim (recommended)

## Installation

### For AstroNvim users

Add the following to your plugins/astrocommunity_browser.lua file:

```lua
return {
  "jondkinney/astrocommunity_browser",
  -- Optional: Override default keymap <Leader>po (nemonic: plugin open)
  opts = {
    keys = {
      { "n", "<Leader>ac", ":OpenAstroCommunityPluginURL<CR>", { noremap = true, silent = true } }
    },
  },
}
```

## Configuration

The plugin comes with default settings, but you can customize them by passing options to the setup function.

### Default Key Mapping

By default, the plugin maps `<Leader>po` to open the AstroCommunity plugin URL. You can override this by specifying custom key mappings in the configuration, but no opts are required if you want to keep the default key mapping.
* The thought behind using `po` is that `<Leader>p` opens up the `packages` folder of commands allowing for opening the Lazy TUI in various states. And since this plugin revolves around plugin management, generally, it seemed like an ok place to stick the keymap. It was also not used in that folder, so it didn't override anything else. I already use `<Leader>ac` for other things, myself.

## Usage

1. Place your cursor on a line containing an AstroNvim community plugin import statement, e.g.:
   { import = "astrocommunity.colorscheme.catppuccin" }
2. Use the command `:OpenAstroCommunityPluginURL` or the default key mapping `<Leader>po` (or your custom mapping).
3. The plugin will open the corresponding GitHub repository URL in your default web browser.

## Commands

- `:OpenAstroCommunityPluginURL` Opens the GitHub URL for the AstroCommunity plugin under the cursor.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
