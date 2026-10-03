vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set('n', "<C-s>", ':w<CR>', { desc = '保存文件' })
keymap.set('n', "<C-q>", ':q<CR>')


keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '>-2<CR>gv=gv")

keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

keymap.set("n", "<C-Up>",":MultipleCursorsAddUp<CR>")
keymap.set("n", "<C-Down>",":MultipleCursorsAddDown<CR>")
keymap.set("n", "<C-LeftMouse>",":MultipleCursorsMouseAddDelete<CR>")
keymap.set("n", "<C-l>","<Cmd>MultipleCursorsLock<CR>")
