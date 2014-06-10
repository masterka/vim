
" - - - - - - - - - -
"
" vi 自体の動作に関係あること
"
" vi 互換にしない
set nocompatible
" デフォルトを入力モードにしない
set noinsertmode
" バックアップを保存しない
set nobackup
" バックアップディレクトリの候補
"set backupdir=$HOME/tmp/
" バックアップファイルを作る時に以前のファイルを上書きしない
set nowritebackup
" viminfo の設定
"set viminfo=%,'50,\"100,:100,n~/.viminfo
" 覚えておく履歴の数
set history=500
" エラーベルを鳴らさない
set noerrorbells
" ビジュアルベルを使う
set visualbell
" ビジュアルベルで表示するもの
set t_vb=
" 隠れバッファを使う
set hidden
" 早い端末を使う
set ttyfast
" 組み込まれた termcap を使う
set ttybuiltin
" スクロールするラインの最大数
"set ttyscroll=0
" 補完をタブで行なう
"set wildchar=<TAB>

set encoding=utf-8
set fileencodings=euc-jp,utf-8,iso-2022-jp,shift_jis
" - - - - - - - - - -
"
" ウインドウ設定
"
" gvim 使用時は gvimrc でやる。
" ウインドウの幅
" set columns=80
" ウインドウの高さ
" set lines=25
" タイトルを表示しない
"set notitle
" 新しいウィンドウを上から分割
set nosplitbelow


" - - - - - - - - - -
"
" 画面表示の設定
"
" 行番号を非表示
set number
"set nonumber
" GVim では行番号を表示
"if has("gui_running")
"  set number
"else
"  set nonumber
"endif
" ルーラーを表示
"set ruler
" タブや改行を表示しない
set nolist
" GVim ではタブや改行などを表示
"if has("gui_running")
"  set list
"else
"  set nolist
"endif
" タブや改行の表示文字設定
"set listchars=tab:>-,extends:-,trail:-,eol:<
" 長い行を折り返す
set wrap
" 行を折り返した時の右側のマージン
set wrapmargin=1
" 常にステータス行を表示
set laststatus=2
" コマンドをステータス行に表示
set showcmd
" コマンドラインの高さ
set cmdheight=1
" 今使っているモードを表示する
set showmode
" ヘルプの最小の高さ
set helpheight=1

if has("syntax")
" 色を付ける
  syntax on
  " コメント文の配色
  hi! Comment term=bold ctermfg=brown ctermbg=Grey guifg=brown guibg=grey
endif

if &t_Co > 2 || has("gui_running")
" サーチしたパターンをマークする
  set hlsearch
" 検索中の文字列をマークする
  set incsearch
" ハイライトする文字列
  set highlight=8r,db,es,hs,mb,Mr,nu,rs,sr,tb,vr,ws
endif


" - - - - - - - - - -
"
" 編集に関する設定
"
" ファイルのタブの幅
"set tabstop=4
" ファイルのタブの幅
set ts=4 sw=4 sts=0
set expandtab
" 編集中でのタブの幅
"set softtabstop=4
" インデントの幅
"set shiftwidth=2
" タブに shiftwidth を使用
"set smarttab
" タブをスペースに展開しない
"set noexpandtab
" 自動的にインデント
set autoindent
set smartindent
" インデントを shiftwidth に丸める
"set shiftround
" バックスペースでいろいろ削除
set backspace=2
" コマンドライン補完する
set wildmenu
" ホワイトスペースで折り返さない
set nolinebreak
" gq コマンドで整形するときのテキストの幅
set textwidth=0
" gq コマンド以外では自動改行しない
set formatoptions=q
" テキスト挿入中の自動折り返しを日本語に対応させる
if version >= 600
  set formatoptions+=mM
endif
" ~ コマンドのオペレータ化
" set tildeop
" テキストの貼り付けの切り替え
if version>=508
  map <F10> :set paste<CR>
  map <F11> :set nopaste<CR>
  imap <F10> <C-O>:set paste<CR>
  imap <F11> <nop>
  set pastetoggle=<F11>
endif


" - - - - - - - - - -
"
" 検索とジャンプの挙動に関する設定
"
" 検索時に大文字小文字を無視
set ignorecase
"set noignorecase
" 大文字が含まれている場合は区別
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 正規表現で magic モードにする
set magic
" ジャンプした時、現在のカーソル位置をキープする
set nostartofline
" 対応する括弧に一時的に移動する
set showmatch
" ジャンプマンドが次の行に移動する
set whichwrap=<,>,h,l,[,]

" 色を変更する
colorscheme	torte	


"---- neobundle
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
" let NeoBundle manage NeoBundle
NeoBundleFetch 'Shougo/neobundle.vim'
" add plugins
NeoBundle 'tpope/vim-endwise'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'https://github.com/vim-scripts/yanktmp.vim'
filetype plugin on
filetype indent on
NeoBundleCheck

"omni変換
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"tabでomni補完
autocmd FileType c,h :set dictionary+=~/.vim/dict/c.dict
autocmd FileType cc,cpp,h :set dictionary+=~/.vim/dict/cpp.dict
autocmd FileType perl,cgi,pl :set dictionary+=~/.vim/dict/perl.dict
autocmd FileType java :set dictionary+=~/.vim/dict/java.dict
autocmd FileType ruby :set dictionary+=~/.vim/dict/ruby.dict
set complete+=k

"-----置換コマンド
function InsertTabWrapper(type)
    let col = col('.') - 1
    "omni補完の場合、omini以外にも上下左右の移動もする
    if a:type=='omni'
      if pumvisible()
          return "\<c-n>"
      endif
      if !col || getline('.')[col - 1] !~ '\k\|<\|/'
          return "\<tab>"
      elseif exists('&omnifunc') && &omnifunc == ''
          return "\<c-n>"
      else
          return "\<c-x>\<c-o>"
      endif
    "keywordの場合、該当のとき以外は何もしない
    else
      if pumvisible() || !col || getline('.')[col - 1] !~ '\k\|<\|/'
          return ""
      else
          return "\<c-x>\<c-p>"
      endif
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper('omni')<cr><c-r>=InsertTabWrapper('keyword')<cr>

"omni変換時 preview windowsが邪魔なので消す
set completeopt=longest,menu


"---vim yank
map sy :call YanktmpYank()
map sp :call YanktmpPaste_p()
map sP :call YanktmpPaste_P()


