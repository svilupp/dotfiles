require("nvim-treesitter.configs").setup {
  ensure_installed = {"python", "cpp", "lua", "vim","julia"},
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { 'help' }, -- list of language that will be disabled
  },

  --JS: added keymaps and Julia
  matchup = {
    enable = false,              -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },

    textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        -- ["ac"] = "@class.outer",
        ["ac"] = "@class.outer",
        ["al"] = "@loop.outer",
        ["ak"] = "@block.outer",
      },
    },
    -- move = {
    --   enable = true,
    --   set_jumps = true, -- whether to set jumps in the jumplist
    --   goto_next_start = {
    --     ["]m"] = "@class.outer",
    --     ["]]"] = "@function.outer",
    --   },
    --   goto_next_end = {
    --     ["]M"] = "@class.outer",
    --     ["]["] = "@function.outer",
    --   },
    --   goto_previous_start = {
    --     ["[m"] = "@class.outer",
    --     ["[["] = "@function.outer",
    --   },
    --   goto_previous_end = {
    --     ["[M"] = "@class.outer",
    --     ["[]"] = "@function.outer",
    --   },
    -- },
  }

}

