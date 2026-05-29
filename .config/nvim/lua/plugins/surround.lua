return {
  {
    "nvim-mini/mini.surround",
    version = "*",
    opts = {
      custom_surroundings = {
        ["w"] = {
          input = { "%[%[(.-)%]%]" },
          output = { left = "[[", right = "]]" },
        },
      },
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
}
