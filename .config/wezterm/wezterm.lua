--- import wezterm and other modules
local wezterm = require 'wezterm'
local appearance = require 'appearance'
local everforest = require 'colors_everforest'
local tab_format = require 'tab_format'

--- base config to build on
local config = wezterm.config_builder()

--- user config
--- consts
local tab_font_size = 14

--- default shell
config.default_prog = { '/usr/local/bin/fish', '-l' }

--- colors
if appearance.is_dark() then
  config.color_scheme = 'Everforest Dark (Gogh)'
  config.window_frame = {
    active_titlebar_bg = color_efd_bg_dim,
    inactive_titlebar_bg = color_efd_bg_dim,
    font = wezterm.font({ family = 'Operator Mono', weight = 'Bold' }),
    font_size = tab_font_size,
  }
  config.colors = {
    tab_bar = {
      active_tab = {
        bg_color = everforest.dark_bg0,
        fg_color = everforest.dark_fg,
      },
      inactive_tab = {
        bg_color = '#333333',
        fg_color = everforest.dark_fg,
      },
      inactive_tab_hover = {
        bg_color = everforest.dark_bg0,
        fg_color = everforest.dark_fg,
      },
      new_tab = {
        bg_color = '#333333',
        fg_color = everforest.dark_fg,
      },
      new_tab_hover = {
        bg_color = everforest.dark_bg_dim,
        fg_color = everforest.dark_fg,
      },
    }
  }
else
  config.color_scheme = 'Everforest Light (Gogh)'
  config.window_frame = {
    active_titlebar_bg = everforest.light_bg_dim,
    inactive_titlebar_bg = everforest.light_bg_dim,
    font = wezterm.font({ family = 'Operator Mono', weight = 'Bold' }),
    font_size = tab_font_size,
  }
  config.colors = {
    tab_bar = {
      active_tab = {
        bg_color = everforest.light_bg0,
        fg_color = everforest.light_fg,
      },
      inactive_tab = {
        bg_color = everforest.light_bg_dim,
        fg_color = everforest.light_fg,
      },
      inactive_tab_hover = {
        bg_color = everforest.light_bg0,
        fg_color = everforest.light_fg,
      },
      new_tab = {
        bg_color = everforest.light_bg_dim,
        fg_color = everforest.light_fg,
      },
      new_tab_hover = {
        bg_color = everforest.light_bg_dim,
        fg_color = everforest.light_fg,
      },
    }
  }
end

--- font
config.font = wezterm.font({ family = 'Operator Mono' })
config.font_size = 13

--- window
config.initial_rows = 64
config.initial_cols = 128
config.window_decorations = 'RESIZE|INTEGRATED_BUTTONS|MACOS_FORCE_ENABLE_SHADOW'
config.window_background_opacity = 0.90
config.macos_window_background_blur = 30

return config

