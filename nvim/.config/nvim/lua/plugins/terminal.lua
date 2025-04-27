return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = function()
    local config = require("toggleterm")
    config.setup({
      shade_terminals = false,
      persist_size = false,
      size = function(term)
        if term.direction == "horizontal" then
          return 16
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
    })

    function _G.set_terminal_keymaps()
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
    end

    vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
    vim.keymap.set("n", "<leader>t", ":ToggleTerm dir=. direction=horizontal name=term<CR>", { desc = "Telescope find files" })
  end,
}
