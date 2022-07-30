local table_utils = {
	get_keys = function(tbl)
		local keys = {}
		for k, _ in pairs(tbl) do
			table.insert(keys, k)
		end
		return keys
	end,
	get_values = function(tbl)
		local values = {}
		for _, v in pairs(tbl) do
			table.insert(values, v)
		end
		return values
	end,
	-- Should only be called with list-like tables
	combine_lists = function(list1, list2)
		local result = {}
		vim.list_extend(result, list1)
		vim.list_extend(result, list2)
		return result
	end,
	has_item = function(list, item)
		for _, v in pairs(list) do
			if v == item then
				return true
			end
		end
		return false
	end,
}

return table_utils
