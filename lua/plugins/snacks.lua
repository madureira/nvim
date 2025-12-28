return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          explorer = {
            enabled = true,
            hidden = true,
            auto_close = false,
            win = {
              list = {
                keys = {
                  ["-"] = "edit_split",
                  ["|"] = "edit_vsplit",
                  ["."] = "explorer_focus",
                  ["O"] = { { "pick_win", "jump" }, mode = { "n", "i" } },
                },
              },
            },
          },
          input = { enabled = false },
          auto_close = false,
          jump = { close = false },
        },
      },
    },
  },
}
