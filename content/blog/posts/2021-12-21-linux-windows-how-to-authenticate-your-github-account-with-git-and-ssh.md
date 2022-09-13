---
title: "[Linux, Windows] How to authenticate your Github account with Git and SSH"
date: 2021-12-21T00:00:00+07:00
tags: ['git', 'linux', 'windows', 'ssh', 'vps']
---
### 1. Create a SSH key pair and add private key to your VPS

You can follow these steps [here](/blog/posts/2021-12-24-windows-login-to-your-server-by-ssh-key).

### 2. Add public key to your Github account or repository

-   Github account: You can add your public key in [here](https://github.com/settings/keys).
-   Repository: In your main repository link, enter Settings → Deploy keys → Add deploy key then add your public key.

### 3. Login to your VPS and clone Github repository by SSH link

### 4. Enable ssh-agent session whenever you need to pull or push your code

In repository root folder, create a new file named _**Makefile**_ and put these lines in it. Make sure you have installed _**make**_:

```makefile
default: |
	eval `ssh-agent -s` # enable ssh-agent session to authenticate by SSH key
	ssh-add <path-to-private-key-file> # add your private key
pull: | default
	git pull
```

### 5. (Optional) You can add identity private key file for domain

Add following content to `~/.ssh/config`:

```
Host github.com
IdentityFile ~/.ssh/<private-key-file-name>
IdentityFile ...
```

That's all, use **_make pull_** in terminal when you need to pull your code.

Enjoy!