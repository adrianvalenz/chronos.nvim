# chronos.nvim


⌛️ Cycle through date formats with ease ⏳


## Features

- 3 different date formats (more to come)
- Cycles through current date formats in place (looking to implement time)
- Continue typing when you settle on a date

## Installation

With Packer:
```
use {
    'adrianvalenz/chronos.nvim',
}
```

With Vim Plug:
```
Plug 'adrianvalenz/chronos.nvim'
```

With Lazy.vim:
```
-- init.lua:
{
    'adrianvalenz/chronos.nvim',
}

-- plugins/chronos.lua:
return {
    'adrianvalenz/chronos.nvim',
}
```

## How to use

Just hit `<C-q>` repeatedly until you come across a date you like.

## Configuration

No real configuration. Right now the function just a keymap that calls the function.
Can be overridden pretty easily.

Place something like this in your `keymaps.lua` or where ever you keep your mappings:

```
# To override just pass in the keymap of your choice. Like if it is: <C-t>
vim.keymap.set("i", "<C-t>", "<Cmd>lua cycle_date_format()<CR>", { noremap = true })
```

## Why this plugin?

I use BridgetownRB for most of my sites and when it comes time to create 
a new article I create each file prefixed
with the Extended Date Format (`YYYY-MM-DD`) followed 
by the name of the article and the extension. (`YYYY-MM-DD-slug-goes-here.EXT`)

I found it cumbersome to type out the date manually whenever I needed to create a new article or input a date. I hate to say
even though markdown files is my favorite way to blog due to using Neovim, having to type out the date this way or even look up the
current day on my calendar was a bit of a deterrent and broke my workflow. 

They say developers are lazy so they automate things right? Well this is the solution to my own 
problem and I hope it helps others as well. I found it really nice to use when creating changelogs too!

