-- neovide configuration
if vim.g.neovide then
  -- vim.o.guifont = "Fira Code,Symbols Nerd Font Mono:h13"
  -- vim.o.guifont = "BlexMono Nerd Font,Symbols Nerd Font Mono:h13"
  vim.o.guifont = 'VictorMono Nerd Font,Symbols Nerd Font Mono:h16'
  -- vim.o.guifont = "CommitMonoLigatures,Symbols Nerd Font Mono:h13"

  vim.opt.linespace = 0

  -- macOS
  vim.g.neovide_input_macos_option_key_is_meta = 'only_left'

  vim.g.neovide_transparency = 1.0
  -- vim.g.neovide_window_blurred = true
  vim.g.neovide_position_animation_length = 0.15
  vim.g.neovide_scroll_animation_length = 0.2
  vim.g.neovide_scroll_animation_far_lines = 1
  vim.g.neovide_hide_mouse_when_typing = false
  vim.g.neovide_refresh_rate = 60

  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_size = 0.5
  vim.g.neovide_cursor_antialiasing = true
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true
  vim.g.neovide_cursor_unfocused_outline_width = 0.125
  vim.g.neovide_cursor_smooth_blink = true
  -- (long) railgun, torpedo, pixiedust
  -- (short) sonicboom, ripple, wireframe,
  vim.g.neovide_cursor_vfx_mode = 'sonicboom'
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.0
  vim.g.neovide_cursor_vfx_particle_density = 7.0
  vim.g.neovide_cursor_vfx_particle_speed = 10.0
  vim.g.neovide_cursor_vfx_particle_phase = 1.5 -- only for railgun
  vim.g.neovide_cursor_vfx_particle_curl = 1.0  -- only for railgun
end
