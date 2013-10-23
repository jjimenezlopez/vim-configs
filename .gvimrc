" gvim configurations
set lines=70 columns=260

" same color for foreground and background in blank lines
" ro remove ~
highlight NonText guifg=bg
highlight NonText guibg=bg

" hide all scrollbars
set guioptions=m

" hihglits -moz -webkit in CSS files
autocmd ColorScheme * highlight VendorPrefix guifg=#00ffff
autocmd ColorScheme * match VendorPrefix /-\(moz\|webkit\|o\|ms\)-[a-zA-Z-]\+/

