#!/bin/bash

Replace() {
  sed -i '' "s/${1//\\/\\\\}/${2//\\/\\\\}/g" "$filename"
}

bootableyosemite.html() {
  Replace "El Capitan"     "Yosemite"
  Replace "El\ Capitan"    "Yosemite"
  Replace "bootableelcapitan" "bootableyosemite"
  Replace "sh7z4.png" "osxinstallesd.png"
  Replace "f214T.png" "osxbasesystem.png"
}

bootablesierra.html() {
  Replace "El Capitan"     "Sierra"
  Replace "El\ Capitan"    "Sierra"
  Replace "InstallMacOSX"  "InstallOS"
  Replace "Install\ OS\ X" "Install\ macOS"
  Replace "bootableelcapitan" "bootablesierra"
  Replace "sh7z4.png" "osxinstallesd.png"
  Replace "f214T.png" "osxbasesystem.png"
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
