---
title: "[Ubuntu] How to add new FTP account to your linux server"
date: 2021-12-24T00:00:00+07:00
tags: ['ftp', 'linux', 'vps']
---
Create a new user:

```sh
sudo adduser <username>
```

Change your user password:

```sh
sudo passwd
```

Add your user to FTP service config:

```sh
vi /etc/vsftpd.conf
# or
vi /etc/vsftpd/user_list
# add your username
# notice the message
```

Login to your FTP server via FileZilla or something else!

Enjoy!