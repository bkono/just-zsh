# Make directory and change into it.
function mcd() {
  mkdir -p "$1" && cd "$1";
}
function cdf() { cd *$1*/ }

# Change file extensions recursively in current directory
# change-extension erb haml
function change-extension() {
  foreach f (**/*.$1)
  mv $f $f:r.$2
  end
}

# Shell functions
function tophist() {
  history | awk '{print $2}' | sort | uniq -c | sort -rn | head -n 15
}
function used-ports() {
  lsof -i | grep LISTEN
}

function usage() {
  if ! type gsort >/dev/null 2>&1; then
    echo "gsort not defined, is required"
    return
  fi

  du -h -d "${2:-1}" "${1:-.}" | gsort -h | sed "s:\./::" | sed "s:$HOME:~:"
}
