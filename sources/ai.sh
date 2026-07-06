assistant() {
  cd /Users/oren.ovadia/src/orenbot || return
  case "$1" in
    ls|resume) shift; claude --model opus --resume "$@" ;;
    "") claude --model opus ;;
    *) claude --model opus  "$@" ;;
  esac
}
