" Jan Zwiener's vimrc
" ===================
" jan@zwiener.org
"
" =============================================================================
" Information
" =============================================================================
"
" vimrc sections:
"  - Pathogen                   First section to enable plug-ins in bundle/
"  - Neovim                     Neovim specific settings
"  - Settings                   General settings
"  - Keymaps                    Key bindings
"  - ctags                      ctags specific settings
"  - Visual settings            Change the look and feel
"  - Plugin settings            Settings for different plug-ins
"  - File specific settings     Settings for file types (e.g. for .tex files)
"
" Tag based code navigation
" -------------------------
"
" F4 to generate tags in current directory (should be in source root)
" F3/F12/<leader>t to goto tag under cursor
" Ctrl-o / Ctrl-i navigate backward/forward
" K to preview function, <leader>k to close preview
" Tab to complete
"
" Special <leader> commands:
" --------------------------
" <leader>p              :CtrlP
" <leader>m              :CtrlPMRUFiles
" <leader>e              :BufExplorer
" <leader>f              :NERDTree
" <leader>l              :TagbarToggle (use 'zo' and 'zc' to open and close folds)
" <leader>n              :Make
" <leader>w              Remove trailing whitespaces
" <leader>g              :grep
" <leader>s              :grep for *.h, *.c, *.cpp files
" <leader>b              :vimgrep
" <leader>h              :CtrlPTag
" <leader>j              :CtrlPBufTag
" <leader>v              Sync Tex
" <C-x><C-t>             Tag complete in insert mode
" <leader>cc             Comment out the current line or text selected in visual mode
"
" Use :tag, :ts, :tn, :tp for navigation.
" Use :CtrlPTag and CtrlPBufTag for fuzzy search.
"
" Limitations of the terminal:
"
" If <C-s> is freezing your terminal, press <C-q> to unfreeze it.
" Add a new line with 'stty -ixon' to your .bashrc
" <S-Space> won't work.
" <C-BS> won't work.
"
" =============================================================================
"
" Pathogen
" --------
" Example to disable specific plugins (here syntastic):
" let g:pathogen_disabled = []
" call add(g:pathogen_disabled, 'syntastic')

" Pathogen init. Load all plugins from bundle/ directory:
execute pathogen#infect()

syntax on
filetype plugin indent on

"
" =============================================================================
"
" Neovim
" ------
if has('nvim')
    " unused atm
endif
"
" =============================================================================
"
" Settings
" --------
"
" Essential stuff
"
" Leave input mode with jj - much faster than reaching for the esc key and only
" very rarely a hurdle:
inoremap jj <Esc>
" Set <leader> to ,
let mapleader = ','
let g:mapleader = ','
" Easy half-page scrolling with <space>:
nnoremap <Space> <C-d>
nnoremap <S-Space> <C-u>  " won't work in most terminals
" Support this in visual-mode:
vnoremap <Space> <C-d>
vnoremap <S-Space> <C-u>  " won't work in most terminals
" Remove search highlighting with <enter>:
nnoremap <CR> :noh<CR>
"
" Mouse settings:
set mousemodel=popup           " right mouse button pops up a menu
set selectmode=mouse,key       " select text with the mouse or with Shift+cursor keys
set keymodel=startsel,stopsel  " shift starts the sel-mode, any other key stops it
set mouse=a                    " enable the mouse
set guioptions-=aA             " Vim won't become the owner of the windowing system's global selection:
set backspace=indent,eol,start " backspace wrap to previous/next line
set whichwrap+=<,>,[,]         " cursor left/right to move to the previous/next line
" Clipboard settings, unnamedplus is useful for X-Windows
if has('unnamedplus')
    set clipboard^=unnamedplus
else
    set clipboard^=unnamed
