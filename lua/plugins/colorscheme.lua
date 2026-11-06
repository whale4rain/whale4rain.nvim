vim.pack.add({
	"https://github.com/whale4rain/blue-whale.nvim",
	"https://github.com/ramojus/mellifluous.nvim",
})

require("mellifluous").setup({
	transparent_background = {
		enabled = true,
		floating_windows = true,
		telescope = true,
		file_tree = true,
		cursor_line = true,
		status_line = true,
	},
})

local transparent_groups = {
	"Normal",
	"NormalNC",
	"NormalFloat",
	"FloatBorder",
	"FloatTitle",
	"LineNr",
	"LineNrAbove",
	"LineNrBelow",
	"CursorLine",
	"CursorLineNr",
	"SignColumn",
	"EndOfBuffer",
	"WinSeparator",
	"VertSplit",
	"StatusLine",
	"StatusLineNC",
	"TabLine",
	"TabLineFill",
	"Pmenu",
	"PmenuSbar",
	"PmenuThumb",
	"TelescopeNormal",
	"TelescopeBorder",
	"TelescopePromptNormal",
	"NvimTreeNormal",
	"NvimTreeNormalNC",
	"NvimTreeWinSeparator",
	"OilNormal",
	"OilFloatBorder",
	"SnacksNormal",
	"SnacksNormalNC",
}

local function clear_background()
	for _, group in ipairs(transparent_groups) do
		local hl = vim.api.nvim_get_hl(0, { name = group })
		if hl.bg then
			hl.bg = nil
			vim.api.nvim_set_hl(0, group, hl)
		end
	end
end

vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
	group = vim.api.nvim_create_augroup("TransparentBackground", { clear = true }),
	callback = clear_background,
})

-- Set colorscheme
pcall(vim.cmd, "colorscheme mellifluous")
