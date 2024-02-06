-- Plugin to automatically save the current document.

return {
	"Pocco81/auto-save.nvim",
	config = function()
		require("auto-save").setup({
			trigger_events = { "FocusLost", "BufLeave" },
		})
	end,
}
