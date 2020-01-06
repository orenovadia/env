alias docker_killall='docker ps -a  -q | xargs docker rm -f'
alias docker_rm_all_images='docker images -a -q | xargs docker rmi'
