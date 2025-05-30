return {
  'tpope/vim-fugitive',
  config = function()
    -- === General mappings (always available) ===
    vim.keymap.set('n', '<leader>gs', ':G<CR>', { desc = 'Fugitive: Git status' })
    vim.keymap.set('n', '<leader>gc', ':G commit<CR>', { desc = 'Fugitive: Git commit' })

    -- === Buffer-local mappings (only in fugitive buffer) ===
    local munches_setup = vim.api.nvim_create_augroup('munches_setup', {})
    local autocmd = vim.api.nvim_create_autocmd

    autocmd('BufWinEnter', {
      group = munches_setup,
      pattern = '*',
      callback = function()
        if vim.bo.ft ~= 'fugitive' then
          return
        end

        local bufnr = vim.api.nvim_get_current_buf()
        local opts = { buffer = bufnr, remap = false }

        vim.keymap.set('n', '<leader>gp', function()
          vim.cmd.Git 'push'
        end, opts)

        -- Rebase always
        vim.keymap.set('n', '<leader>gP', function()
          vim.cmd.Git { 'pull', '--rebase' }
        end, opts)

        -- Allows setting branch/tracking explicitly
        vim.keymap.set('n', '<leader>gt', ':Git push -u origin ', opts)
      end,
    })
  end,
}
