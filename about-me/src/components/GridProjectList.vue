<script setup>
const props = defineProps(["group"]);
</script>

<template lang="pug">
.grid-1
  .full(v-if="group.type == 'project'")
    h3
      img.svg(:data-src="group.icon")
      | &nbsp;{{ props.group.name }}
    .grid-2
      li(v-for="item of props.group.items")
        a(:href="item.link", target="_blank")
          img(:data-src="item.image", :alt="item.name")
          span {{ item.name }}
          small {{ item.desc }}
  .full(v-if="props.group.type == 'social'")
    h3
      img.svg(:data-src="props.group.icon")
      | &nbsp;{{ props.group.name }}
    .grid-2
      li(v-for="item of props.group.items")
        a(:href="item.link", target="_blank")
          span {{ item.name }}
  .full(v-else)
</template>