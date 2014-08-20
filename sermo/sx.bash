#!bash
# Handy shortcuts for working with Sermo X applications and libraries

sx() {
  case "$1" in
    "restart")
      sx-restart ${*:2}
      ;;
    *)
      if [[ "$2" == "" ]]; then
        sx-cd $1
      else
        echo "Command not supported: $1"
        return 1
      fi
      ;;
  esac
}

# -----------------------------------------

sx-apps() {
  ls -x $V2_HOME/apps
}

sx-libs() {
  ls -x $V2_HOME/lib
}

sx-path() {
  if [[ "" != "$1" ]]; then
    find $V2_HOME -maxdepth 2 -type d -name $1 | head -1
  else
    echo $V2_HOME
  fi
}

sx-cd() {
  local path=$(sx-path $1)
  if [[ -d $path ]]; then
    cd $path
    pwd
  else
    echo "No such app/lib: $1"
    return 1
  fi
}

sx-restart() {
  local apps=$@
  if [[ "$apps" == "" ]]; then
    apps=$(sx-apps)
  fi
  for app in $apps; do
    local path=$(sx-path $app)
    # TODO: Make sure this is an app and not a lib.
    if [[ -d $path ]]; then
      local tmp_path="$path/tmp"
      mkdir -p "$tmp_path"
      cmd="touch $tmp_path/restart.txt"
      echo $cmd
      $cmd
    else
      echo "No such app: $1"
    fi
  done
}

# Enable tab completion for sx
complete -W "$(sx-apps) $(sx-libs)" sx
