return {
	"mattn/emmet-vim",
	config = function()
		vim.g.user_emmet_install_global = 0
		vim.g.user_emmet_leader_key = "<C-y>"
		vim.cmd([[
            autocmd FileType html,css,typescriptreact,javascriptreact,typescript,javascript EmmetInstall
        ]])
	end,
	ft = { "html", "css", "typescriptreact", "javascriptreact", "typescript", "javascript" },
}
