-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Enable diagnostic text wrapping
vim.diagnostic.config({
  virtual_text = {
    wrap = true,
    max_width = 80,  -- Set a max width to force wrapping
  },
  float = {
    wrap = true,
    max_width = 80,
  }
})
