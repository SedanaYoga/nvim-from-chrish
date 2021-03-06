local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[ augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") --Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") --Easily comment stuff
	-- use "terrortylor/nvim-comment"
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("Mofiqul/dracula.nvim")
	use("folke/tokyonight.nvim")
	use("marko-cerovac/material.nvim")
	-- use("ghifarit53/tokyonight-vim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp") -- Completion for NVIM LSP
	use("hrsh7th/cmp-nvim-lua") -- Completion for NVIM LUA
	use("hrsh7th/cmp-emoji")
	use({ "tzachar/cmp-tabnine", run = "./install.sh", requires = "hrsh7th/nvim-cmp" })

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use({ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" })

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for

	--Telescope
	use("nvim-telescope/telescope.nvim")

	-- Telescope Media Files
	use("nvim-telescope/telescope-media-files.nvim")

	--Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("p00f/nvim-ts-rainbow")

	-- GIT
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")

	-- Surround
	use("tpope/vim-surround")

	-- Null - ls
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Markdown Preview
	use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })

	-- Toggle Term
	use({ "akinsho/toggleterm.nvim" })

	-- Colorizer
	use("norcalli/nvim-colorizer.lua")

	-- Vim Be Good
	use("ThePrimeagen/vim-be-good")

	--Documentation
	use("kkoomen/vim-doge")
	-- Emmet
	use("mattn/emmet-vim")
	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins

	-- Impatient
	-- Improve startup time Neovim
	use("lewis6991/impatient.nvim")

	--Indentline
	use("lukas-reineke/indent-blankline.nvim")

	-- Alpha: Dashboard
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- this is needed to fix lsp doc highlight

	-- Project nvim
	use("ahmedkhalf/project.nvim")

	-- Which Key
	use("folke/which-key.nvim")

	-- NVIM TS Autotag
	use("windwp/nvim-ts-autotag")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
