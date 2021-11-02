super-kill() {
  kill -9 $(ps aux | grep -i $1 | cut -d' ' -f2- | sed 's/^ *//g' | cut -d' ' -f1)
}

get-ip() {
  ipconfig | grep -i 'inet '
}