endif
" Complete options (disable preview window):
set completeopt=menu,menuone,longest
" Limit the number of items to 15 in the completion popup menu:
set pumheight=15
" Select empty areas with visual block mode:
set virtualedit=block
set linebreak        " If on Vim will wrap long lines at a character in 'breakat' rather than at the last character that fits on the screen.
set ignorecase       " If the 'ignorecase' option is on, the case of normal letters is ignored.
set smartcase        " Case insensitive searches become sensitive with capitals
set hidden           " Edit multiple buffers without saving the modifications made to a buffer
set autoindent       " Copy indent from current line when starting a new line
set tabstop=4        " Number of spaces that a <Tab> in the file counts for. This is not 8, this is 4.
set shiftwidth=4     " Number of spaces to use for each step of (auto)indent. when zero the 'ts' value will be used.
set shiftround       " Round indent to multiple of 'shiftwidth'.  Applies to > and < commands.
set scrolloff=5      " Minimal number of screen lines to keep above and below the cursor.
set sidescrolloff=10 " The minimal number of screen columns to keep to the left and to the right of the cursor
set ffs=unix,dos     " This gives the end-of-line (<EOL>) formats that will be tried when starting to edit a new buffer and when reading a file into an existing buffer
set smarttab         " When on, a <Tab> in front of a line inserts blanks according to 'shiftwidth'.  'ts' or 'sts' else.  A <BS> will delete a 'shiftwidth' worth of space at the start of the line.
set number           " Precede each line with its line number
set showbreak=>      " String to put at the start of lines that have been wrapped.
set showmode         " If in Insert, Replace or Visual mode put a message on the last line.
set autoread         " If the file has changed outside, but was not modified in vim: reload
set autowrite        " Automatically save before commands like :next and :make
set hlsearch         " When there is a previous search pattern, highlight all its matches.
set incsearch        " While typing a search command, show where the pattern, as it was typed so far, matches.
set wildmenu         " When 'wildmenu' is on, command-line completion operates in an enhanced mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
set wildchar=<Tab>   " Character you have to type to start wildcard expansion in the command-line, as specified with 'wildmode'.
set wildmode=longest,full " Completion mode: complete longest common string, then each full match
set gdefault         " Make g the default: :%s/foo/bar/ instead of :%s/foo/bar/g
set ttyfast          " Indicates a fast terminal connection.  More characters will be sent to the screen for redrawing,
set expandtab        " In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
set history=200      " The command-lines that you enter are remembered in a history table
set undolevels=1000  " Maximum number of changes that can be undone.
set showmatch        " When a bracket is inserted, briefly jump to the matching one.
set matchtime=2      " Tenths of a second to show the matching paren (default: 500 ms)
if v:version >= 704 || (v:version >= 703 && has('patch72'))
    set wildignorecase " When set case is ignored when completing file names and directories.
endif
set lazyredraw       " The screen will not be redrawn while executing macros,
set showcmd          " Show partial command in last line of the screen (Set this option off if your terminal is slow.)
set showtabline=2    " Always display tabs
set formatoptions+=n " When formatting text, recognize numbered lists.
if v:version >= 704 || (v:version >= 703 && has('patch541'))
    set formatoptions+=j " Where it makes sense, remove a comment leader when joining lines.
endif
set wildignore+=*.o,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.swp,*.bak,*.pyc,*.class,.git,*.asv
set wildignore+=*.aux,*.out,*.toc " latex
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg " images
set wildignore+=*.DS_Store " OSX stuff

