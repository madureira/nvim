return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function()
      require("nvim-treesitter.install").compilers = { "clang", "cc", "gcc" }
    end,
    config = function()
      require("nvim-treesitter").setup({
        -- A list of parser names, or "all"
        ensure_installed = {
          "bash",
          "c",
          "cpp",
          "html",
          "java",
          "javascript",
          "jsdoc",
          "json",
          "jsx",
          "lua",
          "luadoc",
          "markdown",
          "python",
          "rust",
          "sql",
          "toml",
          "tsx",
          "typescript",
          "xml",
          "yaml",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
        auto_install = true,

        folds = { enable = true },

        indent = {
          enable = true,
        },

        highlight = {
          -- `false` will disable the whole extension
          enable = true,
          additional_languages = {},
        },

        textobjects = { enable = true },

        additional_vim_regex_highlighting = { "markdown" },
      })

      require("nvim-treesitter").install({
        "bash",
        "c",
        "cpp",
        "html",
        "java",
        "javascript",
        "jsdoc",
        "json",
        "jsx",
        "lua",
        "luadoc",
        "markdown",
        "python",
        "rust",
        "sql",
        "toml",
        "tsx",
        "typescript",
        "xml",
        "yaml",
      })
    end,
  },
}
