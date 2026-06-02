
local dap, dapui=require('dap'), require('dapui')

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated["dapui_config"] = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited["dapui_config"] = function()
--   dapui.close()
-- end

dapui.setup()

-- require("dapui").float_element(<element ID>, <optional settings>)

vim.keymap.set('n', '<leader>dk', function() dap.continue() end, { desc = "DAP: Continue" })
vim.keymap.set('n', '<leader>dl', function() dap.run_last() end, { desc = "DAP: Run Last" })
vim.keymap.set('n', '<leader>db', function() dap.toggle_breakpoint() end, { desc = "DAP: Toggle Breakpoint" })

vim.keymap.set('n', '<leader>U', function() dapui.toggle() end, { desc = "DAP: Toggle UI" })

dap.adapters.codelldb = {
  type = 'server',
  port = "${port}",
  executable = {
    -- CHANGE THIS to your path!
    command = '/usr/bin/codelldb',
    args = {"--port", "${port}"},

    -- On windows you may have to uncomment this:
    -- detached = false,
  }
}

dap.configurations.cpp = {
  {
    name = 'Launch',
    type = 'codelldb',
    request = 'launch',
    program = '${workspaceFolder}/../build/test/tmp_test_Tests',
    -- program = function()
    --   return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    -- end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
    args = {},

    -- 💀
    -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
    --
    --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
    --
    -- Otherwise you might get the following error:
    --
    --    Error on launch: Failed to attach to the target process
    --
    -- But you should be aware of the implications:
    -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
    -- runInTerminal = false,
  },
}

-- If you want to use this for Rust and C, add something like this:

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
