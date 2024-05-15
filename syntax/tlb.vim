" Vim syntax file
" Language:     TL-B
" Maintainer:   Guro Bokum <jiojiajiu@gmail.com>
" Last Change:  2024 May 15

if version < 600
  syntax clear
" Quit when a (custom) syntax file was already loaded
elseif exists("b:current_syntax")
  finish
endif

syn region tlbDec start="^[a-zA-Z_]" end=";" contains=tlbConstructor,tlbParams

syn match tlbContructor "^[a-zA-Z0-9_#$]*" contains=tlbConstructorName
syn match tlbConstructorName "^[a-zA-Z0-9_]*" contained nextgroup=tlbConstructorPrefixCode
syn match tlbConstructorPrefixCode "[$#][0-9]*" contained
syn match tlbConstructorPrefixCode "[$#]_" contained

syn match tlbComment "//.*$"
syn region tlbComment start="/\*" end="\*/"

syn region tlbParams start="{" end="}" contained

syn match tlbLabel     /^\w*\./ nextgroup=tlbClass
syn match tlbClass     /.*/ contained contains=tlbEquals,tlbString,tlbList,tlbIdent
syn match tlbIdent     / [a-zA-Z0-9]*/ contained

syn region tlbString start=+"+ end=+"+
syn region tlbList   start=+\[+ end=+\]+

hi link tlbString   String
hi link tlbList   Special
hi link tlbComment    Comment
hi link tlbLabel    Statement
hi link tlbClass    SpecialComment
hi link tlbEquals   Define
hi link tlbIdent    NONE
hi link tlbConstructorName  Type
hi link tlbConstructorPrefixCode  Special
