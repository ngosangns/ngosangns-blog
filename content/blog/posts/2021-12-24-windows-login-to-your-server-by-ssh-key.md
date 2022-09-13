---
title: "[Windows] Login to your server by SSH key"
date: 2021-12-24T00:00:00+07:00
tags: ['linux', 'ssh']
---
Create a user and setup home folder for it  
Create a RSA/ed25519 key pair:

```sh
ssh-keygen
```

Add your private key to local SSH client:

```sh
ssh-add <path to private key>
```

Add your public key to server SSH manager:
-   Login to your server
-   Run a following command:

```sh
echo '<content of public key>' >> /home/<username>/.ssh/authorized_keys
```

Change permission of your account home folder:

```sh
chmod 700 /home/<username>
```

Update /etc/ssh/sshd_config (for root account):

```sh
StrictModes no
```

Login to your server without password!

```sh
ssh <username>@<server host>
```
Enjoy!