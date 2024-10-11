local telescope = require("telescope")

-- first setup telescope
telescope.setup({})

-- then load the extension
telescope.load_extension("live_grep_args")
