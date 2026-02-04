sudo apt update && sudo apt install -y gnupg2 shadowsocks-libev proxychains4
# Start adapted code from pkg.cloudflareclient.com
curl -fsSL https://pkg.cloudflareclient.com/pubkey.gpg | sudo gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflare-client.list
sudo apt-get update && sudo apt-get install -y cloudflare-warp
# End adapted code
yes | warp-cli registration new
warp-cli mode proxy
warp-cli connect
sudo sed -i 's/\bsocks4\b/socks5/g; s/\b9050\b/40000/g' /etc/proxychains4.conf
sudo sed -i 's|^ExecStart=|ExecStart=/usr/bin/proxychains4 |' /lib/systemd/system/shadowsocks-libev.service
sudo systemctl daemon-reload && sudo systemctl restart shadowsocks-libev
