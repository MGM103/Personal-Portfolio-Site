<nav>
	<div class="logo">
		<span>Marcus</span>
		<span>Marinelli</span>
	</div>
	<ul>
		<li><a href="/projects">Projects</a></li>
		<li><a href="/blog">Blog</a></li>
		<li><a href="/security">Security</a></li>
		<!-- To-do Add theme toggling -->
		<!-- <button>Theme</button> -->
	</ul>
	<button class="resume">Resume</button>
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

			a {
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
		}

		.resume {
			background-color: var(--tertiary);
			border-radius: 6px;
			border: none;
			color: var(--surface-1);
			cursor: pointer;
			font-weight: 550;
			padding: 10px 12px;
			width: 100px;
		}
	}

	.logo {
		display: flex;
		flex-direction: column;

		span {
			font-family: 'Press Start 2P', system-ui;
			font-size: 1.25rem;
			max-width: 250px;
			text-align: center;
		}
	}
</style>