" cindent options:
"
" help: :h cinoptions-values
" Align cindent function arguments with 'cino'
" void my_func(int arg1,  >   void my_func(int arg1,
"       int arg2,         >                int arg2,
"       int arg3);        >                int arg3);
set cino+=(0
" Align C++ scope declarations (public, private, protected):
"                   g0:
" ---------------------------
" {             >   {
"     public:   >   public:
"     a = b;    >       a = b;
"     private:  >   private:
" }             >   }
set cino+=g0
" Adjust (0 for long lines with W4:
" a_long_line(		        >  a_long_line(
"             argument,		>     argument,
"             argument);	>     argument);
" a_short_line(argument,    >  a_short_line(argument,
"              argument);	>  	            argument);
set cino+=W4

" Press F2 to open the vimrc config:
if has('unix')
    " unix-like platform
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*
    " edit vimrc on unixoidal systems
    nnoremap <silent> <F2> :tabedit ~/.vim/vimrc<cr>
else
    " probably Windows
    set wildignore+=.git\*,.hg\*,.svn\*
    " edit vimrc on windows
    nnoremap <silent> <F2> :tabedit ~\vimfiles\vimrc<cr>
endif

set nowrap          " When on, lines longer than the width of the window will wrap and displaying continues on the next line.
set textwidth=0     " Maximum width of text that is being inserted.  A longer line will be broken after white space to get this width.
set spelllang=en,de " When the 'spell' option is on spellchecking will be done for these languages.
" UTF-8 settings
if has('multi_byte')
  set termencoding=utf-8       " Encoding used for the terminal. For the Win32 GUI 'termencoding' is not used for typed characters.
  set encoding=utf-8           " Sets the character encoding used inside Vim.
  setglobal fileencoding=utf-8 " Sets the character encoding for files
  set nobomb                   " No BOM (Byte Order Mark) is prepended to the file
endif

" The following snippet (function change_dir_once and au BufRead * call
" s:change_dir_once()) is used to change to working directory to the
" first file opened in a vim session. because this is normally where i expect
" my working directory. subsequent files won't change the path.
function! s:change_dir_once() abort
    if !exists('s:change_dir_once_latch')
        cd %:p:h
        let s:change_dir_once_latch = 1
    endif
endfunction
augroup ChangeDirOnceGroup
    autocmd!
    autocmd BufRead * call s:change_dir_once()
augroup END

" Backup, swapfile, undo stuff
" Turn off backup (good idea?)
set nobackup
set nowb
set noswapfile
set viminfo=

" Encryption
if has('nvim')
    " no encryption
else
    if v:version >= 703
        set cm=blowfish
    endif
    if v:version == 704 && has('patch399')
        set cm=blowfish2
    endif
    if v:version >= 800
        set cm=blowfish2
    endif
endif

"
" =============================================================================
"
" Keymaps
" -------
"
" Use Y to copy until the end of the line. Use yy to copy the whole line:
nnoremap Y y$
" Ctrl-Backspace to delete the last word (for gVim, terminals can't do <C-BS>):
inoremap <C-BS> <C-W>
" Paste text into command line with <C-v>
cnoremap <C-V> <C-R>+
" Change to current file's path:
noremap <leader>cd :cd %:p:h<CR>:pwd<CR>
" :Make shortcut (run make with <leader>n):
noremap <leader>n :Make<CR>
" Don't use Ex mode:
noremap Q <nop>
" Add a "d" shortcut for inside/around square brackets,
" like b for parens and B for curly braces:
onoremap id i[
onoremap ad a[
vnoremap id i[
vnoremap ad a[
" Toggles the 'paste' option:
set pastetoggle=<F8>
" Sane navigation between wrapped lines:
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
" Remap cursorkeys (good training for hjkl keys)
" Left/Right: navigate tabs
" Up/Down: navigate quick-fix window
nnoremap <down>    :cnext<CR>
nnoremap <up>      :cprev<CR>
nnoremap <right>   :tabnext<CR>
nnoremap <left>    :tabprevious<CR>
nnoremap <A-down>  :cnext<CR>
nnoremap <A-up>    :cprev<CR>
nnoremap <A-right> :tabnext<CR>
nnoremap <A-left>  :tabprevious<CR>
" Simple navigation between windows:
noremap <C-j> <C-W><C-J>
noremap <C-k> <C-W><C-K>
noremap <C-l> <C-W><C-L>
noremap <C-h> <C-W><C-H>
" Use Q for formatting the current visual selection:
vnoremap Q gq
" Strips the trailing whitespace from a file:
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z
" Open vimgrep and put the cursor in the right position to type.
" noautocmd is important, otherwise autocommands (e.g. from plugins) are
" executed for each opened file.
nnoremap <leader>b :noautocmd vimgrep // **/*.*<left><left><left><left><left><left><left><left>
" Plattform specific grep search / findstr stuff.
" If in doubt, use vimgrep (<leader>b), but grep and findstr are faster.
if has('win32') && !executable('grep')
    " Prepare the grep options (for :vimgrep and :grep, not for the AsyncRun stuff below)
    set grepprg=findstr\ /spin

    " Use findstr.exe on Windows (or use GNU win32 grep:
    " http://gnuwin32.sourceforge.net/packages/grep.htm)
    " /S = include sub-directories
    " /P = ignore files with non-printable characters
    " /I = case-insensitive
    " /N = print line number
    "
    " Prepare a grep/findstr search command
    nnoremap <Leader>g :AsyncRun findstr /spin /c:"" *.*<left><left><left><left><left>

    " Map a special grep for C/C++
    nnoremap <Leader>s :AsyncRun findstr /spin /c:"" *.cpp *.c *.h<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
else
    " prepare the grep options (for :vimgrep and :grep, not for the AsyncRun stuff below)
    set grepprg=grep\ -nHir\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags

    " grep parameters:
    " n = print line number
    " H = print file name
    " i = ignore case
    " r = include sub-directories

    " Prepare a grep search command
    nnoremap <Leader>g :AsyncRun grep -nHir --exclude-dir=".git" --exclude=tags --include=*.* "" .<left><left><left>

    " Map a special grep for C/C++
    nnoremap <Leader>s :AsyncRun grep -nHir --exclude-dir=".git" --exclude=tags --include=*.cpp --include=*.h --include=*.c "" .<left><left><left>
endif
"
" =============================================================================
"
" ctags
" -----
"
" Search for tags file path:
set tags=./tags,tags,./../tags,./../../tags
" Shortcut to generate tags file on F4
nnoremap <F4> :AsyncRun ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" F3 goto tag (Eclipse like), use <C-o> to jump back
noremap <F3> <C-]>
" F12 goto tag (Visual Studio like), use <C-o> to jump back
noremap <F12> <C-]>
" use :tn and :tp (tag next, tag previous) to navigate between matches
noremap <leader>t <C-]>
" map manual key to tag preview
nnoremap K <C-w>}
" close the preview buffer
nnoremap <leader>k :pc<CR>
" tag complete in insert mode is <C-X><C-]>
" <c-x><c-]> is hard to type on a german keyboard. use t instead of ]
inoremap <C-x><C-t> <C-X><C-]>
"
"
" =============================================================================
"
" Visual settings
" ---------------

