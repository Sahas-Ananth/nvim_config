-- Plugin which inserts print statements for debugging purposes.
return {
  "andrewferrier/debugprint.nvim",
  opts = { ... },
  -- Dependency only needed for NeoVim 0.8
  dependencies = {
    "nvim-treesitter/nvim-treesitter"
  },
  -- Remove the following line to use development versions,
  -- not just the formal releases
  version = "*",
}
