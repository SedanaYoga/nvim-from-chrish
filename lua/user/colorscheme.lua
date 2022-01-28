-- vim.cmd [[
-- try
--   colorscheme dracula
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]

-- local colorscheme = "dracula"
local colorscheme = "tokyonight"
-- local colorscheme = "material"

-- Tokyonight setting
vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
-- Change the "hint" color to the "orange" color, and make the "error" color bright red
vim.g.tokyonight_colors = { hint = "orange", error = "#ff0000" }

-- Material Setting
-- vim.g.material_style = "palenight"
-- require("material").setup({
-- 	contrast = {
-- 		sidebars = true,
-- 		floating_windows = true,
-- 	},
-- 	italics = {
-- 		keywords = true,
-- 		functions = true,
-- 	},
-- 	contrast_filetypes = {
-- 		"terminal",
-- 		"packer",
-- 		"qf",
-- 	},
-- 	disable = {
-- 		borders = true,
-- 		eob_lines = true,
-- 	},
-- })
-- vim.api.nvim_set_keymap(
-- 	"n",
-- 	"<leader>ms",
-- 	':lua require("material.functions").toggle_style()<CR>',
-- 	{ noremap = true, silent = true }
-- )

-- Load the colorscheme
vim.cmd([[colorscheme tokyonight]])

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
end