" Empty fillchar (looks nicer for split windows)
set fillchars=
set synmaxcol=256 " maximum line length for syntax coloring
set noerrorbells  " don't ring the bell (beep or screen flash) for error messages.
set novisualbell  " disable visual bell
set t_vb=         " disable visual bell
set nofoldenable  " When off, all folds are open.
" set cursorline  " this is slooooooooow, don't use it

if has('gui_running')
    " GUI settings:
    colorscheme blueshift

    " Set font
    if has('gui_macvim')
        set guifont=Monaco:h13
        " special MacVim option:
        " grow to maximum horizontal width on entering fullscreen mode
        set fuopt+=maxhorz
    elseif has('gui_gtk3')
        " for linux
        set guifont=DejaVu\ Sans\ Mono\ 11
    else
        " Consolas Font for Windows
        " http://www.microsoft.com/downloads/en/details.aspx?familyid=22e69ae4-7e40-4807-8a86-b3d36fab68d3&displaylang=en
        " set guifont=Consolas:h11
        set guifont=Consolas:h11
    endif

    set guioptions-=T " hide icons
    " Hide scrollbars:
    set guioptions+=r " Right-hand scrollbar is always present.
    set guioptions-=R " Right-hand scrollbar is present when there is a vertically split window.
    set guioptions+=l " Left-hand scrollbar is always present.
    set guioptions-=L " Left-hand scrollbar is present when there is a vertically split window.

    " For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
    let &guioptions = substitute(&guioptions, 't', '', 'g')

    set ballooneval " This feature allows a debugger, or other external tool, to display dynamic information based on where the mouse is pointing.
else
    " Console settings:
    set background=dark
    set t_Co=256         " not the right way to do it, but it helps e.g. in Git Bash
    colorscheme gruvbox
endif

" Detect whitespaces and tabs at the end of a line with red highlighting
" <whitespace detection>
augroup ExtraWhitespaceHighlightGroup
    autocmd!
    highlight ExtraWhitespace ctermbg=red guibg=red
    match ExtraWhitespace /\s\+$/
    autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
    autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd InsertLeave * match ExtraWhitespace /\s\+$/
    autocmd BufWinLeave * call clearmatches()
augroup END
" </whitespace detection>

