<script>
	import { onMount } from 'svelte';
	import '$lib/styles/main.scss';
	import NavBar from './NavBar.svelte';
	import Footer from './Footer.svelte';

	// PROPS
	let { children } = $props();

	// LIFECYCLE
	onMount(() => {
		const theme = localStorage.getItem('theme');

		if (theme === 'dark') {
			document.body.classList.add('dark-theme');
			document.body.classList.remove('light-theme');
		} else if (theme === 'light') {
			document.body.classList.remove('dark-theme');
			document.body.classList.add('light-theme');
		}
	});
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
