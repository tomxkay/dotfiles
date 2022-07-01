require('session-lens').setup {
    path_display={'shorten'},
}

require("telescope").load_extension("session-lens")
