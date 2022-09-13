---
title: "Fix .gitignore not ignore files"
date: 2021-12-27T00:00:00+07:00
tags: ["Git"]
---

Simply, you need to untracked your files then commit again.

Run the following command at your root project:

```bash
git rm --cached .
```

Commit and push.
