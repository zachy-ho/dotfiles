local sanitize_path = function(path)
	local home_path_prefix = "~/"
	if path:sub(1, #home_path_prefix) == home_path_prefix then
		return os.getenv("HOME") .. string.sub(path, 2)
	end
	return path
end

local check_wiki_path_exists = function(wiki_name)
	local wiki_path = "~/projects/wikis/" .. wiki_name .. "/"
	if vim.fn.isdirectory(sanitize_path(wiki_path)) == 0 then
		print(wiki_path .. " isn't created yet.")
		return false
	end
	local daily_notes_dir = wiki_path .. "daily/"
	if vim.fn.isdirectory(sanitize_path(daily_notes_dir)) == 0 then
		print(daily_notes_dir .. " isn't created yet.")
		return false
	end
	return true
end

local get_daily_dir = function(wiki_name)
	return "~/projects/wikis/" .. wiki_name .. "/" .. "daily/"
end

local create_daily_filename = function(year, month, day, filetype)
	return year .. "-" .. string.format("%02d", month) .. "-" .. string.format("%02d", day) .. "." .. filetype
end

-- Open today's work daily note, create the file for it if it doesn't exist
map("n", "<leader>ww", function()
	local wiki = "canva_wiki"
	if check_wiki_path_exists(wiki) then
		local today = os.date("*t")
		local today_filename = create_daily_filename(today.year, today.month, today.day, "md")
		vim.cmd("edit " .. get_daily_dir(wiki) .. today_filename)
	end
end)

-- Open today's personal daily note, create the file for it if it doesn't exist
map("n", "<leader>wp", function()
	local wiki = "zachyho_wiki"
	if check_wiki_path_exists(wiki) then
		local today = os.date("*t")
		local today_filename = create_daily_filename(today.year, today.month, today.day, "md")
		vim.cmd("edit " .. get_daily_dir(wiki) .. today_filename)
	end
end)
