--
-- nvim-trasparent
-- Remove background colors from terminal, now it is lookthrough!
--
return { 'xiyaowong/nvim-transparent',
	config = function()
		require('transparent').setup({
			enable = true,
			extra_groups = {
				'TelescopeNormal'
			}
		})
	end }
