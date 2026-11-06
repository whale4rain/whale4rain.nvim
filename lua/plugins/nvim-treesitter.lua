vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").install({
	"go", "c", "lua", "vim", "vimdoc", "query",
	"python", "rust", "javascript", "html", "cpp", "regex",
})

vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("UserTreesitterStart", { clear = true }),
	callback = function(ev)
		pcall(vim.treesitter.start, ev.buf)
	end,
})

vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.wo.foldlevel = 99
