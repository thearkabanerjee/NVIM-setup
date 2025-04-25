-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
--
--

vim.keymap.set("n", "<leader>dir", function()
  local dir = vim.fn.input("📁 New directory: ", "", "dir")
  if dir ~= "" then
    vim.fn.mkdir(dir, "p")
    print("✅ Created directory: " .. dir)
  else
    print("⚠️ Directory was not created!")
  end
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>%", function()
  local file = vim.fn.input("📝 New file path: ")
  if file ~= "" then
    local dir = vim.fn.fnamemodify(file, ":h")
    if dir ~= "" and vim.fn.isdirectory(dir) == 0 then
      vim.fn.mkdir(dir, "p") -- create parent folders
    end
    local f = io.open(file, "w")
    if f then
      f:close()
      vim.cmd("edit " .. file) -- open file in buffer
      print("✅ Created and opened file: " .. file)
    else
      print("❌ Failed to create file: " .. file)
    end
  else
    print("⚠️ File path was empty!")
  end
end, { noremap = true, silent = true })
