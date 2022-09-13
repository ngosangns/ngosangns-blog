---
title: "Type declaration for Javascript library in Typescript project"
date: 2022-02-10T00:00:00+07:00
tags: ['typescript', 'javascript']
---
Create a new file `<library>.d.ts` in `/src` (replace `<library>` with the library package name).

Add the following content:

```ts
declare module "<library>"
```

In `tsconfig.json`:

```json
{
  "include": ["src/**/*.d.ts"]
}
```