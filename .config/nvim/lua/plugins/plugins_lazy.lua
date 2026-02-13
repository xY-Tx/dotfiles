return {
  -- colorscheme
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
    config = function()
      require("tokyonight").setup({
        style = "storm", -- storm, moon, night, day
        transparent = true, -- 透過を有効化
        terminal_colors = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          sidebars = "transparent", -- サイドバーも透過
          floats = "transparent", -- フロートウィンドウも透過
        },
      })
    end,
  },

  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,

    config = function()
      -- カラースキームを読み込む前に設定を適用
      vim.g.nord_transparent = true
      vim.g.nord_contrast = true
      vim.g.nord_borders = false
      vim.g.nord_disable_background = false
      vim.g.nord_cursorline_transparent = false
      vim.g.nord_italic = true
      -- vim.g.nord_uniform_diff_background = true
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
    config = function()
      require("kanagawa").setup({
        transparent = false, -- 透過を有効化
        terminal_colors = true,
        -- theme = "wave", -- wave, dragon, lotus
        -- background = {
        --   dark = "wave",
        --   light = "lotus",
        -- },
      })
    end,
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
  },
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          -- theme = "auto",
          theme = "dracula",
          -- theme = "nord",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = {
            "location",
            {
              function()
                return os.date("%H:%M:%S")
              end,
            },
          },
        }, -- ⭐ sectionsはここで閉じる
        tabline = { -- ⭐ tablineはsectionsの外
          lualine_a = { "buffers" },
          lualine_z = { "tabs" },
        },
      })
    end,
  },

  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  --   opts = {},
  --   event = "VeryLazy",
  -- },
  {
    "tribela/transparent.nvim",
    event = "VimEnter",
    config = true,
  },

  -- headline
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("headlines").setup({
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
      })
    end,
  },
  -- bufferlin -- {
  --   "akinsho/bufferline.nvim",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --     "shaunsingh/nord.nvim",
  --   },
  --   config = function()
  --     local highlights = require("nord").bufferline.highlights({
  --       italic = true,
  --       bold = true,
  --     })
  --
  --     require("bufferline").setup({
  --       options = {
  --         separator_style = "thick",
  --       },
  --       highlights = highlights,
  --     })
  --   end,
  -- },
  -- hlchunk
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = { enable = true },
        indent = { enable = false },
        line_num = { enable = true },
        blank = { enable = false },
      })
    end,
  },
  -- nvim-treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile", "InsertEnter" },
    build = ":TSUpdate",
  },
  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notifiation view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },
  --neo-tree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<Leader>ff", builtin.find_files, { desc = "Find Files" })
      vim.keymap.set("n", "<Leader>fg", builtin.live_grep, { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    end,
  },
  -- markview
  -- {
  --   "OXY2DEV/markview.nvim",
  --   ft = "markdown",
  --   dependencies = { "saghen/blink.cmp" },
  --   keys = {
  --     {
  --       "<leader>mt",
  --       "<cmd>Markview toggle<CR>",
  --       desc = "Toggle Markview preview",
  --     },
  --   },
  -- },
  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  -- mason
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    config = true,
  },

  {
    "mason-org/mason-lspconfig.nvim",
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
  -- ====================
  -- LSP (bash)
  -- ====================
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

  -- ====================
  -- Formatter (shfmt)
  -- ====================
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sh = { "shfmt" },
      },
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci", "-sr" },
        },
      },
    },
  },
}
