function _grep_fzf(){ 
PATTERN=$1
ref=$( grep  --include '*.py' -o -n  -r -P "${PATTERN}" . \
| fzf --height 40%  -d':' -n1 --with-nth 3 )

[[ -z $ref ]] &&  return
vi `echo $ref  |  awk -F':' '{print "+"$2 ,$1}' ` ;
}; 

function _grep_fzf_file_ref(){ 
PATTERN=$1
ref=`grep  --include '*.py' -o -n  -r -P "${PATTERN}" . | grep -v test | awk -F':' '{print $3, $1, $2}'| fzf --height 40% `
# name file line
[[ -z $ref ]] &&  return
vi `echo $ref  |  awk '{print "+"$3 ,$2}' ` ;
}; 
function fspymethod(){
_grep_fzf_file_ref  '(?<=def\s)(\b\w+\b)'
}
function fspyclass(){
_grep_fzf  '(?<=class\s)(\b\w+)'
}
alias fspy='$(echo fspymethod,fspyclass|tr "," "\n"|fzf --height 10%)'
bind '"\C-n":"fspyclass\n"'  # Ctrl+n opens `fspyclass`
bind '"\C-f":"fspymethod\n"' # Ctrl+f opens `pymethod`

