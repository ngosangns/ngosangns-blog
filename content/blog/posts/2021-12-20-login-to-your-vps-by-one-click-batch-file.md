---
title: "Login to your server by one click batch file"
date: 2021-12-20T00:00:00+07:00
tags: ['vps']
---
- Prepare your SSH account.
- Install PuTTY on your client (make sure `C:\Program Files\PuTTY` has added to environment variables).
- Create a new batch file with the following content:

```batch
@start /b putty <username>@<host> -pw <password>
```

- Replace `<username>`, `<host>` and `<password>` with your account credential.
- Execute the batch file and enjoy.