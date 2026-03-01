vim.pack.add({
	"https://github.com/kawre/leetcode.nvim",
})

require("leetcode").setup({
	cn = { -- leetcode.cn
		enabled = true, ---@type boolean
		translator = true, ---@type boolean
		translate_problems = true, ---@type boolean
	},
})
