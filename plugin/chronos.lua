print("Chronos loaded in just in time")

local date_formats = {
  "%Y-%m-%d",
  "%Y/%m/%d",
  "%m-%d-%Y",
  "%m/%d/%Y",
}

local current_format_index = 1
local last_inserted_text = ""

function cycle_date_format()
  local bufnr = vim.api.nvim_get_current_buf()
  local cursor = vim.api.nvim_win_get_cursor(0)
  local format = date_formats[current_format_index]
  local new_text = vim.fn.strftime(format)

  if last_inserted_text ~= "" then
    local start_col = cursor[2] - #last_inserted_text
    vim.api.nvim_buf_set_text(bufnr, cursor[1] - 1, start_col, cursor[1] - 1, cursor[2], {new_text})
  else
    vim.api.nvim_put({new_text}, "c", false, true)
  end

  last_inserted_text = new_text
  current_format_index = current_format_index % #date_formats + 1
end

function reset_feature()
  current_format_index = 1
  last_inserted_text = ""
end

vim.keymap.set("i", "<C-q>", "<Cmd>lua cycle_date_format()<CR>", { noremap = true })
vim.cmd("autocmd InsertCharPre * lua reset_feature()")

