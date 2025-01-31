return {
  "tpope/vim-projectionist",
  config = function()
    vim.g.projectionist_heuristics = {
      ["*"] = {
        ["src/*.ts"] = {
          alternate = { "src/{}.test.ts", "src/{}.test.tsx" },
        },
        ["src/*.tsx"] = {
          alternate = { "src/{}.test.tsx", "src/{}.test.ts" },
        },
        ["src/*.test.ts"] = {
          alternate = { "src/{}.ts", "src/{}.tsx" },
        },
        ["src/*.test.tsx"] = {
          alternate = { "src/{}.tsx", "src/{}.ts" },
        },
      },
    }
  end,
}
