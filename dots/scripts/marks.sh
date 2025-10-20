#!/usr/bin/env bash

FLAG=$1
TMP_FILE="/tmp/hxmarks"


get_file() {
  local file_index=$1
  local marks=()

  mapfile -t marks < <(cat "$TMP_FILE" 2>/dev/null)

  i=$(( file_index - 1))

  echo "${marks[$i]}"

}


list_files() {

  local marks=()

  mapfile -t marks < <(cat "$TMP_FILE" 2>/dev/null)

  for i in "${marks[@]}"; do
    echo "$i"
  done
  
}


add_file() {
  local marks=()
  local file=$1

  mapfile -t marks < <(cat "$TMP_FILE" 2>/dev/null)

  if [ ${#marks[@]} -gt 5 ]; then
    echo "max marks reached"
  else
    echo "$file" | sed "s|^$HOME|~|" >> "$TMP_FILE"  
    # echo "$file" >> "$TMP_FILE"  
  fi

  
}


main() {
  case "$FLAG" in
    --file)
        case "$2" in
          1)
            get_file 1
            ;;
          2)
            get_file 2
            ;;
          3)
            get_file 3
            ;;
          4)
            get_file 4
            ;;
          5)
            get_file 5
            ;;
          *)
            echo ""
            ;;
        esac
      ;;
    ls)
      list_files
      ;;
    --add-file)
    add_file "$2"
    ;;
    *)
      ;;
  esac
}


main "$@"
