# ubuntu
alias ll='ls -lArh'
alias ebashrc='vi ~/.bashrc'
alias srcbashrc='source ~/.bashrc'
alias srcaliases='source ~/.bash_aliases'
grp() {
    grep --color -nri "$1"
}
# vim
alias vimcfg='vi /home/daniel/.vimrc'
#git
alias gitst='git status'
alias gl='git pull'
commit() {
    git commit -m "$*"
}
# imio
alias ipt='cd ~/Teleservices/docker-teleservices/src/scripts/imio-publik-themes/'
alias localthemes='cd ~/Teleservices/docker-teleservices/src/scripts/imio-publik-themes/static'
alias imiostart='cd ~/dan_scripts && ./start_the_day.sh'
alias localts='docker exec -ti docker-teleservices_localteleservices_1 bash'

