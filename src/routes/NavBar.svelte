<script>
	import { onMount } from 'svelte';
	import { HamburgerMenuSvg } from '$lib/assets';

	// STATE VARS
	let showMobileMenu = $state(false);
	let screenSize = $state(0);

	// LIFECYCLE LOGIC
	onMount(() => {
		window.addEventListener('resize', updateScreenSize);

		updateScreenSize();

		return () => {
			window.removeEventListener('resize', updateScreenSize);
		};
	});

	// COMPUTED VARS
	let displayLinks = $derived(screenSize > 768 || showMobileMenu);

	// COMPONENT METHODS
	function toggleMobileMenu() {
		showMobileMenu = !showMobileMenu;
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
		<div class="links-container">
			<ul>
				<li><a href="/blog">Blog</a></li>
				<li><a href="/projects">Projects</a></li>
				<li><a href="/security">Security</a></li>
				<!-- To-do Add theme toggling -->
				<!-- <button>Theme</button> -->
			</ul>
			<button class="resume-btn">Résumé</button>
		</div>
	{/if}
	<button class="mobile-menu-btn" onclick={() => toggleMobileMenu()}><HamburgerMenuSvg /></button>
</nav>

<style scoped lang="scss">
	@use '@fontsource/press-start-2p';

	nav {
		align-items: center;
		display: flex;
		flex-direction: row;
		gap: 2.5rem;
		justify-content: space-between;
		margin-inline: auto;
		padding-block: 1rem;
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

			a {
				color: var(--secondary);
				display: inline-block;
				font-size: 1.125rem;
				font-weight: 500;
				line-height: 1.75rem;
				text-decoration: none;
				transition: transform 0.15s ease-out;

				&:hover {
					transform: scale(1.05);
				}
			}

			button {
				margin-left: auto;
			}
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

	.resume-btn {
		background-color: var(--tertiary);
		border-radius: 6px;
		border: none;
		color: var(--surface-1);
		cursor: pointer;
		font-weight: 550;
		padding: 10px 12px;
		width: 100px;
	}

	.logo {
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
</style>
