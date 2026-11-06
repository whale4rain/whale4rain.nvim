vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
})

local c = {
	dark = "#1f1f28",
	fg = "#dcd7ba",
	dim = "#727169",
	blue = "#7e9cd8",
	purple = "#957fb8",
	green = "#98bb6c",
	red = "#e82424",
	yellow = "#e6c384",
	cyan = "#7aa89f",
}

local function mode(fg, bg)
	return {
		a = { fg = fg, bg = bg, gui = "bold" },
		b = { fg = bg },
		c = { fg = c.fg },
	}
end

local theme = {
	normal = mode(c.dark, c.blue),
	insert = mode(c.dark, c.green),
	visual = mode(c.dark, c.purple),
	replace = mode(c.dark, c.red),
	command = mode(c.dark, c.yellow),
	terminal = mode(c.dark, c.cyan),
	inactive = {
		a = { fg = c.dim },
		b = { fg = c.dim },
		c = { fg = c.dim },
	},
}

require("lualine").setup({
	options = {
		theme = theme,
		section_separators = "",
		component_separators = "",
	},
})

-- local colors = {
-- 	bg = "#51afef",
-- 	fg = "#F7F9FF",
-- 	yellow = "#ECBE7B",
-- 	cyan = "#008080",
-- 	green = "#98be65",
-- 	orange = "#E68C32",
-- 	red = "#ec5f67",
-- }

-- local theme = {
-- 	normal = {
-- 		a = { fg = colors.fg, bg = colors.bg },
-- 		b = { fg = colors.fg, bg = colors.bg },
-- 		c = { fg = colors.fg, bg = colors.bg },
-- 	},
-- 	insert = { a = { fg = colors.fg, bg = colors.green } },
-- 	visual = { a = { fg = colors.fg, bg = colors.orange } },
-- 	replace = { a = { fg = colors.fg, bg = colors.red } },
-- }

-- local function process_sections(sections)
-- 	for name, section in pairs(sections) do
-- 		local left = name:sub(-1) ~= "x" and name:sub(-1) ~= "y" and name ~= "lualine_z"
-- 		for id, comp in ipairs(section) do
-- 			if type(comp) ~= "table" then
-- 				comp = { comp }
-- 				section[id] = comp
-- 			end
-- 			comp.separator = left and { right = "" } or { left = "" }
-- 		end
-- 	end
-- 	return sections
-- end

-- require("lualine").setup({
-- 	options = {
-- 		theme = theme,
-- 		component_separators = "",
-- 		section_separators = { left = "", right = "" },
-- 	},
-- 	sections = process_sections({
-- 		lualine_a = { "mode" },
-- 		lualine_b = {
-- 			{ "branch", icon = "🌿" },
-- 			{
-- 				"diff",
-- 				symbols = { added = "➕ ", modified = "✏️ ", removed = "➖ " },
-- 			},
-- 			{
-- 				"diagnostics",
-- 				sources = { "nvim_diagnostic" },
-- 				sections = { "error", "warn", "info" },
-- 				symbols = { error = "❎ ", warn = "⚠️ ", info = "ℹ️ " },
-- 			},
-- 			{
-- 				"filename",
-- 				file_status = true,
-- 				path = 1,
-- 				symbols = { modified = "✏️  ", readonly = "🔒 " },
-- 			},
-- 		},
-- 		lualine_c = {},
-- 		lualine_x = {},
-- 		lualine_y = {
-- 			{
-- 				function()
-- 					local msg = "💤"
-- 					local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
-- 					local clients = vim.lsp.get_clients()
-- 					if next(clients) == nil then
-- 						return msg
-- 					end
-- 					for _, client in ipairs(clients) do
-- 						local filetypes = client.config.filetypes
-- 						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 							return "🔧 " .. client.name
-- 						end
-- 					end
-- 					return msg
-- 				end,
-- 			},
-- 			"filetype",
-- 		},
-- 		lualine_z = { "📍 %l:%c", "📊 %p%%/%L" },
-- 	}),
-- 	inactive_sections = {
-- 		lualine_c = { "%f %y" },
-- 		lualine_x = {},
-- 	},
-- })
