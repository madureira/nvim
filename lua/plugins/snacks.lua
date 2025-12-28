return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          explorer = { enabled = true },
          input = { enabled = false },
          auto_close = false,
          jump = { close = false },
        },
      },
    },
  },
}
