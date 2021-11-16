#!/usr/bin/env bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run nm-applet
run protonvpn-cli c -f -p udp
