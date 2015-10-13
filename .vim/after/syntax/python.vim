let s:bcs = b:current_syntax
unlet b:current_syntax
syntax include @SQL syntax/sql.vim
let b:current_syntax = s:bcs
syntax region pythonHereDocSQL matchgroup=Statement start=+.*_SQL = """+ end=+^"""$+ contains=@SQL
