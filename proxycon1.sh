#!/bin/bash
rm -f /etc/apt/apt.conf
http=$(kdialog --title "Proxy Configrator" --inputbox "Enter the HTTP PROXY HOSTNAME" 8 40)
httpport=$(kdialog --title "Proxy Configrator" --inputbox "Enter the HTTP PROXY PORT" 8 40)
https=$(kdialog --title "Proxy Configrator" --inputbox "Enter the HTTPS PROXY HOSTNAME" 8 40)
httpsport=$(kdialog --title "Proxy Configrator" --inputbox "Enter the HTTPS PROXY PORT" 8 40)
username=$(kdialog --title "Proxy Configrator" --inputbox "Enter the User Name " 8 40)
password=$(kdialog --title "Proxy Configrator" --inputbox "Enter the Password to Login" 8 40)
HTTP_PROXY_HOST="$http"
HTTP_PROXY_PORT="$httpport"
HTTPS_PROXY_HOST="$https"
HTTPS_PROXY_PORT="$httpsport"
USER_ID="$username"
PASSWORD="$password"
gsettings set org.gnome.system.proxy mode manual
gsettings set org.gnome.system.proxy.http host "$HTTP_PROXY_HOST"
gsettings set org.gnome.system.proxy.http port "$HTTP_PROXY_PORT"
gsettings set org.gnome.system.proxy.https host "$HTTPS_PROXY_HOST"
gsettings set org.gnome.system.proxy.https port "$HTTPS_PROXY_PORT"

sudo sed -i.bak '/http[s]::proxy/Id' /etc/apt/apt.conf
sudo tee -a /etc/apt/apt.conf <<EOF
Acquire::http::proxy "http://$USER_ID:$PASSWORD@$HTTP_PROXY_HOST:$HTTP_PROXY_PORT/";
Acquire::https::proxy "http://$USER_ID:$PASSWORD@$HTTPS_PROXY_HOST:$HTTPS_PROXY_PORT/";
EOF

sudo sed -i.bak '/http[s]_proxy/Id' /etc/environment
sudo tee -a /etc/environment <<EOF
http_proxy="http://$USER_ID:$PASSWORD@$HTTPS_PROXY_HOST:$HTTPS_PROXY_PORT/"
https_proxy="http://$USER_ID:$PASSWORD@$HTTPS_PROXY_HOST:$HTTPS_PROXY_PORT/"
