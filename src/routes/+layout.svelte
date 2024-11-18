<script>
	import '$lib/styles/main.scss';
	import NavBar from './NavBar.svelte';
	let { children } = $props();
</script>

<div class="container">
	<NavBar />
	<main>
		{@render children()}
	</main>
</div>

<style scoped lang="scss">
	.container {
		display: grid;
		grid-template-rows: auto 1fr auto;
		height: 100%;
		margin-inline: auto;
		max-inline-size: 1080px;
		padding-inline: 2rem;
	}
</style>
