return {
    {
        'stevearc/aerial.nvim',
        opts = {},
        -- Optional dependencies
        -- dependencies = {
        --     "nvim-treesitter/nvim-treesitter",
        --     "nvim-tree/nvim-web-devicons"
        -- },
        config = function()
            local aerial = require("aerial")
            aerial.setup()
        end,
        keys = {
            {"<leader>a", function() require("aerial").toggle() end},
            {"<leader>}", function() require("aerial").next() end},
            {"<leader>{", function() require("aerial").prev() end},
        }
    }
}
