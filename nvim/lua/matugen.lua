local M = {}

function M.setup()
  require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#161310", -- Default Background
    base01 = "#231f1c", -- Lighter Background (status bars)
    base02 = "#2e2926", -- Selection Background
    base03 = "#9d8e84", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#d4c3b9", -- Dark Foreground (status bars)
    base05 = "#eae1dc", -- Default Foreground
    base06 = "#eae1dc", -- Light Foreground
    base07 = "#eae1dc", -- Lightest Foreground
    -- Accent colors
    base08 = "#ffb4ab", -- Variables, XML Tags, Errors
    base09 = "#c7ca96", -- Integers, Constants
    base0A = "#dcc1af", -- Classes, Search Background
    base0B = "#efbc96", -- Strings, Diff Inserted
    base0C = "#c7ca96", -- Regex, Escape Chars
    base0D = "#efbc96", -- Functions, Methods
    base0E = "#dcc1af", -- Keywords, Storage
    base0F = "#93000a", -- Deprecated, Embedded Tags
  })
end

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
  "sigusr1",
  vim.schedule_wrap(function()
    package.loaded["matugen"] = nil
    require("matugen").setup()
  end)
)

return M
