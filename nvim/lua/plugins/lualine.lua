return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- hide the git branch
      opts.sections.lualine_b = {}
      -- LazyVim's pretty_path() is always the 4th static lualine_c entry
      -- (root_dir, diagnostics, filetype, pretty_path); a 5th trouble-symbols
      -- entry may follow, so index from the front, not the back.
      opts.sections.lualine_c[4] = { "filename", path = 1 }
      return opts
    end,
  },
}
