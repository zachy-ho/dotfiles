local utils = require("zachyho.utils")

map("n", "<leader>fdh", ":diffget //2<CR>")
map("n", "<leader>fdl", ":diffget //3<CR>")
map("n", "<leader>dss", ":Gvdiffsplit<CR>")
map("n", "<leader>dsh", ":Gvdiffsplit HEAD<CR>")
