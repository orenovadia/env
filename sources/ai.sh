assistant() {
  cd /Users/oren.ovadia/src/orenbot || return
  case "$1" in
    ls|resume) shift; claude --resume "$@" ;;
    "") claude ;;
    *) claude "$@" ;;
  esac
}
