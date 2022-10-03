local map_key = vim.api.nvim_set_keymap
local unmap_key = vim.api.nvim_del_keymap

----- Global functions -----

-- Create a new keymap mapping `lhs` to `rhs`, under the specified `modes` and `opts`.
-- `opts` by default would be {}
function _G.map(modes, lhs, rhs, opts)
	opts = opts or {}
	opts.noremap = opts.noremap == nil and true or opts.noremap
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		map_key(mode, lhs, rhs, opts)
	end
end

-- Unmap existing `lhs` keymap for specified `modes`
function _G.unmap(modes, lhs)
	if type(modes) == "string" then
		modes = { modes }
	end
	for _, mode in ipairs(modes) do
		unmap_key(mode, lhs)
	end
end

-- A protected function to require `module`.
-- Returns `false` if failed to require `module`. Returns the return result of `require(module)`
-- otherwise.
-- Uses `pcall` under the hood
function _G.safe_require(module)
	local ok, result = pcall(require, module)
	if not ok then
		vim.notify(string.format("Error requiring: %s", module), vim.log.levels.ERROR)
		return ok
	end
	return result
end

----- Preconditions -----
_G.preconditions = {
	-- Assert item exists (i.e. not `nil`)
	check_exists = function(item)
		if item == nil then
			vim.notify(string.format("Check exists: %s is nil", item), vim.log.levels.ERROR)
			error(string.format("Check exists: %s is nil", item), vim.log.levels.ERROR)
		end
		return item
	end,
}

----- Constants -----
_G.constants = {
	-- Directory of zachyho's custom plugin config files
	PLUGINS_DIR = "zachyho.plugins.",
    WORK_PLUGINS_DIR = "canva.plugins."
}

----- Table helpers -----
_G.table_utils = {
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
