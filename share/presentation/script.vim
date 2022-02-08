set nolist
set nonumber
set nofoldenable
set nocursorcolumn
set nocursorline
set colorcolumn=0
if exists('+relativenumber')
  set norelativenumber
end
set hidden


noremap <PageUp> :bp<CR>
noremap <Left> :bp<CR>
noremap <PageDown> :bn<CR>
noremap <Right> :bn<CR>
noremap Q :q<CR>

b 1
b 1
