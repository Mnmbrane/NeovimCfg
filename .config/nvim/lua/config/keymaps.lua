---------- GENERAL ----------
-- ctrl + a is not set for tmux need to use something else
vim.keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
vim.keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- Move while in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")

---------- TELESCOPE ----------
vim.keymap.set("n", "<leader>fd", function()
  require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") })
end, { desc = "Find files (current dir)" })

-- Find hidden files
vim.keymap.set("n", "<leader>fh", function()
  require("telescope.builtin").find_files({ hidden = true })
end, { desc = "Find files (including hidden)" })

-- Find all files (hidden + no_ignore)
vim.keymap.set("n", "<leader>fa", function()
  require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
end, { desc = "Find all files" })
