local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
  return
end

toggleterm.setup({
  size = 50,
  open_mapping = [[<C-å>]],
  hide_numbers = true,
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 4,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "vertical",
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = "curved",
    winblend = 0,
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
})

vim.cmd([[
autocmd TermEnter term://*toggleterm#*
\ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
" nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
" inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>

]])
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  -- vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<nop>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })

function _LAZYGIT_TOGGLE()
  lazygit:toggle()
end

local ncdu = Terminal:new({ cmd = "ncdu", hidden = true, direction = "float" })

function _NCDU_TOGGLE()
  ncdu:toggle()
end

local htop = Terminal:new({ cmd = "htop", hidden = true, direction = "float" })

function _HTOP_TOGGLE()
  htop:toggle()
end

local python = Terminal:new({ cmd = "python3", hidden = true, direction = "float" })

function _PYTHON_TOGGLE()
  python:toggle()
end

local k9s = Terminal:new({ cmd = "k9s", hidden = true, direction = "float" })

function _K9S_TOGGLE()
  k9s:toggle()
end
