return { -- Harpoon
  "ThePrimeagen/harpoon",
  keys = {
    {
      "<leader>!hm",
      function()
        require("harpoon.ui").toggle_quick_menu()
      end,
      desc = "Edit marks... (harpoon)",
    },
    {
      "<leader>hc",
      function()
        require("harpoon.mark").clear_all()
      end,
      desc = "Clear all marks (harpoon)",
    },
    {
      "<leader>hM",
      "<cmd>Telescope harpoon marks<cr>",
      desc = "Show marks... (harpoon)",
    },
    {
      "<leader>hm",
      function()
        require("harpoon.mark").add_file()
      end,
      desc = "Mark this file (harpoon)",
    },
    {
      "<leader>hr",
      function()
        local id = require("harpoon.mark").get_current_index()
        if require("harpoon.mark").valid_index(id, nil) then
          require("harpoon.mark").rm_file(id)
        end
      end,
      desc = "Remove mark (harpoon)",
    },
    {
      "<leader>h1",
      function()
        require("harpoon.ui").nav_file(1)
      end,
      desc = "Nav to mark 1 (harpoon)",
    },
    {
      "<leader>h2",
      function()
        require("harpoon.ui").nav_file(2)
      end,
      desc = "Nav to mark 2 (harpoon)",
    },
    {
      "<leader>h3",
      function()
        require("harpoon.ui").nav_file(3)
      end,
      desc = "Nav to mark 3 (harpoon)",
    },
    {
      "<leader>h4",
      function()
        require("harpoon.ui").nav_file(4)
      end,
      desc = "Nav to mark 4 (harpoon)",
    },
    {
      "<leader>h5",
      function()
        require("harpoon.ui").nav_file(5)
      end,
      desc = "Nav to mark 5 (harpoon)",
    },
  },
  config = function()
    require("telescope").load_extension("harpoon")
  end,
}
