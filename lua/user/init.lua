return {
  lsp = {
    -- add custom handler
    config = {
      htmx = function()
        return {
          filetypes = { "html", "templ" },
        }
      end,
      elixirls = function()
        return {
          filetypes = { "ex", "exs", "elixir", "heex" }
        }
      end,
      tailwindcss = function()
        return {
          filetypes = { "templ", "astro", "react", "html", "heex", "svelte", "jsx", "tsx" },
          init_options = { userLanguages = { templ = "html" } },
        }
      end,
      templ = function()
        return {
          filetypes = { "templ" },
        }
      end,
      gopls = function()
        return {
          filetypes = { "go", "gomod", "gowork", "gotmpl" }
        }
      end,
      emmet_ls = function()
        return {
          filetypes = { "html", "css", "javascript", "typescript", "react", "templ", "heex", "svelte" },
        }
      end
    },
  },
  plugins = {
    'kristijanhusak/vim-dadbod-completion',
    "modocache/move.vim",
    'tpope/vim-dadbod',
    "simrat39/rust-tools.nvim",
    {
      'kristijanhusak/vim-dadbod-ui',
      dependencies = {
        { 'tpope/vim-dadbod',                     lazy = true },
        { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
      },
      cmd = {
        'DBUI',
        'DBUIToggle',
        'DBUIAddConnection',
        'DBUIFindBuffer',
      },
      init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
      end,
    },
    {
      "NvChad/nvim-colorizer.lua",
      opts = {
        user_default_options = {
          tailwind = true
        }
      }
    },
    {
      "hrsh7th/nvim-cmp",
      dependencies = {
        { "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
        'kristijanhusak/vim-dadbod-completion'
      },
      opts = function(_, opts)
        local cmp = require("cmp")
        opts.sources = cmp.config.sources(vim.list_extend(
          opts.sources or {},
          { { name = 'vim-dadbod-completion' } }
        ))
        local format_kinds = opts.formatting.format
        opts.formatting.format = function(entry, vim_item)
          format_kinds(entry, vim_item)
          return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
        end
      end
    },
    { "ellisonleao/gruvbox.nvim", priority = 1000, config = true, opts = ... },
    {
      'windwp/nvim-ts-autotag',
      config = function()
        require('nvim-ts-autotag').setup()
      end
    },
    {
      'laytan/tailwind-sorter.nvim',
      dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
      build = 'cd formatter && npm i && npm run build',
      config = {},
    },
    {
      "ggandor/leap.nvim",
      keys = {
        { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
        { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
        { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
      },
      config = function(_, opts)
        local leap = require("leap")
        for k, v in pairs(opts) do
          leap.opts[k] = v
        end
        leap.add_default_mappings(true)
        vim.keymap.del({ "x", "o" }, "x")
        vim.keymap.del({ "x", "o" }, "X")
      end,
    }, -- easily jump to any location and enhanced f/t motions for Leap
    {
      "ggandor/flit.nvim",
      keys = function()
        ---@type LazyKeys[]
        local ret = {}
        for _, key in ipairs({ "f", "F", "t", "T" }) do
          ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
        end
        return ret
      end,
      opts = { labeled_modes = "nx" },
    },
    {
      "zbirenbaum/copilot.lua",
      cmd = "Copilot",
      build = ":Copilot auth",
      opts = {},
      config = function()
        require("copilot").setup({
          suggestion = { enabled = false },
          panel = { enabled = false },
          filetypes = {
            yaml = false,
            markdown = false,
            help = false,
            gitcommit = false,
            gitrebase = false,
            hgcommit = false,
            svn = false,
            cvs = false,
            ["."] = false,
          },
        })
      end
    },
    {
      "zbirenbaum/copilot-cmp",
      event = { "InsertEnter", "LspAttach" },
      fix_pairs = true,
      config = function()
        require("copilot_cmp").setup()
      end
    },
    { -- Harpoon
      "ThePrimeagen/harpoon",
      keys = {
        {
          "<leader>!hm",
          function()
            require("harpoon.ui").toggle_quick_menu()
          end,
          desc = "Edit marks... (harpoon)",
        },
        {
          "<leader>hc",
          function()
            require("harpoon.mark").clear_all()
          end,
          desc = "Clear all marks (harpoon)",
        },
        {
          "<leader>hM",
          "<cmd>Telescope harpoon marks<cr>",
          desc = "Show marks... (harpoon)",
        },
        {
          "<leader>hm",
          function()
            require("harpoon.mark").add_file()
          end,
          desc = "Mark this file (harpoon)",
        },
        {
          "<leader>hr",
          function()
            local id = require("harpoon.mark").get_current_index()
            if require("harpoon.mark").valid_index(id, nil) then
              require("harpoon.mark").rm_file(id)
            end
          end,
          desc = "Remove mark (harpoon)",
        },
        {
          "<leader>h1",
          function()
            require("harpoon.ui").nav_file(1)
          end,
          desc = "Nav to mark 1 (harpoon)",
        },
        {
          "<leader>h2",
          function()
            require("harpoon.ui").nav_file(2)
          end,
          desc = "Nav to mark 2 (harpoon)",
        },
        {
          "<leader>h3",
          function()
            require("harpoon.ui").nav_file(3)
          end,
          desc = "Nav to mark 3 (harpoon)",
        },
        {
          "<leader>h4",
          function()
            require("harpoon.ui").nav_file(4)
          end,
          desc = "Nav to mark 4 (harpoon)",
        },
        {
          "<leader>h5",
          function()
            require("harpoon.ui").nav_file(5)
          end,
          desc = "Nav to mark 5 (harpoon)",
        },
      },
      config = function()
        require("telescope").load_extension("harpoon")
      end,
    },
    {
      "ray-x/go.nvim",
      dependencies = { -- optional packages
        "ray-x/guihua.lua",
        "neovim/nvim-lspconfig",
        "nvim-treesitter/nvim-treesitter",
      },
      settings = {
        gopls = {
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
      config = function()
        require("go").setup()
      end,
      event = { "CmdlineEnter" },
      ft = { "go", "gomod" },
      build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      keys = {
        {
          "<leader>sB",
          ":Telescope file_browser path=%:p:h=%:p:h<cr>",
          desc = "Browse Files",
        },
      },
      config = function()
        require("telescope").load_extension("file_browser")
      end,
    },
    {
      "saecki/crates.nvim",
      ft = { "rust", "toml" },
      config = function(_, opts)
        local crates = require("crates")
        crates.setup(opts)
        crates.show()
      end
    }
  },
}
