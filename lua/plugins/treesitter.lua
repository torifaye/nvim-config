-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "lua",
      "vim",
      "elixir",
      "rust",
      "gleam",
      "python",
      "typescript",
      "purescript",
      "haskell",
      "haskell_persistent",
      "ocaml",
      "ocaml_interface",
      -- add more arguments for adding more treesitter parsers
    },
  },
}
