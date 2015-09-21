<template lang="jade">
.container
  h1 {{ title }}
  h2 {{ discripsion }}
  .row
    .col.s12.m6
      .card
        .card-content Card Title
        .card-action
          a(href="#") This is link
          a(href="#") This is link
          a(href="#")
            i.material-icons add
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
