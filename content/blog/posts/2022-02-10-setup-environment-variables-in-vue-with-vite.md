---
title: "Setup environment variables in Vue with Vite"
date: 2022-02-10T00:00:00+07:00
tags: ["vite", "vue", "javascript"]
---
Create `.env` and `.env.production` files in the same folder with `vite.config.js`. `.env` use for all the stage, `.env.production` only use for deployment.

Example of `.env` file:

```
BASE_URL=/base/
```

In `vite.config.js` add the following content:

```js
export default defineConfig({
  envDir: './',
  envPrefix: 'VUE_APP_'
});
```

`envPrefix` is the prefix of environment variables that you could share to client. For getting variables in Vue components use `import.meta.env.<var>`.