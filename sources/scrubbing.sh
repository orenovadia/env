#!/usr/bin/env bash

alias yaml2json="ruby -ryaml -rjson -e 'puts JSON.pretty_generate(YAML.load(ARGF))'"
alias json2yaml="ruby -ryaml -rjson -e 'puts JSON.load(ARGF).to_yaml'"

function ap {
   awk -v x=$1 '{print $x}'
}
function awksum(){
   awk '{a+=$1}END{print a}'
}

function awkavg (){     
    awk '{a+=$1;c++}END{print a/c,"count",c}'; 
}

#Working with CSV:
alias csv="column -t -s,"


# Working with TSV:
alias tsv="column -t -s$'\t'"
alias tawk="awk -F'\t'  -v OFS='\t'"
alias tabsort="sort -t$'\t' "
