---
title: "Alias in Vue with Vite"
date: 2022-02-10T00:00:00+07:00
tags: ["vue", "vite", "javascript"]
---

Setup alias in `vite.config.js`:

```
export default defineConfig({
  resolve: {
    alias: {
      "@": path.resolve(__dirname, "./src"),
    }
  }
});
```

Register the alias in `tsconfig.js`:

```
{
  "compilerOptions": {
    "paths": {
      "@/*": ["./src/*"]
    }
  }
}
```
