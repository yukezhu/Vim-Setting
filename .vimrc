map <S-C> :call DoIt()<CR>

function DoIt()
	if &filetype == "c"
		let CompileIt="gcc \\\"%\\\" -Wall -O2 -lm"
		let RunIt="./a.out"
	elseif &filetype == "cpp" || &filetype == "cpp.doxygen"
		let CompileIt="g++ \\\"%\\\" -Wall -O2"
		let RunIt="./a.out"
	elseif &filetype == "cs"
		let CompileIt="gmcs \\\"%\\\""
		let RunIt="mono \\\"%<.exe\\\""
	elseif &filetype == "java"
		let CompileIt="javac -Xlint \\\"%\\\""
		let RunIt="java \\\"%<\\\""
	elseif &filetype == "pascal"
		let CompileIt="fpc \\\"%\\\""
		let RunIt="\\\"./%<\\\""
	elseif &filetype == "fortran"
		let CompileIt="gfortran \\\"%\\\""
		let RunIt="\\\"./a.out\\\""
	elseif &filetype == "tex"
		let CompileIt="xelatex \\\"%\\\""
		let RunIt="evince \\\"%<.pdf\\\""
	elseif &filetype == "haskell" || &filetype == "lhaskell"
		let CompileIt="true"
		let RunIt="ghci \\\"%\\\""
	elseif &filetype == "sh"
		let CompileIt="true"
		let RunIt="bash \\\"%\\\""
	elseif &filetype == "php" || &filetype == "perl" || &filetype == "python" || &filetype == "ruby"
		let CompileIt="true"
		let RunIt=&filetype . " \\\"%\\\""
	else
		let CompileIt="true"
		let RunIt="true"
	endif
	execute "w"
	execute "!xterm -fn 10*20 -geometry 80x32 -e \"" . CompileIt . "&& echo \"__compiled__\" && " . RunIt . " ; read -n 1\""
endfunction

set nocompatible
set number
filetype on
syntax on

set autoindent
set hlsearch

set tabstop=4
set shiftwidth=4
set mouse=a
