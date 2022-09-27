<script setup>
const props = defineProps(["display"]);
</script>
<style scoped>
.cv {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  min-height: 100vh;
  background-color: rgb(29, 30, 32);
  z-index: 2;
  padding: 6vw;
}
.heading1 {
  font-size: 3rem;
  line-height: 4rem;
}
.heading2 {
  font-size: 2rem;
  line-height: 3rem;
}
.heading3 {
  font-size: 1.5rem;
  line-height: 2.5rem;
}
</style>
<template lang="pug">
.cv(v-if="props.display")
  .heading1 Quang Sang Ngo
  .heading3
    | Software Developer
</template>