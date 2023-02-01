require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "cpp", "typescript", "javascript", "html" },

  sync_install = false,
  auto_install = true,
  highliht = {
    enable = true,
  },
}
