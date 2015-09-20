<style lang="stylus">
#app
  background-color red
  margin 0
  border-image none

  a
    cursor pointer
</style>

<template lang="jade">
div
  h1 {{ title }}
  h2 {{ discripsion }}
</template>

<script lang="babel">
export default {
  data() {
    return {
      title: "TODO",
      discripsion: "やること一覧"
    }
  }
}
</script>
