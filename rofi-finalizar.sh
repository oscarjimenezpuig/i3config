#!/usr/bin/env bash

# Definir las opciones interpretando directamente los caracteres Unicode de Font Awesome
opt_power=$'\uf011  Apagar'
opt_reboot=$'\uf01e  Reiniciar'
opt_lock=$'\uf023  Bloquear'
opt_logout=$'\uf08b  Cerrar sesion'

# Lista de opciones
options=(
    "$opt_power"
    "$opt_reboot"
    "$opt_lock"
    "$opt_logout"
)

# Estilo para lista vertical
theme_override='
listview {
    lines: 4;
    columns: 1;
    spacing: 6px;
}
element {
    padding: 8px 12px;
    orientation: horizontal;
}
element-text {
    vertical-align: 0.5;
}
'

# Desplegar Rofi (sin -show-icons, ya que los iconos van integrados en la fuente)
chosen=$(printf "%s\n" "${options[@]}" | rofi -dmenu -p "Sistema" -i -theme-str "$theme_override")

# Ejecutar según la opción seleccionada
case "$chosen" in
    "$opt_power")
        systemctl poweroff
        ;;
    "$opt_reboot")
        systemctl reboot
        ;;
    "$opt_lock")
        i3lock -c 1a232e -u
        ;;
    "$opt_logout")
        i3-msg exit
        ;;
esac
