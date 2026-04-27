return {
  "saghen/blink.cmp",
  opts = function(_, opts)
    vim.g.completion_enabled = vim.g.completion_enabled or false

    Snacks.toggle({
      name = "Completion",
      get = function() return vim.g.completion_enabled end,
      set = function(state) vim.g.completion_enabled = state end,
    }):map("<leader>uk")

    opts.enabled = function()
      return vim.g.completion_enabled
    end
    return opts
  end,
}
