return {
  -- Colorschemes ----------------------------------------------------------
  -- Only the active theme is eager. Other themes stay installed but lazy.
  -- Colorschemes
  {
    "miladggg/neonwave.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      intensity = "neon",
      background = "dark",
      transparent_background = false,
    },
  },
  {
    "metalelf0/kintsugi-nvim",
    lazy = false,
    priority = 1000,
    opts = {
      variant = "dark",
      transparent = false,
      terminal_colors = true,
      bold_keywords = true,
      italic_comments = false,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.nord_transparent = true
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_cursorline_transparent = false
      vim.g.nord_italic = true
      vim.g.nord_bold = false
    end,
  },
  {
    "jpwol/thorn.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      terminal_colors = true,
    },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
  },

  -- UI -------------------------------------------------------------------
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "auto",
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = {
          "location",
          function()
            return os.date("%H:%M:%S")
          end,
        },
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_z = { "tabs" },
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {},
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      chunk = { enable = true },
      indent = { enable = false },
      line_num = { enable = true },
      blank = { enable = false },
    },
  },
  {
    "lukas-reineke/headlines.nvim",
    ft = { "markdown", "norg", "org" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      markdown = {
        headline_highlights = {
          "Headline1",
          "Headline2",
          "Headline3",
          "Headline4",
          "Headline5",
          "Headline6",
        },
        codeblock_highlight = "CodeBlock",
        dash_highlight = "Dash",
        quote_highlight = "Quote",
      },
    },
  },

  -- Navigation -----------------------------------------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
      { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle file explorer" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Find buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
    },
    opts = {},
  },

  -- Editing --------------------------------------------------------------
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    build = ":TSUpdate",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "lua",
        "markdown",
        "markdown_inline",
        "vim",
        "vimdoc",
      })
    end,
  },

  -- Tooling --------------------------------------------------------------
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "shfmt",
        "shellcheck",
      },
    },
  },

  -- LSP ------------------------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {
          filetypes = { "sh", "bash" },
          settings = {
            bashIde = {
              shellcheckPath = "shellcheck",
              shfmt = {
                path = "shfmt",
              },
            },
          },
        },
      },
    },
  },

  -- Formatting -----------------------------------------------------------
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        sh = { "shfmt" },
        bash = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci", "-sr" },
        },
      },
    },
  },
}
