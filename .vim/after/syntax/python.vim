let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @HQL syntax/hive.vim
let b:current_syntax = s:bcs
syntax region pythonHereDocHQL matchgroup=Statement start=+.*_HQL = """+ end=+^"""$+ contains=@HQL

let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs
syntax region pythonHereDocSQL matchgroup=Statement start=+.*_SQL = """+ end=+^"""$+ contains=@SQL
