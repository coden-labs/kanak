<!--This replaces the standard svelte head with some additions of our own -->
<script lang="ts">
  export let page_title: string;
</script>
<svelte:head>
  <title> {page_title} | kanak.io</title>
</svelte:head>
