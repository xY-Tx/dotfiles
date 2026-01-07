-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--------------------------------------------------------
-- lang
--------------------------------------------------------
-- 表示言語を英語にする
-- vim.cmd('language en_US.UTF-8')

-- -- 表示言語を日本語にする
vim.cmd("language ja_JP.UTF-8")

--------------------------------------------------------
-- ファイル
--------------------------------------------------------
-- エンコーディングをUTF-8に設定
vim.opt.fileencoding = "utf-8"

-- スワップファイルを作成しない
vim.opt.swapfile = false

-- ヘルプファイルの言語は日本語
-- vim.opt.helplang = "ja"

-- バッファを切り替えるときにファイルを保存しなくてもOKに
vim.opt.hidden = true

--------------------------------------------------------
-- カーソルと表示
--------------------------------------------------------
-- カーソルがある行を強調
vim.opt.cursorline = true

-- カーソルがある列を強調
vim.opt.cursorcolumn = true

--------------------------------------------------------
-- クリップボード共有
--------------------------------------------------------
-- レジスタとクリップボードを共有
vim.opt.clipboard:append({ "unnamedplus" })

--------------------------------------------------------
-- メニューとコマンド
--------------------------------------------------------
-- コマンドラインで補完
vim.opt.wildmenu = true

-- コマンドラインの表示行数
vim.opt.cmdheight = 1

-- グローバルステータスラインを使用
vim.opt.laststatus = 3

-- コマンドラインに入力されたコマンドを表示
vim.opt.showcmd = true

--------------------------------------------------------
-- 検索・置換え
--------------------------------------------------------
--- -- ハイライト検索を有効
vim.opt.hlsearch = true

-- インクリメンタルサーチを有効
vim.opt.incsearch = true

-- 入力された文字列がマッチするまでにかかる時間
vim.opt.matchtime = 1

--------------------------------------------------------
-- カラースキーム
--------------------------------------------------------
-- 24 ビットカラーを使用
vim.opt.termguicolors = true

-- ダークカラーを使用する
vim.opt.background = "dark"

--------------------------------------------------------
-- インデント
--------------------------------------------------------
-- シフト幅を4に設定する
vim.opt.shiftwidth = 4

-- タブ幅を4に設定する
vim.opt.tabstop = 4

-- タブ文字をスペースに置き換える
vim.opt.expandtab = true

-- 自動インデントを有効にする
vim.opt.autoindent = true

-- インデントをスマートに調整する
vim.opt.smartindent = true

--------------------------------------------------------
-- 表示
--------------------------------------------------------
-- 行番号を表示
vim.opt.number = true

-- 相対行番号を表示
vim.opt.relativenumber = true

-- テキストの自動折り返しを無効に
vim.opt.wrap = false

-- タブラインを表示
-- （1:常に表示、2:タブが開かれたときに表示）
vim.opt.showtabline = 2

-- ビープ音を表示する代わりに画面をフラッシュ
vim.opt.visualbell = true

-- 対応する括弧をハイライト表示
vim.opt.showmatch = true

-- 制御文字を可視化
vim.opt.list = true

-- スペースを可視化
vim.opt.listchars = {
  space = "·", -- 半角スペース
  tab = "»·", -- タブ
  trail = "·", -- 行末の空白
  extends = "»", -- 画面右に続く行
  precedes = "«", -- 画面左に続く行
  nbsp = "␣", -- ノーブレークスペース
}

--------------------------------------------------------
-- インタフェース
--------------------------------------------------------
-- ウィンドウの不透明度
vim.opt.winblend = 0

-- ポップアップメニューの不透明度
vim.opt.pumblend = 0

-- タブラインを表示する設定
vim.opt.showtabline = 2

-- サインカラムを表示
vim.opt.signcolumn = "yes"

-- 行番号の色を変更（色は適宜変更してください）
-- vim.cmd("highlight LineNr guifg=#8a70ac")

-- カーソルの形状
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

-- ビジュアルモードで行末の右側も選択可能にする
vim.opt.virtualedit:append("block")

-- signcolumnの優先順位（エラー/警告/ヒントの表示順）
vim.diagnostic.config({ severity_sort = true })

--------------------------------------------------------
-- スペルチェック
--------------------------------------------------------
-- 日本語はスペルチェックの対象にしない
vim.opt.spelllang = { "en", "cjk" }
