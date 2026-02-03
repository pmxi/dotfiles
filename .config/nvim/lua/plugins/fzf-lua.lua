return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
        { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
        { "<C-p>", function() require("fzf-lua").git_files() end, desc = "Git files" },
        { "<leader>fs", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
    },
    opts = {
        winopts = {
            fullscreen = true,
            -- border = "none",
            -- preview = {
            --     border = "none",
            -- },
        },
    },
}
