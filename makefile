#!/bin/bash

Replace() {
  sed -i '' "s/${1//\\/\\\\}/${2//\\/\\\\}/g" "$filename"
}

bootableyosemite.html() {
  Replace "El Capitan"     "Yosemite"
  Replace "El\ Capitan"    "Yosemite"
}

bootablesierra.html() {
  Replace "El Capitan"     "Sierra"
  Replace "El\ Capitan"    "Sierra"
  Replace "InstallMacOSX"  "InstallOS"
  Replace "Install\ OS\ X" "Install\ macOS"
}

DoHTML() {
  local "filename=$1"
  echo "Creating $filename"
  cp bootableelcapitan.html $filename
  "$@"
  echo "Done"
}

Main() {
  case "${1:-}" in 
  bootableyosemite.html) DoHTML "$@";;
  bootablesierra.html) DoHTML "$@";;
  *)
    echo "Choose from the following:"
    echo "bootableyosemite.html"
    echo "bootablesierra.html"
  esac

#El Capitan      Sierra
#El\ Capitan     Sierra
#InstallMacOSX   InstallOS
#Install\ OS\ X  Install\ macOS

}
Main "$@"
