----------------
-- Plugins    --
----------------
return (function()
	--- Packer location
	local packerpath = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	local bootstrap = false
	if vim.fn.empty(vim.fn.glob(packerpath)) > 0 then
		bootstrap = true end

	--- Bootstrap packer
	if bootstrap then
		vim.fn.system({'git','clone','--depth','1','https://github.com/wbthomason/packer.nvim', packerpath}) end

	-- TODO: Fix this
	local PKGS_PATH = 'setup/pkg'
	local function pkg(file)
		local f, e = loadfile(string.format('%s/%s/%s.lua', vim.fn.stdpath('config'), PKGS_PATH, file))

		-- Print error
		if e then print(vim.inspect(e)) return end
		return f()
	end

	local packer = require('packer')
	packer.init({ auto_reload_compiled = false, config = { profile = { enable = true }}})
	require('packer.luarocks').install_commands()
	packer.startup(function(use, use_rocks)
		local function usepkg(fn) use(pkg(fn)) end

		--- N.B.: nvim stands for nvim only plugins (exclusive)
		--- N.B.: vim stands for vim and nvim plugins
		--- N.B.: grp stands for group of plugins

		--- Local Packages ---
		usepkg('local-utils.nvim')

		--- Packer and Fundamental packages ---
		usepkg('packer.nvim')
		usepkg('fundamentals.grp')

		--- Colorschemes ---
		usepkg('colorschemes.grp')

		--- UI ---
		usepkg('feline.nvim')
		usepkg('gitsigns.nvim')
		usepkg('todo-comments.nvim')
		usepkg('nvim-transparent.nvim')
		usepkg('bufferline.nvim')
		usepkg('indent-blankline.nvim')

		--- Telescope ---
		usepkg('telescope.nvim')
		usepkg('nvim-neoclip.nvim')

		--- Functional ---
		usepkg('wilder.nvim')
		usepkg('focus.nvim')
		usepkg('nvim-window.nvim')
		usepkg('nvim-comment.nvim')
		usepkg('nvim-colorizer.nvim')
		usepkg('mini.nvim')
		usepkg('bufdelete.nvim')
		usepkg('harpoon.nvim')

		--- Projects ---
		usepkg('project.nvim')

		--- Treesitter ---
		usepkg('nvim-treesitter.nvim')

		--- LSP ---
		usepkg('nvim-autopairs.nvim')
		usepkg('lsp.grp')


		if bootstrap then
			vim.cmd('autocmd User PackerCompileDone quitall')
			packer.sync()
		end
	end)

	--- End configuration prematurely if bootstrapping
	return bootstrap

	end)()
