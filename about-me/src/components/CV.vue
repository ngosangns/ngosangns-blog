<script setup>
import { ref, onMounted } from "vue";

const emit = defineEmits(['back', 'mounted']);

onMounted(() => {
  emit("mounted");
});

const cv = {
  en: {},
  vi: {
    name: 'Ngô Quang Sang',
    position: 'Software Developer',
    widgets: {}
  }
}

const lang = ref('vi')

</script>
<template lang="pug">
.cv
  .cv-container
    .cv-header
      span.back(@click="emit('back')")
        img.svg(data-src="./svg/back.svg")
        | Back
    .heading1 {{cv[lang].name}}
    .heading3
      | {{cv[lang].position}}
    hr
    .cv-widget-container
      .cv-widget
        h3 
</template>
<style scoped>
.cv {
  position: absolute;
  top: 0;
  left: 0;
  width: calc(100vw - 12vw);
  min-height: 100vh;
  background-color: rgb(29, 30, 32);
  z-index: 2;
  padding: 6vw;
}

.cv-container {
  max-width: calc(1024px * 1.5);
}

.heading1 {
  font-size: 3rem;
  line-height: 5rem;
}

.heading2 {
  font-size: 2rem;
  line-height: 3.5rem;
}

.heading3 {
  font-size: 1.5rem;
  line-height: 3rem;
}

.cv-header {
  margin-bottom: 1rem;
}

.back {
  cursor: pointer;
}

.back .svg {
  margin-right: .5rem;
}

.cv-widget-container {}

.cv-widget {}
</style>