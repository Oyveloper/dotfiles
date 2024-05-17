-- remaps for nvim
--

local opts = { noremap = false, silent = true }
local noremap_opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap

local function remap(mode, from, to)
  keymap(mode, from, to, opts)
end

local function noremap(mode, from, to)
  keymap(mode, from, to, noremap_opts)
end

remap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
remap("n", "<C-h>", "<C-w>h")
remap("n", "<C-j>", "<C-w>j")
remap("n", "<C-k>", "<C-w>k")
remap("n", "<C-l>", "<C-w>l")
--
-- remap("n", "<leader>w", "<C-w>") keymap("n", "<C-l>", "<C-w>l")
remap("n", "<leader>i", ":e ~/.zshrc<CR>")
--[[ remap("n", "<leader>ve", ":e ~/.config/nvim/init.lua<CR>") ]]
noremap("n", "<C-d>", "<C-d>zz")
noremap("n", "<C-u>", "<C-u>zz")

-- Pasting in visual mode
remap("v", "p", '"_dP')
remap("n", "<leader>w", "<C-w>")

noremap("n", "<C-_>", ":Switch<CR>")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.cmd([[
    vnoremap < <gv
    vnoremap > >gv

    " Marks
    nmap - '


    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv
    " Search
    nnoremap N Nzz
    nnoremap n nzz


    " Easymotion
    map ø <Plug>(easymotion-prefix)s

]])

-- files
--
if vim.g.vscode == nil then
  -- Telescope
  remap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
  remap("n", "<leader>fg", ":Telescope git_files hidden=true<CR>")
  remap("n", "<leader>fa", ":Telescope find_files hidden=true<CR>")
  remap("n", "<leader>ft", ":Telescope live_grep<CR>")
  noremap("n", "<leader>fif", ":Telescope current_buffer_fuzzy_find<CR>")
  noremap("n", "<leader>fk", ":Telescope keymaps<CR>")
  noremap("n", "<leader>fb", ":Telescope buffers<CR>")
  noremap("n", "<leader>fs", ":Telescope lsp_dynamic_workspace_symbols<CR>")
  noremap("n", "<leader>fd", ":Telescope diagnostics<CR>")
  noremap("n", "<leader>fc", ":Telescope commands<CR>")
  noremap("n", "<leader>fp", ":Telescope projects<CR>")
  noremap("n", "<leader>T", ":Telescope<CR>")
  remap("n", "<leader>wf", ":lua require('nvim-window').pick()<CR>")

  remap("n", "<leader>ll", ":Lazy<CR>")

  remap("n", "<leader>ve", ":Telescope find_files cwd=/$HOME/dotfiles/vim/.config/nvim/<CR>")

  remap("n", "<leader>e", ":NvimTreeToggle<CR>")

  -- finding references
  remap("n", "gr", ":Telescope lsp_references theme=cursor<CR>")
  remap("n", "<leader>gg", ":LazyGit<CR>")
  noremap("n", "<leader>gb", ":Gitsigns blame_line<CR>")
  remap("n", "<leader>tk", ":lua _K9S_TOGGLE()<CR>")
  remap("n", "<leader>th", ":lua _HTOP_TOGGLE()<CR>")

  --[[ remap("n", "<leader>tt", ":TodoQuickFix<CR>") ]]
  -- dapui
  remap("n", "<leader>dd", ":lua require('dapui').toggle()<CR>")
  remap("n", "<leader>db", ":DapToggleBreakpoint<CR>")
  remap("n", "<leader>ds", ":lua require('dapui').open()<CR>:DapContinue<CR>")
  remap("n", "<leader>dc", ":DapContinue<CR>")
  remap("n", "<leader>dn", ":DapStepOver<CR>")
  remap("n", "<leader>dr", ":RustDebuggables<CR>")

  -- toggleterm
  remap("n", "<leader>tt", ":ToggleTermToggleAll<CR>")

  vim.cmd([[


    nmap <leader>bn :BufferLineCycleNext<CR>
    nmap <leader>bp :BufferLineCyclePrev<CR>

    nmap <tab> :BufferLineCycleNext<CR>
    nmap <S-tab> :BufferLineCyclePrev<CR>

    nmap <leader>bk :Bdelete<CR>
    nnoremap <leader>bo :%bd<CR>:e#<CR>:bd#<CR>
    nmap <leader>bb :buffers<CR>
    nnoremap <leader>bl :b#<CR>

    nmap <leader>pi :PlugInstall<CR>
    nmap <leader>pu :UpdateRemotePlugins<CR>

    nmap <leader>vr :luafile ~/.config/nvim/init.lua<CR>

    nmap <leader>qq :qa<CR>

    nmap gs :vsplit<CR>gd=gd

    " Javascript
    nmap <leader>jd O/**<CR>

    ]])
else
  noremap("n", "<tab>", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
  noremap("n", "<s-tab>", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")
  vim.cmd([[

    nnoremap <leader>ff <Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>
    nnoremap gs <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
    nnoremap <leader>op <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
    nnoremap gn <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
    nnoremap gp <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
    nnoremap <leader>e  <Cmd>call VSCodeNotify('workbench.files.action.showActiveFileInExplorer')<CR>

    nnoremap <leader>wL <Cmd>call VSCodeNotify('workbench.action.moveEditorToNextGroup')<CR>
    nnoremap <leader>wH <Cmd>call VSCodeNotify('workbench.action.moveEditorToPreviousGroup')<CR>
    nnoremap <leader>wL <Cmd>call VSCodeNotify('workbench.action.moveEditorToNextGroup')<CR>
    nnoremap <leader>wH <Cmd>call VSCodeNotify('workbench.action.moveEditorToPreviousGroup')<CR>
    nnoremap <leader>wJ <Cmd>call VSCodeNotify('workbench.action.splitDown')<CR>
    nnoremap <leader>r <Cmd>call VSCodeNotify('editor.action.refactor')<CR>
    nnoremap <leader>pr <Cmd>call VSCodeNotify('workbench.action.debug.start')<CR>
    nnoremap <leader>r <Cmd>call VSCodeNotify('editor.action.refactor')<CR>
    nnoremap <leader>wo <Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR><Cmd>call VSCodeNotify('workbench.action.closeEditorsInOtherGroups')<CR>
    nnoremap <leader>bk <Cmd>call VSCodeNotify('workbench.action.closeWindow')
    nnoremap <leader>ve :e ~/.config/nvim/init.lua<CR>
    nnoremap <leader>vk :e ~/.config/nvim/lua/user/keymap.lua<CR>


  ]])

  remap("n", "<leader>gg", "<Cmd>call VSCodeNotify('lazygit.openLazygit')<CR>")
  remap("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
end
