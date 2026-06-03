local M = {}

local function in_frontmatter_tags()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)

  if lines[1] ~= "---" then return false end

  local fm_end
  for i = 2, #lines do
    if lines[i] == "---" then
      fm_end = i
      break
    end
  end
  if not fm_end or row >= fm_end then return false end

  for i = row, 1, -1 do
    if lines[i]:match("^tags:") then return true end
    if i < row and lines[i]:match("^%a") then return false end
  end
  return false
end

M.new = function()
  return setmetatable({}, { __index = M })
end

M.get_completions = function(self, ctx, callback)
  if not in_frontmatter_tags() then
    return callback({ items = {}, is_incomplete_forward = false, is_incomplete_backward = false })
  end

  local ok, obsidian = pcall(require, "obsidian")
  if not ok then
    return callback({ items = {}, is_incomplete_forward = false, is_incomplete_backward = false })
  end

  local client = obsidian.get_client()

  local function make_items(tags)
    local items = {}
    for _, tag in ipairs(tags) do
      table.insert(items, {
        label = tag,
        kind = 12, -- CompletionItemKind.Value
        insertText = tag,
      })
    end
    callback({ items = items, is_incomplete_forward = false, is_incomplete_backward = false })
  end

  -- find_tags_async(term, callback, opts) — empty string matches all tags
  if client.find_tags_async then
    client:find_tags_async("", function(tag_locations)
      local seen = {}
      local tags = {}
      for _, loc in ipairs(tag_locations) do
        if not seen[loc.tag] then
          seen[loc.tag] = true
          table.insert(tags, loc.tag)
        end
      end
      make_items(tags)
    end)
  else
    local vault_path = tostring(client.dir)
    local tags = {}
    vim.fn.jobstart(
      { "rg", "--no-filename", "-o", "--pcre2", "(?<=^  - |^- )\\S+", vault_path },
      {
        stdout_buffered = true,
        on_stdout = function(_, data)
          local seen = {}
          for _, tag in ipairs(data or {}) do
            if tag ~= "" and not seen[tag] then
              seen[tag] = true
              table.insert(tags, tag)
            end
          end
        end,
        on_exit = function()
          make_items(tags)
        end,
      }
    )
  end
end

return M
