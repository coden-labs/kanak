<script lang="ts">
    import '../app.postcss';
    import Nav from '$lib/components/Nav.svelte';
    import Footer from '$lib/components/Footer.svelte';
</script>

<Nav />
<slot />
<Footer />
