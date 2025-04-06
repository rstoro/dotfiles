return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = { "lua", "go", "javascript", "vim", "c", "vimdoc", "python", "c_sharp", "markdown", "markdown_inline", "gdscript" },
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
