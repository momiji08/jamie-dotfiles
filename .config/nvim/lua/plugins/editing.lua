return {
    "rafamadriz/friendly-snippets",
    {
    -- vim surround mnemonics:
    -- ysiw 'you surround inner word' (insert surrounds e.g ysiw" on hello -> "hello")
    -- cs 'change surround' cs"' "hello" -> 'hello'
    -- ds 'delete surround' ds' 'hello' -> hello
    -- yss 'you surround surround' wraps the whole line ( hello ) ->  {( hello )}
    --
    -- For tags, use tag name e.g. <q>. Can use generic 't' for tag when changing/deleting
    --
    -- note: '{' adds a space, '}' does not. (works for all bracer types)
    -- e.g ysiw( on hello -> ( hello ), v.s. ysiw) hello -> (hello)
    "tpope/vim-surround"
    },

    "vim-scripts/ReplaceWithRegister",
    "numToStr/Comment.nvim",
    "onsails/lspkind.nvim",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
}
