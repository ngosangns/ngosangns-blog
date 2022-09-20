<script setup>
const props = defineProps(['src'])
</script>
<template lang="pug">
img(:data-src="props.src" class="svg" width="16px" height="16px")
</template>