
-- from: https://thevaluable.dev/vim-create-text-objects/
local function basic_text_objects(chars)
    for _,char in ipairs(chars) do
        for _,mode in ipairs({ 'x', 'o' }) do
            vim.api.nvim_set_keymap(mode, "i" .. char, string.format(':<C-u>silent! normal! f%sF%slvt%s<CR>', char, char, char), { noremap = true, silent = true })
            vim.api.nvim_set_keymap(mode, "a" .. char, string.format(':<C-u>silent! normal! f%sF%svf%s<CR>', char, char, char), { noremap = true, silent = true })
        end
    end
end

local chars = { '_', '.', ':', ',', ';', '|', '/', '\\', '*', '+', '%', '`', '?', '$' }
basic_text_objects(chars)
