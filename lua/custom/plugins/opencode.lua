return {
  'NickvanDyke/opencode.nvim',
  dependencies = {
    -- Still needed for input prompts and picker
    { 'folke/snacks.nvim', opts = { input = {}, picker = {} } },
  },
  event = 'VeryLazy',
  keys = {
    {
      '<leader>oa',
      function()
        require('opencode').ask('@this: ', { submit = true })
      end,
      desc = 'Ask opencode',
      mode = { 'n', 'x' },
    },
    {
      '<leader>ox',
      function()
        require('opencode').select()
      end,
      desc = 'Execute opencode action',
      mode = { 'n', 'x' },
    },
    {
      '<leader>op',
      function()
        require('opencode').prompt '@this'
      end,
      desc = 'Add to opencode',
      mode = { 'n', 'x' },
    },
    {
      '<leader>ot',
      function()
        require('opencode').toggle()
      end,
      desc = 'Toggle opencode',
      mode = { 'n', 't' },
    },
    -- opencode navigation commands (work from anywhere)
    {
      '<leader>ou',
      function()
        require('opencode').command 'session.half.page.up'
      end,
      desc = 'Scroll opencode up',
      mode = { 'n', 't' },
    },
    {
      '<leader>od',
      function()
        require('opencode').command 'session.half.page.down'
      end,
      desc = 'Scroll opencode down',
      mode = { 'n', 't' },
    },
    {
      '<leader>ogg',
      function()
        require('opencode').command 'session.first'
      end,
      desc = 'Jump to first message',
      mode = { 'n', 't' },
    },
    {
      '<leader>oG',
      function()
        require('opencode').command 'session.last'
      end,
      desc = 'Jump to last message',
      mode = { 'n', 't' },
    },
  },
  config = function()
    vim.o.autoread = true

    vim.g.opencode_opts = {
      provider = {
        enabled = 'wezterm',
        wezterm = {
          direction = 'right', -- "left" | "right" | "top" | "bottom"
          top_level = false, -- false = split current pane, true = split entire window
          percent = 40, -- Size percentage (40% of available space)
        },
      },
    }
  end,
}
