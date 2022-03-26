--
-- Todo-comments
-- TODO: Does this have any effect?
--
return { 'folke/todo-comments.nvim',
	config = function()
		local C = PREFERENCES.misc.colors
		require("todo-comments").setup({
			keywords = {
				FIX		= {
					icon	= '',
					color = C.orange,
					alt		= { 'FIXED', 'BUG', 'ISSUE', 'FIXME', 'TOFIX' }
				},

				TODO	= {
					icon	= '',
					color = C.blue,
					alt		= {'NOT_IMPLEMENTED', 'WIP', 'WORK_IN_PROGRESS'}
				},

				HACK	= {
					icon	= 'ﮏ',
					color	= C.green,
					alt		= {'HAX'}
				},

				WARNING	= {
					icon	= '',
					color	= C.cherryred,
					alt		= {'WARN','ERROR'}
				},

				DISABLED = {
					icon  = '',
					color = C.red,
					alt		= {'EXCL'}
				},

				OPTIMIZE = {
					icon	= '',
					color	= C.turquoise,
					alt		= {'API', 'ENHANCE', 'OPT', 'SPEED', 'PERFORMANCE', 'EXTEND'}
				},

				NOTE		= {
					icon	= '',
					color	= C.orange,
					alt		= {'INFO', 'EXPERIMENTAL', 'N.B.'}
				},

				TEST		= {
					icon  = '',
					color	= C.violet,
					alt		= {'TESTCASE'}
				},

				THANKS = {
					icon  = '',
					color	= C.pink,
					alt		= {'THX'}
				}
			}
		})
	end}

