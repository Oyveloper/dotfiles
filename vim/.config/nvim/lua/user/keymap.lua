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
-- remap("n", "<leader>w", "<C-w>") keymap("n", "<C-l>", "<C-w>l")
remap("n", "<C-h>", "<C-w>h")
remap("n", "<C-j>", "<C-w>j")
remap("n", "<C-k>", "<C-w>k")
remap("n", "<C-l>", "<C-w>l")
remap("n", "<leader>i", ":e ~/.zshrc<CR>")
remap("n", "<leader>ve", ":e ~/.config/nvim/init.lua<CR>")

-- Pasting in visual mode
remap("v", "p", '"_dP')
remap("n", "<leader>w", "<C-w>")

-- files
--
if vim.g.vscode == nil then
	remap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
	remap("n", "<leader>ft", ":Telescope live_grep<CR>")
	remap("n", "<leader>e", ":NvimTreeToggle<CR>:NvimTreeRefresh<CR>")

	-- finding references
	remap("n", "gr", ":Telescope lsp_references<CR>")
	remap("n", "<leader>gg", ":LazyGit<CR>")
	remap("n", "<leader>tk", ":lua _K9S_TOGGLE()<CR>")
	remap("n", "<leader>th", ":lua _HTOP_TOGGLE()<CR>")

	remap("n", "<leader>tt", ":TodoQuickFix<CR>")
	vim.cmd([[


    nmap <leader>bn :BufferLineCycleNext<CR>
    nmap <leader>bp :BufferLineCyclePrev<CR>

    nmap <tab> :BufferLineCycleNext<CR>
    nmap <S-tab> :BufferLineCyclePrev<CR>

    nmap <leader>bk :b#<CR>:bd#<CR>
    nnoremap <leader>bo :%bd<CR>:e#<CR>:bd#<CR>
    nmap <leader>bb :buffers<CR>

    nmap <leader>pi :PlugInstall<CR>
    nmap <leader>pu :UpdateRemotePlugins<CR>

    nmap <leader>vr :luafile ~/.config/nvim/init.lua<CR>

    nmap <leader>qq :qa<CR>

    nmap gs :vsplit<CR>gd=gd

    " Javascript
    nmap <leader>jd O/**<CR>

    " Easymotion
    map <leader>ø <Plug>(easymotion-prefix)

    vnoremap J :m '>+1<CR>gv=gv
    vnoremap K :m '<-2<CR>gv=gv


    vnoremap < <gv
    vnoremap > >gv

    " Marks
    nmap - '


    " Search
    nnoremap N Nzz
    nnoremap n nzz


    ]])
else
	noremap("n", "<tab>", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
	noremap("n", "<s-tab>", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")
	vim.cmd([[

    nnoremap <leader>ff <Cmd>call VSCodeNotify("workbench.action.quickOpen")<CR>
    nnoremap gs <Cmd>call VSCodeNotify('editor.action.revealDefinitionAside')<CR>
    nnoremap <leader>op <Cmd>call VSCodeNotify('workbench.view.explorer')<CR>
    nnoremap <leader>en <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>

    nnoremap <leader>wL <Cmd>call VSCodeNotify('workbench.action.moveEditorToNextGroup')<CR>
    nnoremap <leader>wH <Cmd>call VSCodeNotify('workbench.action.moveEditorToPreviousGroup')<CR>
  ]])

	remap("n", "<leader>gg", "<Cmd>call VSCodeNotify('workbench.action.tasks.runTask', 'lazygit')<CR>")
	remap("n", "<leader>rn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
end
