---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },
    ["<C-b>"] = {
      "<cmd>cclose<CR>",
      "Close quickfix",
    },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

-- more keybinds!
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dus"] = {
      function()
        local widgets = require "dap.ui.widgets"
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.open()
      end,
      "Open debugging sidebar",
    },
    ["<leader>dp"] = {
      function()
        require("dap.ui.widgets").preview()
      end,
      "Open preview",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "Debug go test",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "Debug last go test",
    },
    ["<F5>"] = {
      function()
        require("dap").continue()
      end,
      "Debug continue",
    },
    ["<F6>"] = {
      function()
        require("dap").step_over()
      end,
      "Debug step over",
    },
    ["<F7>"] = {
      function()
        require("dap").step_into()
      end,
      "Debug step into",
    },
    ["<F8>"] = {
      function()
        require("dap").step_out()
      end,
      "Debug step out",
    },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = {
      "<cmd> GoTagAdd json <CR>",
      "Add json struct tags",
    },
    ["<leader>gsy"] = {
      "<cmd> GoTagAdd yaml <CR>",
      "Add yaml struct tags",
    },
  },
}

M.copilot = {
  i = {
    ["<C-l>"] = {
      function()
        vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
      end,
      "Copilot Accept",
      { replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
    },
  },
}

M.lazygit = {
  n = {
    ["<leader>gg"] = {
      "<cmd> LazyGit <CR>",
    },
  },
}

return M
