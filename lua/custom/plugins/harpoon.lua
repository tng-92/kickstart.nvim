return {
  'theprimeagen/harpoon',
  config = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    local keymap = vim.keymap

    -- Setting the marking
    keymap.set('n', '<leader>tt', mark.add_file)

    -- Setting the UI
    keymap.set('n', '<leader>hh', ui.toggle_quick_menu)

    -- Setting the quick navigation
    keymap.set('n', '<C-b>', function()
      ui.nav_prev()
    end)
    keymap.set('n', '<C-m>', function()
      ui.nav_next()
    end)

    -- Setting the exact navigation
    keymap.set('n', '<C-t>', function()
      ui.nav_file(1)
    end)
    keymap.set('n', '<C-e>', function()
      ui.nav_file(2)
    end)
    keymap.set('n', '<C-s>', function()
      ui.nav_file(3)
    end)
    keymap.set('n', '<C-a>', function()
      ui.nav_file(4)
    end)
  end,
}
