local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system {
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

local packer_bootstrap = ensure_packer()
vim.cmd 'packadd packer.nvim'

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- My plugins here
  use 'folke/tokyonight.nvim' -- theme
  use {
  'nvim-tree/nvim-tree.lua', -- file tree
  requires = {
      'nvim-tree/nvim-web-devicons', -- file icons
    },
  }
  use 'nvim-treesitter/nvim-treesitter' -- high lighting
  use {
    'nvim-telescope/telescope.nvim', -- file browser
    tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim'} }
  }
  use 'nvim-lualine/lualine.nvim' -- status bar
  -- LSP
  use 'neovim/nvim-lspconfig' -- lsp server
  use "williamboman/nvim-lsp-installer" -- LSP installer
  use "jose-elias-alvarez/null-ls.nvim" -- formatter

  -- completion
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"

  -- buffers, tabs, windiows
  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  --snippets
  use "L3MON4D3/LuaSnip" -- Lua snippet engine
  use "rafamadriz/friendly-snippets" -- snippets

  use "windwp/nvim-autopairs" -- Autopairs (), {}, [], etc.

  if packer_bootstrap then
    require('packer').sync()
  end
end)
