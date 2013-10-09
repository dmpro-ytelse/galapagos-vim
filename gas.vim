" Vim syntax file
" Language: Gene Assembly
" Maintainer: Sigve Sebastian Farstad

if exists("b:current_syntax")
  finish
endif


syn match error '.' containedin=ifcond
syn match whitespace '[\t\v ]' containedin=ifcond
syn match comma ','

syn match label '[a-zA-Z_][a-zA-Z0-9_]*:'
syn match label contained containedin=call_or_jmp_line '[a-zA-Z_][a-zA-Z0-9_]*'
syn match register 'r[0-9]' containedin=call_or_jmp_line
syn match register 'r[12][0-9]' containedin=call_or_jmp_line
syn match register 'r30' containedin=call_or_jmp_line
syn match register 'r31' containedin=call_or_jmp_line
syn match constant '[\t ,]\d\+'
syn match constant '[\t ,][-+]\d\+'
syn match constant '[\t ,]0x[0-9a-fA-F]\+'
syn match constant '[\t ,][-+]0x[0-9a-fA-F]\+'
syn match constant '[\t ,]0b[01]\+'
syn match constant '[\t ,][-+]0b[01]\+'

syn match operators 'add'
syn match operators 'addi'
syn match operators 'and'
syn match operators 'andi'
syn match operators 'mul'
syn match operators 'muli'
syn match operators 'or'
syn match operators 'ori'
syn match operators 'sll'
syn match operators 'slli'
syn match operators 'sra'
syn match operators 'srai'
syn match operators 'srl'
syn match operators 'srli'
syn match operators 'sub'
syn match operators 'subi'
syn match operators 'xor'
syn match operators 'xori'
syn match operators 'ld'
syn match operators 'ldi'
syn match operators 'st'
syn match operators 'sti'
syn match operators 'ldg'
syn match operators 'setg'
syn match operators 'stg'
syn match operators 'cmp'
syn match operators 'mv'
syn match operators 'neg'
syn match operators 'nop'
syn match operators 'not'

syn match conditional 'if' contained containedin=ifcond
syn match conditional_colon ':' contained containedin=ifcond

syn match jumping_operators 'call' containedin=ALL
syn match jumping_operators 'jmp' containedin=ALL
syn match jumping_operators 'ret'

syn region call_or_jmp_line start=/call/ end=/.*/ oneline
syn region call_or_jmp_line start=/jmp/ end=/.*/ oneline

syn region ifcond start='if' end=/:/ keepend contains=conditional,cond,conditional_colon

syn region comment start="/\*" end="\*/"

syn match cond 'equal' contained containedin=ifcond
syn match cond 'not equal' contained containedin=ifcond
syn match cond 'greater than' contained containedin=ifcond
syn match cond 'greater than or equal' contained containedin=ifcond
syn match cond 'less than' contained containedin=ifcond
syn match cond 'less than or equal' contained containedin=ifcond
syn match cond 'zero' contained containedin=ifcond
syn match cond 'not zero' contained containedin=ifcond
syn match cond 'positive' contained containedin=ifcond
syn match cond 'positive or zero' contained containedin=ifcond
syn match cond 'negative' contained containedin=ifcond
syn match cond 'negative or zero' contained containedin=ifcond
syn match cond 'overflow' contained containedin=ifcond
syn match cond 'not overflow' contained containedin=ifcond
syn match cond 'never' contained containedin=ifcond
syn match cond 'always' contained containedin=ifcond

let b:current_syntax = "gas"

hi def link register Identifier
hi def link operator Operator
hi def link jumping_operators Special
hi def link constant Number
hi def link label Label
hi def link comment Comment
hi def link conditional Conditional
hi def link error Error
hi def link cond String
