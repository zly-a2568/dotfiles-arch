local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://gitproxy.mrhjx.cn/https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'git@github.com:wbthomason/packer.nvim'
  -- use 'git@github.com:folke/tokyonight.nvim'
  use 'git@github.com:navarasu/onedark.nvim'
  use {
    'git@github.com:nvim-lualine/lualine.nvim',
    requires = { "git@github.com:nvim-tree/nvim-web-devicons", opt = true }
  }
  use {
    'git@github.com:nvim-tree/nvim-tree.lua.git',
    requires = { "git@github.com:nvim-tree/nvim-web-devicons" }
  }
  use 'git@github.com:mason-org/mason.nvim'
  use 'git@github.com:mason-org/mason-lspconfig.nvim'
  use 'git@github.com:neovim/nvim-lspconfig'
  use 'git@github.com:hrsh7th/nvim-cmp'
  use 'git@github.com:hrsh7th/cmp-nvim-lsp'
  use 'git@github.com:hrsh7th/cmp-buffer'
  use 'git@github.com:hrsh7th/cmp-path'
  use 'git@github.com:L3MON4D3/LuaSnip'
  use 'git@github.com:saadparwaiz1/cmp_luasnip'
  use 'git@github.com:brenton-leighton/multiple-cursors.nvim'

  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
