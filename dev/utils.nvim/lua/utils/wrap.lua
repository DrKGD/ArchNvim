local M = {}
	M.bind = function(flags, mode, key, op)
		vim.api.nvim_set_keymap(mode, key, op, flags or {}) end

	M.bind_to = function(bufnr, flags, mode, key, op)
		vim.api.nvim_buf_set_keymap(bufnr, mode, key, op, flags or {}) end

	M.unbind = function(mode, key)
		vim.api.nvim_set_keymap(mode, key, '<NOP>', {}) end
return M