" Status line
" More information in status line:
" %F Full path, %m modified flag [+], %r readonly flag [RO], %h help flag [help],
" %w Preview window flag [Preview]
" Based on default status line, but adds the file format, the file encoding,
" and the file type.
set statusline=%<%F\ %h%m%r%=type=%Y\ [%{&ff}]\ [%{&fenc}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2     " Always display a statusline

"
" =============================================================================
"
" Plugin settings
" ---------------

" Matchit:
" match paren is slow (e. g. in large latex code):
" let loaded_matchparen = 1
" set noshowmatch
runtime macros/matchit.vim

" Ctrlp:
nnoremap <silent> <Leader>p :CtrlP<CR>
nnoremap <silent> <Leader>m :CtrlPMRUFiles<CR>
" 'tag'       - :CtrlPTag    - Search for a tag within a generated central tags file.
" 'buffertag' - :CtrlPBufTag - Search for a tag within the current buffer.
let g:ctrlp_extensions          = [ 'tag', 'buffertag' ]
let g:ctrlp_max_depth           = 12     " Directory depth to recurse into when scanning.
" CtrlP sets its local working directory according to this variable:
" r - the nearest ancestor of the current file that contains one of these
"      directories or files: .git .hg .svn .bzr _darcs
" a - the directory of the current file, unless it is a subdirectory of the cwd.
let g:ctrlp_working_path_mode   = 'ra'
" Specify the number of recently opened files you want CtrlP to remember:
let g:ctrlp_mruf_max            = 250
" Number of files to scan initially
let g:ctrlp_max_files           = 8000
let g:ctrlp_use_caching         = 1 " Enable per-session caching
" Set this to 0 to enable cross-session caching by not deleting the cache files:
let g:ctrlp_clear_cache_on_exit = 0
" Only update when typing has stopped after 100 ms
let g:ctrlp_lazy_update         = 100
" Set directory for ctrlp cache:
if has('unix')
    let g:ctrlp_cache_dir = $HOME.'/.vim/ctrlpcache'
    let g:ctrlp_mruf_case_sensitive = 0
else
    let g:ctrlp_cache_dir = $HOME.'\vimfiles\ctrlpcache'
    let g:ctrlp_mruf_case_sensitive = 0
endif
nnoremap <silent> <Leader>h :CtrlPTag<CR>
nnoremap <silent> <Leader>j :CtrlPBufTag<CR>

" Buffer Explorer:
nnoremap <silent> <Leader>e :BufExplorer<CR>
let g:bufExplorerDefaultHelp    = 0

" NERDTree Plugin:
nnoremap <silent> <Leader>f :NERDTree<CR>
au Filetype nerdtree setlocal nolist
" Disables display of the 'Bookmarks' label and 'Press ? for help' text:
let NERDTreeMinimalUI           = 1
let NERDTreeDirArrows           = 1

" NERD Commenter:
let NERDMenuMode                = 0

" Tagbar:
"
" tagbar window is opened on the left:
let g:tagbar_left               = 1
" If you set this option the cursor will move to the Tagbar window when it is
" opened:
let g:tagbar_autofocus          = 1
" Setting this option will result in Tagbar omitting the short help at the
" top of the window and the blank lines in between top-level scopes in order to
" save screen real estate:
let g:tagbar_compact            = 1
" g:vim_gitrepo_path is the path to the git repository
" required for g:tagbar_type_tex (so we find 'latex.cnf'
let g:vim_gitrepo_path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
" tagbar can be used to index latex files with ctags. but we need a
" configuration file for that: latex.cnf in the vim config directory.
let g:tagbar_type_tex = {
            \ 'ctagstype' : 'latex',
            \ 'kinds'     : [
                \ 's:sections',
                \ 'g:graphics:0:0',
                \ 'l:labels',
                \ 'r:refs:1:0',
                \ 'p:pagerefs:1:0'
            \ ],
            \ 'sort'    : 0,
            \ 'deffile' : g:vim_gitrepo_path . '/latex.cnf'
        \ }
nnoremap <silent> <leader>l :TagbarToggle<CR>

" AsyncRun:
" :Make command
command! -bang -nargs=* -complete=file Make AsyncRun -save=2 -program=make @ <args>
" Use F9 to toggle quickfix window rapidly:
noremap <silent> <F9> :call asyncrun#quickfix_toggle(8)<cr>
" automate opening quickfix window when AsyncRun starts
augroup vimrc
    autocmd!
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(8, 1)
augroup END

"
" =============================================================================
"
" File specific settings
" ----------------------

" LaTex specific:
"
" if synctex=1 is set, we can directly jump to the PDF position we are
" currently editing.
function! SyncTexForward() abort
    if has('win32')
        echo 'Not implemented'
    else
        let execstr = 'silent !okular --unique %:p:r.pdf\\#src:".line(".")."%:p &'
        exec execstr
        " otherwise the terminal window is messed up:
        redraw!
    endif
endfunction
augroup LatexGroup
    autocmd!
    autocmd BufEnter *.tex    compiler tex
    autocmd BufEnter *.tex    setlocal makeprg=make
    autocmd BufEnter *.tex    setlocal errorformat=%f:%l:\ %m
    autocmd BufEnter *.tex    setlocal wrap
    autocmd BufEnter *.tex    nnoremap <Leader>v :call SyncTexForward()<CR>
augroup END

" In Makefiles, don't expand tabs to spaces, since we need the actual tabs
augroup MakefileGroup
    autocmd!
    autocmd FileType make setlocal noexpandtab
augroup END

