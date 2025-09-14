#!/bin/bash

function mirror_monitors() {
    xrandr --output HDMI-A-0 --mode 1920x1080 --same-as eDP
    echo "[+] Monitores en modo espejo."
}

function primary_hdmi() {
    xrandr --output HDMI-A-0 --off
    xrandr --output eDP --off
    xrandr --output HDMI-A-0 --mode 1920x1080 --primary
    xrandr --output eDP --mode 1920x1080 --right-of HDMI-A-0
    echo "[+] HDMI-A-0 es ahora el monitor principal."
}

function primary_edp() {
    xrandr --output HDMI-A-0 --off
    xrandr --output eDP --off
    xrandr --output eDP --mode 1920x1080 --primary
    xrandr --output HDMI-A-0 --mode 1920x1080 --right-of eDP
    echo "[+] eDP es ahora el monitor principal."
}

function reset_monitors() {
    xrandr --output HDMI-A-0 --off
    xrandr --output eDP --auto
    xrandr --output HDMI-A-0 --mode 1920x1080 --right-of eDP
    echo "[*] Configuración de monitores restablecida."
}

case "$1" in
    mirror)
        mirror_monitors
        ;;
    hdmi)
        primary_hdmi
        ;;
    edp)
        primary_edp
        ;;
    reset)
        reset_monitors
        ;;
    *)
        echo "[*] Uso: $0 {mirror|hdmi|edp|reset}"
        exit 1
        ;;
esac
