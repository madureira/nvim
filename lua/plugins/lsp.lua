return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      -- Mason will ensure these are installed (via mason-lspconfig)
      servers = {
        -- --------------------
        -- Lua (lua_ls)
        -- --------------------
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              telemetry = { enable = false },
            },
          },
        },

        -- --------------------
        -- Rust (rust_analyzer)
        -- --------------------
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = "clippy",
              },
              procMacro = {
                enable = true,
              },
            },
          },
        },

        -- --------------------
        -- C / C++ (clangd)
        -- --------------------
        clangd = {
          -- You can tweak clangd behavior here. LazyVim will call lspconfig.clangd.setup(opts)
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--header-insertion=iwyu",
          },
        },
      },
    },
  },

  -- (Optional but recommended) diagnostic UI tweaks globally
  {
    "LazyVim/LazyVim",
    opts = {
      diagnostics = {
        virtual_text = false, -- less noisy
        underline = true,
        severity_sort = true,
        float = { border = "rounded" },
      },
    },
  },

  -- (Optional) format on save, per filetype
  -- LazyVim uses conform.nvim for formatting by default.
  {
    "stevearc/conform.nvim",
    opts = {
      format_on_save = function(bufnr)
        local ft = vim.bo[bufnr].filetype
        local allow = {
          lua = true,
          rust = true,
          c = true,
          cpp = true,
        }
        if allow[ft] then
          return { timeout_ms = 2000, lsp_fallback = true }
        end
        return
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
      },
    },
  },
}
