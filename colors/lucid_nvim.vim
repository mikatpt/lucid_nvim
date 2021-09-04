set background=dark

" Vim color name
let g:colors_name = "lucid_nvim"

" Reset package to make sure it loads.
lua package.loaded['lucid'] = nil

" Apply colorscheme
lua require('lush')(require('lucid'))
