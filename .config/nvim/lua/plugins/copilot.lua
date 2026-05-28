return {
  -- GitHub Copilot
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    main = "copilot",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = true,
        debounce = 75,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = {
        enabled = false,
      },
      filetypes = {
        markdown = true,
        help = true,
        gitcommit = true,
      },
    },
    config = function(_, opts)
      require("copilot").setup(opts)
    end,
  },
}
