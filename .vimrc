" Vim seulement
set nocompatible

" Arrière plan noir
set background=dark

" Coloration syntaxique
syn on

" Numérotation de ligne
set number
highlight LineNr ctermbg=darkgray ctermfg=lightblue

" Auto-indentation
set autoindent

" Lignes et colonnes affichées en bas
set ruler
" Affiche le mode en bas
set showmode
" Affiche la commande en cours
set showcmd

" Changement des touches de navigations dans les onglets
map <C-LEFT>  <Esc>:tabprevious<CR>
map <C-RIGHT> <Esc>:tabnext<CR>
map <S-C-LEFT>  <Esc>:call MoveTab('left')<CR>
map <S-C-RIGHT> <Esc>:call MoveTab('right')<CR>
map <A-LEFT> <C-w><LEFT>
map <A-RIGHT> <C-w><RIGHT>
map <A-UP> <C-w><UP>
map <A-DOWN> <C-w><DOWN>
map <A-S-LEFT> <C-w><
map <A-S-RIGHT> <C-w>>
map <A-S-UP> <C-w>-
map <A-S-DOWN> <C-w>+
" map <A-S-PAGEUP> <C-w>_
" map <A-S-PAGEDOWN> <C-w>|

" Déplacement de l'onglet courant vers la gauche ou vers la droite
function! MoveTab(direction)
  if (a:direction == 'left')
    let tabNum = tabpagenr()-2
    if (tabNum < 0)
      let tabNum = 0
    endif
    execute 'tabm ' . tabNum
  else
    let tabNum = tabpagenr()
    execute 'tabm ' . tabNum
  endif
endfunction


" Ajout d'une ligne colorée pour surligner la ligne en cours
set cursorline
" set cursorcolumn
highlight CursorLine cterm=none ctermbg=darkgrey
" highlight CursorLine term=reverse cterm=reverse
highlight CursorColum cterm=none ctermbg=DarkRed

" Amélioration de la lisibilité des noms des onglets
highlight TabLine term=none cterm=none
highlight TabLineSel ctermbg=darkblue

" Surligne la recherche en cours
set hlsearch
" Recherche incrémentielle (highlight search as you type)
set incsearch
" On doit pouvoir la desactiver de facon ponctuelle avec <F8>
nnoremap <F8> :nohls <CR>

" Affichage des registres
nnoremap <F10> :reg <CR>

" Fichier d'aide
" helptags ~/.vim/doc
