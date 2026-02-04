This is a small script that automatically sets up a Shadowsocks server and uses Proxychains to forward traffic through Cloudflare WARP. Intended for use on datacenter VMs running Debian. Not tested anywhere else.

To run:
```
curl -fsSL https://raw.githubusercontent.com/somebudyelse-ka/auto-shadowsocks-warp/refs/heads/main/install.sh | bash
```
Note: during installation, it will probably give this error:

`Failed to start warp-taskbar.service: Unit dbus.socket not found.`

That's normal. Don't worry, everything will still work fine. It's basically installing Cloudflare WARP and attempting to add an icon to the taskbar, but there's no monitor connected to the VM, so it obviously fails.

After installing everything, you will probably want to edit your Shadowsocks configuration to change ports, password, etc.
```
sudo nano /etc/shadowsocks-libev/config.json
```
Tips:
* You will probably want the host to be simply `"0.0.0.0"`
* When you've finished editing everything, you can copy-paste the same configuration file, change the host to the IP of the VM, and use it without much else configuration.

When finished editing, restart Shadowsocks:
```
sudo systemctl restart shadowsocks-libev
```
