--neovim config 
vim.cmd.colorscheme("vim")
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.termguicolors = false
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.cmdheight = 1
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.cmdheight = 1

--autopairs
vim.keymap.set('i', '(', '()<Left>', { noremap = true })
vim.keymap.set('i', '{', '{}<Left>', { noremap = true })
vim.keymap.set('i', '[', '[]<Left>', { noremap = true })
vim.keymap.set('i', '"', '""<Left>', { noremap = true })
vim.keymap.set('i', "'", "''<Left>", { noremap = true })
vim.keymap.set('i', '`', '``<Left>', { noremap = true })

--keymaps
vim.keymap.set('i', 'jk', '<Esc>', { desc = 'Exit Insert Mode' })
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Exit Insert Mode' })
vim.keymap.set('n', 'L', ':tabnext<CR>', { desc = 'Pindah ke tab berikutnya' })
vim.keymap.set('n', 'H', ':tabprevious<CR>', { desc = 'Pindah ke tab sebelumnya' })


