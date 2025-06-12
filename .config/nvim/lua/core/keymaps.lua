-- Escape key
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "  -- pour les mappings locaux

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- save without auto-formating
vim.keymap.set('n', '<Leader>sn', '<cmd>noautocmd w <CR>', { noremap = true, silent = true })

-- quit file
vim.keymap.set('n', '<C-x>', '<cmd>Bdelete<CR>', {noremap = true, silent = true })

-- delete single caracter without copying into register
vim.keymap.set('n', 'x', '"_x', { noremap = true, silent = true })

--vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })

--find and center
vim.keymap.set('n', 'n', 'nzzzv', { noremap = true, silent = true })
vim.keymap.set('n', 'N', 'Nzzzv', { noremap = true, silent = true })

-- resize with arrow
vim.keymap.set('n', '<Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true }) -- shift tab
vim.keymap.set('n', '<Leader>x', ':bdelete!<CR>', { noremap = true, silent = true }) --close
vim.keymap.set('n', '<Leader>b', '<cmd> enew <CR>', { noremap = true, silent = true }) -- new

-- window management
vim.keymap.set('n', '<Leader>v', '<C-w>v', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>se', '<C-w>=', { noremap = true, silent = true })

-- tabs
vim.keymap.set('n', '<Leader>to', ':tabnew<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tx', ':tabclose<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tn', ':tabn<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<Leader>tp', ':tabp<CR>', { noremap = true, silent = true })

-- togle line warning
vim.keymap.set('n', '<Leader>lw', '<cmd>set wrap!<CR>', { noremap = true, silent = true })

-- keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dp', { noremap = true, silent = true })

-- better indent
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = ""})
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = ""})
vim.keymap.set('n', '<Leader>d', vim.diagnostic.open_float, { desc = ""})
vim.keymap.set('n', '<Leader>q', vim.diagnostic.open_float, { desc = ""})

--Mode normal : Coller depuis le presse-papiers
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Paste to system clipboard" })

-- Mode insertion pour coller
vim.keymap.set("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard (insert mode)" })

-- Déplacement entre buffer a la vim
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to below split" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to above split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })
