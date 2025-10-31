-- ~/.config/nvim/lua/config/img_clip.lua

local M = {}

---------------------------------------------------------------
-- Persistent image counter for img-clip.nvim
---------------------------------------------------------------
local json_path = vim.fn.stdpath("data") .. "/img_clip_counts.json"
M.paste_counts = {}

local function load_counts()
  local f = io.open(json_path, "r")
  if not f then return end
  local ok, data = pcall(vim.json.decode, f:read("*a"))
  f:close()
  if ok and type(data) == "table" then
    M.paste_counts = data
  end
end

function M.save_img_counts()
  local ok, encoded = pcall(vim.json.encode, M.paste_counts)
  if not ok then
    vim.notify("img-clip: failed to encode JSON", vim.log.levels.ERROR)
    return
  end
  local f = io.open(json_path, "w")
  if not f then
    vim.notify("img-clip: failed to open count file for writing", vim.log.levels.ERROR)
    return
  end
  f:write(encoded)
  f:close()
end

load_counts()
vim.api.nvim_create_autocmd("VimLeavePre", { callback = M.save_img_counts })

---------------------------------------------------------------
-- img-clip configuration (no prompt)
---------------------------------------------------------------
function M.setup()
  require("img-clip").setup({
    default = {
      prompt_for_file_name = false,
    },

    filetypes = {
      markdown = {
        dir_path = "/home/franz/Documents/blog/src/bilder",
        template = [[![](/src/bilder/$FILE_NAME)
<figcaption>$CURSOR</figcaption>]],
        prompt_for_file_name = false,

        file_name = function()
          local raw_name = vim.fn.expand("%:t:r")
          if raw_name == "" then raw_name = "image" end

          -- remove date suffix if present
          local clean_name = raw_name:gsub("%-%d%d%d%d%-%d%d%-%d%d$", "")

          local key = clean_name
          M.paste_counts[key] = (M.paste_counts[key] or 0) + 1
          M.save_img_counts()

          local count = M.paste_counts[key]
          return string.format("%s_image_%d", clean_name, count)
        end,
      },
    },
  })
end

return M

