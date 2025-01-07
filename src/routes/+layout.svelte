<script>
	import '$lib/styles/main.scss';
	import NavBar from './NavBar.svelte';
	import Footer from './Footer.svelte';

	// PROPS
	let { children } = $props();
</script>

<svelte:head>
	<script>
		if (document) {
			let theme = localStorage.getItem('theme');

			if (!theme) {
				theme = window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
			}

			if (theme === 'dark') {
				document.documentElement.classList.add('dark-theme');
				document.documentElement.classList.remove('light-theme');
				localStorage.setItem('theme', 'dark');
			} else {
				document.documentElement.classList.add('light-theme');
				document.documentElement.classList.remove('dark-theme');
				localStorage.setItem('theme', 'light');
			}
		}
	</script>

	<title>Marcus Marinelli Portfolio</title>
</svelte:head>

<div class="container">
	<NavBar />
	<main>
		{@render children()}
	</main>
	<Footer />
</div>

<style scoped lang="scss">
	.container {
		box-sizing: border-box;
		display: grid;
		grid-template-rows: auto 1fr auto;
		height: 100%;
		margin-inline: auto;
		max-width: 100%;
	}
</style>
