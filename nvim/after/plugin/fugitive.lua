local utils = require("zachyho.utils")

map("n", "<leader>dh", ":diffget //2<CR>")
map("n", "<leader>dl", ":diffget //3<CR>")
map("n", "<leader>dss", ":Gvdiffsplit<CR>")
map("n", "<leader>dsh", ":Gvdiffsplit HEAD<CR>")
