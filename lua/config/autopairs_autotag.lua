-- lua/config/autopairs_autotag.lua
require("nvim-autopairs").setup({})
-- autotag через прямой setup (новый API)
require("nvim-ts-autotag").setup({
  filetypes = {
    "html", "xml", "xsl",
    "javascriptreact", "typescriptreact", "jsx", "tsx",
    "vue", "svelte", "rescript",
    "heex","eex","erb","astro","glimmer","handlebars","hbs",
  },
})

