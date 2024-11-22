<script>
	import { onMount } from 'svelte';
	import { DarkThemeSvg, HamburgerMenuSvg, LightThemeSvg } from '$lib/assets';
	import { error } from '@sveltejs/kit';

	// STATE VARS
	let showMobileMenu = $state(false);
	let screenSize = $state(0);
	let buttonTheme = $state(null);

	// LIFECYCLE LOGIC
	onMount(() => {
		buttonTheme = getTheme();
		window.addEventListener('scroll', updateNavbarShadow);
		window.addEventListener('resize', updateScreenSize);

		updateScreenSize();

		return () => {
			window.removeEventListener('resize', updateScreenSize);
			window.removeEventListener('scroll', updateNavbarShadow);
		};
	});

	// COMPUTED VARS
	let displayLinks = $derived(screenSize > 768 || showMobileMenu);

	// COMPONENT METHODS
	function getTheme() {
		const currentTheme = localStorage.getItem('theme');

		if (currentTheme === 'dark') {
			return 'dark';
		} else if (currentTheme === 'light') {
			return 'light';
		} else if (currentTheme === null) {
			const prefersDarkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
			return prefersDarkMode ? 'dark' : 'light';
		} else {
			throw error('Theme could not be identified');
		}
	}

	function toggleMobileMenu() {
		showMobileMenu = !showMobileMenu;
	}

	function toggleTheme() {
		const isDarkTheme = getTheme() === 'dark';

		if (isDarkTheme) {
			document.body.classList.remove('dark-theme');
			document.body.classList.add('light-theme');
			localStorage.setItem('theme', 'light');
		} else {
			document.body.classList.add('dark-theme');
			document.body.classList.remove('light-theme');
			localStorage.setItem('theme', 'dark');
		}
	}

	function updateScreenSize() {
		screenSize = window.innerWidth;
	}

	let navBar;

	const updateNavbarShadow = () => {
		const scrollTop = window.scrollY;

		if (scrollTop > 0) {
			navBar.style.setProperty('--nav-shadow', '0 -8px 24px var(--secondary)');
		} else {
			navBar.style.setProperty('--nav-shadow', 'none');
		}
	};
</script>

<nav bind:this={navBar}>
	<div class="logo">
		<a href="/">
			<span>Marcus</span>
			<span>Marinelli</span>
		</a>
	</div>
	{#if displayLinks}
		<div class="links-container">
			<ul>
				<li><a href="/blog" class="nav-link">Blog</a></li>
				<li><a href="/projects" class="nav-link">Projects</a></li>
				<li><a href="/security" class="nav-link">Security</a></li>
			</ul>
			<div class="btn-group">
				<button
					class="transparent-btn"
					onclick={() => {
						toggleTheme();
						buttonTheme = getTheme();
					}}
				>
					{#if buttonTheme === 'light'}
						<LightThemeSvg />
					{:else if buttonTheme === 'dark'}
						<DarkThemeSvg />
					{/if}
				</button>
				<a
					href="https://drive.google.com/file/d/1PjX0o2Jo1tCR3rbRnKqOH74kPNhBzD_P/view?usp=sharing"
					target="_blank"
					class="accented-btn-link">Résumé</a
				>
			</div>
		</div>
	{/if}
	<button class="mobile-menu-btn" onclick={() => toggleMobileMenu()}><HamburgerMenuSvg /></button>
</nav>

<style scoped lang="scss">
	@use '@fontsource/press-start-2p';

	nav {
		align-items: center;
		box-sizing: border-box;
		display: flex;
		flex-direction: row;
		gap: 2.5rem;
		justify-content: space-between;
		margin-inline: auto;
		padding-block: 1rem;
		padding-inline: 2rem;
		position: sticky;
		top: 0;
		width: 100%;
		z-index: 1;

		ul {
			align-items: center;
			display: flex;
			gap: 2.5rem;
			position: relative;

			@media (max-width: 768px) {
				flex-direction: column;
				gap: 1.5rem;
				padding: 0.5rem;
			}
		}

		&::before {
			content: '';
			background-color: var(--surface-1);
			box-shadow: var(--nav-shadow);
			height: 100%;
			top: 0;
			left: 50%;
			position: absolute;
			transform: translateX(-50%);
			transition: box-shadow 0.5s ease;
			width: 100vw;
			z-index: 0;
		}
	}

	.mobile-menu-btn {
		background-color: transparent;
		border: none;
		display: none;

		&:hover {
			cursor: pointer;
		}

		@media (max-width: 768px) {
			display: inline-block;
		}
	}

	.logo {
		z-index: 1;

		a {
			color: var(--secondary);
			display: flex;
			flex-direction: column;
			text-decoration: none;
		}

		span {
			font-family: 'Press Start 2P', system-ui;
			font-size: 1.25rem;
			text-align: center;
		}
	}

	.links-container {
		display: contents;

		@media (max-width: 768px) {
			align-items: center;
			display: flex;
			flex-direction: column;
			gap: 1rem;
			justify-content: center;
			margin-top: 0.5rem;
			padding-bottom: 0.5rem;
			padding-inline: 1rem;
			padding-top: 0.25rem;
			position: absolute;
			right: 0;
			top: 100%;
			width: unset;

			&::before {
				background-color: var(--surface-3);
				border-radius: 8px;
				border: 1px solid var(--tertiary);
				content: '';
				height: 100%;
				position: absolute;
				right: 0;
				top: 0;
				width: 100%;
				z-index: -1;
			}
		}
	}

	.btn-group {
		align-items: center;
		display: flex;
		gap: 2rem;
		justify-content: center;
		z-index: 1;

		@media (max-width: 768px) {
			flex-direction: column;
			gap: 1.25rem;
		}
	}
</style>
