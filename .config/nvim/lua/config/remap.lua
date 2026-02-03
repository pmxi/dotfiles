-- vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set({"n", "i"}, "<F7>", ":tabprevious<CR>", { desc = "Switch to the left tab" })
vim.keymap.set({"n", "i"}, "<F8>", ":tabnext<CR>", { desc = "Switch to the right tab" })
vim.keymap.set({"n", "i"}, "<S-F7>", ":tabmove -1<CR>", { desc = "Move tab to the left one" })
vim.keymap.set({"n", "i"}, "<S-F8>", ":tabmove +1<CR>", { desc = "Move tab right one" })
