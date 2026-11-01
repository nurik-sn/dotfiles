-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>r", function()
  local ft = vim.bo.filetype
  local cmd
  local cwd

  if ft == "rust" then
    cwd = vim.fs.root(0, "Cargo.toml")
    cmd = "cargo run"
  elseif ft == "scala" then
    cwd = vim.fs.root(0, "build.sbt")

    if cwd then
      cmd = "sbt run"
    else
      local file = vim.api.nvim_buf_get_name(0)
      cmd = "scala run " .. vim.fn.shellescape(file)
    end
  elseif ft == "haskell" then
    local file = vim.api.nvim_buf_get_name(0)

    local cabal_file = vim.fs.find(function(name)
      return name:match("%.cabal$") ~= nil
    end, {
      path = vim.fs.dirname(file),
      upward = true,
      type = "file",
    })[1]

    if cabal_file then
      cwd = vim.fs.dirname(cabal_file)
      cmd = "cabal run"
    else
      cwd = vim.fs.dirname(file)
      cmd = "runghc " .. vim.fn.shellescape(file)
    end
  else
    return
  end

  Snacks.terminal(cmd .. "; echo ''; echo 'Press enter to exit...'; read", { cwd = cwd })
end, { desc = "Run Rust / Scala" })
