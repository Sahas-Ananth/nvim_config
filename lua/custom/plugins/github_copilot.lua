-- GitHub Copilot Plugin.
-- This is the official plugin for GitHub Copilot.
-- return {
-- "github/copilot.vim",
-- }

-- When time permits, try and work with the unofficial plugin for GitHub Copilot which integrates well will nvim-cmp.
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
        filetypes = {yaml = true, markdown = true, gitcommit = true, gitrebase = true},
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end
  }
}
