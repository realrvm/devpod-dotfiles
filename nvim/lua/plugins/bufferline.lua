return {
  'akinsho/nvim-bufferline.lua',
  config = function()
    require('bufferline').setup({
      options = {
        mode = "tabs",
        always_show_bufferline = false,
        show_buffer_close_icons = false,
        show_close_icon = false,
        color_icons = true,
        view = "multiwindow"
      },
      highlights = {
        separator = {
          fg = '#7c6f64',
          bg = '#282828',
        },
        separator_selected = {
          fg = '#32302f',
        },
        background = {
          fg = '#858582',
          bg = '#282828'
        },
        buffer_selected = {
          fg = '#fdf6e3',
          bold = true,
        },
        fill = {
          bg = '#282828'
        }
      },
    })
  end
}
