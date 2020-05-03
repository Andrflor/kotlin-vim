" Vim syntax file
" Language: Kotlin
" Maintainer: Alexander Udalov
" Latest Revision: 26 May 2019

if exists('b:current_syntax')
    finish
endif

syn keyword ktStatement break continue return
syn keyword ktConditional if else when
syn keyword ktRepeat do for while
syn keyword ktOperator in is by
syn keyword ktKeyword get set out super this where
syn keyword ktException try catch finally throw

syn keyword ktInclude import package

syn keyword ktType Any Boolean Byte Char Double Float Int Long Nothing Short Unit
syn keyword ktModifier annotation companion enum inner internal private protected public abstract final open override sealed vararg dynamic expect actual
syn keyword ktStructure class object interface typealias fun val var constructor init

syn keyword ktReservedKeyword typeof

syn keyword ktBoolean true false
syn keyword ktConstant null

syn keyword ktModifier data tailrec lateinit reified external inline noinline crossinline const operator infix suspend

syn match ktOperator "\v\?:|::|\<\=? | \>\=?|[!=]\=\=?|<as>\??|[-!%&*+/|]"

syn keyword ktTodo TODO FIXME XXX contained
syn match ktShebang "\v^#!.*$"
syn match ktLineComment "\v//.*$" contains=ktTodo,@Spell
syn region ktComment matchgroup=ktCommentMatchGroup start="/\*" end="\*/" contains=ktComment,ktTodo,@Spell

syn region ktDocComment start="/\*\*" end="\*/" contains=ktDocTag,ktTodo,@Spell
syn match ktDocTag "\v\@(author|constructor|receiver|return|since|suppress)>" contained
syn match ktDocTag "\v\@(exception|param|property|throws|see|sample)>\s*\S+" contains=ktDocTagParam contained
syn match ktDocTagParam "\v(\s|\[)\S+" contained
syn match ktComment "/\*\*/"

syn match ktSpecialCharError "\v\\." contained
syn match ktSpecialChar "\v\\([tbnr'"$\\]|u\x{4})" contained
syn region ktString start='"' skip='\\"' end='"' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError
syn region ktString start='"""' end='""""*' contains=ktSimpleInterpolation,ktComplexInterpolation,ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'[^']*'" contains=ktSpecialChar,ktSpecialCharError
syn match ktCharacter "\v'\\''" contains=ktSpecialChar
syn match ktCharacter "\v'[^\\]'"

" KDoc
syn case ignore

syn region ktMarkdownLink matchgroup=markdownLinkDelimiter start="\[" end="\]" oneline keepend skipwhite contained
syn cluster ktMarkdown contains=ktMarkdownLink
hi link ktMarkdownLink markdownLinkText
hi link ktMarkdownLinkDelimiter markdownLinkText

syn include @ktMarkdown syntax/markdown.vim
unlet b:current_syntax

syn match ktCommentStar      contained "^\s*\*\ze[^/]"
syn match ktCommentStar      contained "^\s*\*$"
syn match ktCommentStar      contained "^\s*\*/"
syn region ktDocComment       start="/\*\*"  end="\*/" keepend contains=ktCommentStar,ktCommentTitle,@ktMarkdown,ktDocTags,ktDocSeeTag,ktTodo
syn region ktCommentTitle     contained matchgroup=ktDocComment start="/\*\*"   matchgroup=ktCommentTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end="\*/"me=s-2 contains=ktCommentStar,@ktMarkdown,ktTodo,ktDocTags,ktDocSeeTag

syn match ktDocTags         contained "@\(param\|property\|throws\|exception\|sample\|see\)\s\+\S\+" contains=ktDocParam
syn match ktDocParam        contained "\s\S\+"
syn match ktDocTags         contained "@\(return\|constructor\|receiver\|author\|since\|suppress\)\>"

syn case match
" ---

" TODO: highlight label in 'this@Foo'
syn match ktAnnotation "\v(\w)@<!\@[[:alnum:]_.]*(:[[:alnum:]_.]*)?"
syn match ktLabel "\v\w+\@"

syn match ktSimpleInterpolation "\v\$\h\w*" contained
syn region ktComplexInterpolation matchgroup=ktComplexInterpolationBrace start="\v\$\{" end="\v\}" contains=ALLBUT,ktSimpleInterpolation,ktTodo,ktSpecialCharError,ktSpecialChar,ktDocTag,ktDocTagParam

syn match ktNumber "\v<\d+[_[:digit:]]*(uL?|UL?|[LFf])?"
syn match ktNumber "\v<0[Xx]\x+[_[:xdigit:]]*(uL?|UL?|L)?"
syn match ktNumber "\v<0[Bb][01]+[_01]*(uL?|UL?|L)?"
syn match ktFloat "\v<\d*(\d[eE][-+]?\d+|\.\d+([eE][-+]?\d+)?)[Ff]?"

syn match ktEscapedName "\v`.*`"

syn match ktExclExcl "!!"
syn match ktArrow "->"

syn match ktIdentifier "\<[a-z]\w*\>"
syn match ktInfix " \zs[a-z]\w*" contained
syn match ktInfixPair "\<\w\+\s\+[a-z]\w*\>" contains=ktInfix,ktNumber,ktFloat,ktEscapedName,ktString,ktCharacter
syn match ktFunction "\<[a-z]\w\+\ze\s*[({]"
syn match ktClass "\<[A-Z]\w*\>"
syn match ktClas "\.\<[A-Z]\w*\>"
syn match ktFunctionCls "\<[A-Z]\w\+\ze\s*[({]"
syn match ktArgument "\w*\:"

hi def link ktStatement Statement
hi def link ktConditional Conditional
hi def link ktRepeat Repeat
hi def link ktOperator Operator
hi def link ktKeyword Conditional
hi def link ktException Exception
hi def link ktReservedKeyword Error

hi link ktCommentStar Comment
hi link ktDocComment Comment
hi link ktCommentTitle SpecialComment
hi link ktDocTags Statement

hi def link ktInclude Include

hi def link ktType Type
hi link ktModifier Conditional
hi def link ktStructure Conditional
hi def link ktTypedef Typedef

hi def link ktBoolean Boolean
hi def link ktConstant Constant

hi def link ktTodo Todo
hi def link ktShebang Comment
hi def link ktLineComment Comment
hi def link ktComment Comment
hi def link ktCommentMatchGroup Comment
hi def link ktDocComment Comment
hi def link ktDocTag Special
hi def link ktDocTagParam Identifier

hi def link ktSpecialChar SpecialChar
hi def link ktSpecialCharError Error
hi def link ktString String
hi def link ktCharacter Character

hi link ktClass Structure
hi link ktClas Modifier
hi link ktFunction Special
hi link ktFunctionCls Special
hi link ktArgument Number
hi link ktArguments Number


hi def link ktAnnotation Identifier
hi def link ktLabel Identifier

hi def link ktSimpleInterpolation Identifier
hi def link ktComplexInterpolationBrace Identifier

hi def link ktNumber Number
hi def link ktFloat Float

hi def link ktExclExcl Special
hi def link ktArrow Structure

let b:current_syntax = 'kotlin'
