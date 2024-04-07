" easy wrap toggling
nmap <Leader>w :set wrap!<cr>
nmap <Leader>W :set nowrap<cr>

" close all other windows (in the current tab)
nmap gW :only<cr>

" nerdcommenter
nmap gcc :call nerdcommenter#Comment(0, "toggle")<cr>
vmap gc :call nerdcommenter#Comment(0, "toggle")<cr>

" insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" mapping the jumping between splits. Hold control while using vim nav.
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-H> <C-W>h
nmap <C-L> <C-W>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" select the lines which were just pasted
nnoremap vv `[V`]

" clean up trailing whitespace
map <Leader>c :StripTrailingWhitespaces<cr>

" compress excess whitespace on current line
map <Leader>e :s/\v(\S+)\s+/\1 /<cr>:nohl<cr>

" delete all buffers
map <Leader>d :bufdo bd<cr>

" map spacebar to clear search highlight
nnoremap <Leader><space> :noh<cr>

" buffer resizing mappings (shift + arrow key)
nnoremap <S-Up> <c-w>+
nnoremap <S-Down> <c-w>-
nnoremap <S-Left> <c-w><<c-w><<c-w><
nnoremap <S-Right> <c-w>><c-w>><c-w>>

" reindent the entire file
map <Leader>I gg=G``<cr>

" insert the path of currently edited file into a command
" Command mode: Ctrl-P
cmap <C-S-P> <C-R>=expand("%:p:h") . "/" <cr>

" Tricks
map n nzz
map N Nzz
map <C-o> <C-o>zz
map <C-i> <C-i>zz

" PHP
imap <C-l> ->
imap <C-k> =>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <S-Insert> "+gP
cmap <S-Insert> <C-R>+


" Navigation for tab
nmap gn :tabnew<cr>

noremap <Leader>1 1gt
noremap <Leader>2 2gt
noremap <Leader>3 3gt
noremap <Leader>4 4gt
noremap <Leader>5 5gt
noremap <Leader>6 6gt
noremap <Leader>7 7gt
noremap <Leader>8 8gt
noremap <Leader>9 9gt
noremap <Leader>0 :tablast<cr>
