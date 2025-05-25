return {
  'kdheepak/lazygit.nvim',
  event = 'VimEnter',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },

  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },

  config = function()
    require('telescope').load_extension 'lazygit'
    vim.keymap.set('n', '<leader>gg', '<cmd>LazyGitCurrentFile<CR>', { noremap = true, silent = true })
    vim.g.lazygit_use_neovim_remote = 1
    vim.g.lazygit_use_custom_config_file_path = 0
    vim.g.lazygit_floating_window_winblend = 1
    vim.g.lazygit_floating_window_scaling_factor = 0.9
    vim.g.lazygit_floating_window_corner_chars = { '╭', '╮', '╰', '╯' }
    vim.g.lazygit_floating_window_use_plenary = 1
    vim.g.lazygit_floating_window_use_maps = 1
    vim.g.lazygit_floating_window_title = 1
    vim.g.lazygit_floating_window_win_opts = {
      border = 'single',
      width = 100,
      height = 100,
      row = 1,
      col = 1,
    }
  end,
}
