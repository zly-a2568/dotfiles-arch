#!/bin/bash

query=$(printf ''| rofi -dmenu -config "/home/zly/.config/rofi/config-search.rasi" -mesg "Search Engine : Bing")

if [[ -z "$query" ]]; then
  exit 0
fi

xdg-open "https://cn.bing.com/search?q=$query"
