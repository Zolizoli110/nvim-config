require('lualine').setup {
  options = {
    icons_enabled = true,
  },
  sectons = {
    lualine_a = {
      {
        'filename',
        path = 1,
      }
    }
  }
}
