return {
  "tpope/vim-projectionist",
  config = function()
    vim.g.projectionist_heuristics = {
      ["*"] = {
        ["app/*.rb"] = {
          alternate = "spec/{}_spec.rb",
        },
        ["spec/*_spec.rb"] = {
          alternate = "app/{}.rb",
        },
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
