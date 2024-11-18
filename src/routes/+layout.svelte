<script>
	import '$lib/styles/main.scss';
	import NavBar from './NavBar.svelte';
	import Footer from './Footer.svelte';
	let { children } = $props();
</script>

<div class="container">
	<NavBar />
	<main>
		{@render children()}
	</main>
	<Footer />
</div>

<style scoped lang="scss">
	.container {
		display: grid;
		grid-template-rows: auto 1fr auto;
		height: 100%;
		margin-inline: auto;
		padding-inline: 2rem;
	}
</style>
