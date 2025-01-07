<script>
	import { onMount } from 'svelte';
	import { fade } from 'svelte/transition';
	import { BLOG_URL, GITHUB_URL, RESUME_URL, SECURITY_PORTFOLIO_URL } from '$lib';
	import { DarkThemeSvg, HamburgerMenuSvg, LightThemeSvg } from '$lib/assets';
	import { error } from '@sveltejs/kit';

	// STATE VARS
	let showMobileMenu = $state(false);
	let screenSize = $state(0);
	let buttonTheme = $state(null);
	let mobileMenuEventAdded = $state(false);

	// LIFECYCLE LOGIC
	onMount(() => {
		buttonTheme = getTheme();
		window.addEventListener('resize', updateScreenSize);

		updateScreenSize();

		return () => {
			window.removeEventListener('resize', updateScreenSize);
		};
	});

	// COMPUTED VARS
	let displayLinks = $derived(screenSize > 768 || showMobileMenu);

	// EFFECTS
	$effect(() => {
		if (showMobileMenu) {
			document.addEventListener('click', handleOffClick);
			mobileMenuEventAdded = true;
		}

		if (!showMobileMenu && mobileMenuEventAdded) {
			document.removeEventListener('click', handleOffClick);
			mobileMenuEventAdded = false;
		}
	});

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

	function handleOffClick(e) {
		const mobileMenu = document.querySelector('.links-container');
		const menuBtn = document.querySelector('.mobile-menu-btn');

		if (mobileMenu && !mobileMenu.contains(e.target) && !menuBtn.contains(e.target)) {
			showMobileMenu = false;
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
</script>

<nav>
	<div class="logo">
		<a href="/">
			<span>Marcus</span>
			<span>Marinelli</span>
		</a>
	</div>
	{#if displayLinks}
		<div class="links-container" in:fade>
			<ul>
				<li>
					<a href={BLOG_URL} class="nav-link">Blog</a>
				</li>
				<li><a href={GITHUB_URL} class="nav-link">Projects</a></li>
				<li><a href={SECURITY_PORTFOLIO_URL} class="nav-link">Security</a></li>
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
				<a href={RESUME_URL} target="_blank" class="accented-btn-link">Résumé</a>
			</div>
		</div>
	{/if}
	<button
		class="mobile-menu-btn"
		onclick={() => {
			toggleMobileMenu();
		}}><HamburgerMenuSvg /></button
	>
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
		max-width: 1370px;
		padding-block: 1rem;
		padding-inline: 2rem;
		position: sticky;
		overflow-x: hidden;
		top: 0;
		width: 100%;
		z-index: 4;

		@media (max-width: 768px) {
			overflow-x: unset;
		}

		ul {
			align-items: center;
			display: flex;
			gap: 2.5rem;
			position: relative;
			z-index: 3;

			@media (max-width: 768px) {
				flex-direction: column;
				gap: 1.5rem;
				padding: 0.5rem;
			}
		}

		&::before {
			content: '';
			background-color: var(--surface-1);
			height: 100%;
			top: 0;
			left: 50%;
			position: absolute;
			transform: translateX(-50%);
			transition: box-shadow 0.5s ease;
			width: 100vw;
			z-index: 3;
		}
	}

	.mobile-menu-btn {
		background-color: transparent;
		border: none;
		display: none;
		z-index: 3;

		&:hover {
			cursor: pointer;
		}

		@media (max-width: 768px) {
			display: inline-block;
		}
	}

	.logo {
		z-index: 4;

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
			right: 1rem;
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
				z-index: 2;
			}
		}
	}

	.btn-group {
		align-items: center;
		display: flex;
		gap: 2rem;
		justify-content: center;
		z-index: 4;

		@media (max-width: 768px) {
			flex-direction: column;
			gap: 1.25rem;
		}
	}
</style>
