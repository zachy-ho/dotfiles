local autocmds = {}

local should_mkview = function()
  return vim.bo.buftype == '' and
    autocmds.mkview_filetype_blacklist[vim.bo.filetype] == nil and
    vim.fn.exists('$SUDO_USER') == 0 -- Don't create root-owned files.
end

-- http://vim.wikia.com/wiki/Make_views_automatic
local mkview = function()
  if should_mkview() then
    local success, err = pcall(function()
      if vim.fn.haslocaldir() == 1 then
        -- We never want to save an :lcd command, so hack around it...
        vim.cmd('cd -')
        vim.cmd('mkview')
        vim.cmd('lcd -')
      else
        vim.cmd('mkview')
      end
    end)
    if not success then
      if err:find('%f[%w]E32%f[%W]') == nil and -- No file name; could be no buffer (eg. :checkhealth)
        err:find('%f[%w]E186%f[%W]') == nil and -- No previous directory: probably a `git` operation.
        err:find('%f[%w]E190%f[%W]') == nil and -- Could be name or path length exceeding NAME_MAX or PATH_MAX.
        err:find('%f[%w]E5108%f[%W]') == nil then
        error(err)
      end
    end
  end
end

autocmds.buf_leave = function()
  mkview()
end

autocmds.buf_win_enter = function()
  if should_mkview() then
    vim.cmd('silent! loadview')
    vim.cmd('silent! ' .. vim.fn.line('.') .. 'foldopen!')
  end
end

autocmds.buf_write_post = function()
  mkview()
end

autocmds.win_leave = function()
  mkview()
end

