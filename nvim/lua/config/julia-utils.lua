-- random local scope
local J={}

-- function that runs a separate process to generate Quarto file via Literate.jl from a currently active julia file
function J.literatejl(table)
  --local fpath=vim.api.nvim_buf_get_name(0)
  --vim.pretty_print(fpath)
  -- get current buffer file path
  local fpath=vim.fn.expand('%:p')
  -- get current buffer file directory
  local outpath=vim.fn.expand('%:p:h')
  -- vim.pretty_print(fpath)
  -- vim.pretty_print(outpath)
  local filetype=vim.bo.filetype
  -- vim.pretty_print(filetype)

  --determine output filetype
  local fmt="html"
  -- if its not empty, use the provided argument
  if (table.args~=nil and table.args~='') then
    fmt=table.args
  end
  -- fmt is not used so far
  print("FILE: " .. fpath .. " TO: " .. fmt)

  -- run only if it's a julia file
  if filetype=="julia" then
    -- for testing:
    --local cmd_literate=string.format([[:terminal echo "julia -e '%s %s'"]], fpath,format)

    -- function to launch Literate in the global environment
    local cmd_literate=string.format([[:terminal julia --startup-file=no -e 'using Literate; Literate.markdown("%s","%s",flavor = Literate.QuartoFlavor(),credit=false)']], fpath,outpath)
    --call the function
    vim.api.nvim_exec(cmd_literate,true)
  else
    print("Command skipped for filetype: " .. filetype)
  end
end

-- register it as a command
-- vim.api.nvim_create_user_command('JLiterate', J.literatejl, {nargs=1}) --if we wanted to have inputs
vim.api.nvim_create_user_command('JLiterate', J.literatejl,{})
-- add key binding
vim.api.nvim_set_keymap('n', '<Leader>jh',':JLiterate<CR>', { noremap = true, silent = true,desc="Runs custom script on Julia files to push to Quarto output via Literate.jl" })
