#!/usr/bin/env bash

# Lista de accesos directos con sus iconos
options=(
    "Terminal\0icon\x1fqterminal"
    "Gestor de archivos\0icon\x1ffolder"
    "Featherpad\0icon\x1ffeatherpad"
    "Firefox\0icon\x1ffirefox-esr"
    "Falkon\0icon\x1ffalkon"
    "GitHub\0icon\x1f/home/oscar/.local/share/icons/github.svg"
)

# Estilo al vuelo para forzar la lista vertical limpia con espacio
theme_override='
listview {
    lines: 6;
    columns: 1;
    spacing: 6px;
}
element {
    padding: 8px 12px;
    orientation: horizontal;
}
element-icon {
    size: 24px;
    margin: 0px 10px 0px 0px;
}
element-text {
    vertical-align: 0.5;
}
'

# Desplegar Rofi en modo lista con iconos
chosen=$(printf "%b\n" "${options[@]}" | rofi -dmenu -p "Favoritos" -i -show-icons -theme-str "$theme_override")

# Ejecutar según la opción
case "$chosen" in
    "Terminal")
        alacritty &
        ;;
    "Gestor de archivos")
        pcmanfm-qt &
        ;;
    "Firefox")
        firefox-esr &
        ;;
    "Featherpad")
        featherpad &
        ;;
    "Falkon")
        falkon &
        ;;
    "GitHub")
        xdg-open "https://github.com/oscarjimenezpuig" &
        ;;
esac
