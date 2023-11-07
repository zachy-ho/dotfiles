local map_key = vim.keymap.set
local unmap_key = vim.keymap.del

----- Global functions -----
-- Checks if a file or directory exists in the path
function _G.exists(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

function _G.is_dir(path)
	local huh = exists(path .. "/")
	return huh
end

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

-- Use `check(module)` instead
---@deprecated
function _G.safe_require(module)
	local ok, result = pcall(require, module)
	if not ok then
		vim.notify(string.format("Error requiring: %s", module), vim.log.levels.ERROR)
		return ok
	end
	return result
end

-- Checks if `module` can be required.
-- Reports an error if requiring it would throw an error.
---@param module string
---@return boolean
function _G.check_module(module)
	local ok = pcall(require, module)
	if not ok then
		vim.notify(string.format("Module '%s' cannot be required :(", module), vim.log.levels.ERROR)
	end
	return ok
end

-- TODO: Combine this and safe_require^ and update all usages
function _G.quiet_safe_require(module)
	local ok, result = pcall(require, module)
	if not ok then
		return ok
	end
	return result
end

function _G.P(thing)
	print(vim.inspect(thing))
end

function _G.replaceDashWithUnderscore(s)
	return string.gsub(s, "-", "_")
end

function _G.replaceUnderscoreWithDash(s)
	return string.gsub(s, "_", "-")
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
_G.local_paths = {
	-- Directory of zachyho's custom plugin config files
	PLUGINS_DIR = "zachyho.plugins.",
	WORK_PLUGINS_DIR = "canva.plugins.",
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
	length = function(tbl)
		local count = 0
		for _ in pairs(tbl) do
			count = count + 1
		end
		return count
	end,
}
