git config --global core.editor "vim"

# Aliases

git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
git config --global alias.lgs "log --color --stat --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit" 
git config --global alias.ss "status --short --branch" 
git config --global alias.stats "shortlog -sn" 
git config --global alias.recent "for-each-ref --count=10 --sort=-committerdate refs/heads/ --format='%(refname:short)'" 
