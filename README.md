# akamai-essl-staging
Bash script to quickly look up and change your /etc/hosts file to the Akamai staging network.

## Usage
The script uses `dig`, `awk`, and `sed` to get the Akamai staging IPs for the given hostnames. These are all tools that are installed by default on MacOS and Unix terminals.

`sudo` is required because we are making changes to the `/etc/hosts`. A backup is created and restored when the script finishes.

Example:
```
sudo zsh akamai_essl.zsh www.example.com www-2.example.com
```

This is output the following:
```
➜ sudo zsh akamai_essl.zsh www.example.com www-2.example.com
Hosts file updated:
23.218.113.249 www.example.com edgekey-staging
23.218.113.249 www-2.example.com edgekey-staging

Press any key to restore hosts file...Done!
```
