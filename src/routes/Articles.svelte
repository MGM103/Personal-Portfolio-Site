<script>
	import ContentCard from './ContentCard.svelte';
	import { ArticlesData } from '$lib';

	// METHODS
	function getDisplayArticles() {
		const numArticlesToDisplay = 3;
		return ArticlesData.articles.slice(0, numArticlesToDisplay);
	}
</script>

<div class="content-card stack">
	{#each getDisplayArticles() as article, i}
		<ContentCard
			id={`article-${i + 1}`}
			title={article.title}
			description={article.description}
			link={article.link}
		/>
	{/each}
	<div class="articles-title-row">
		<h3>Articles</h3>
		<a
			href="https://mirror.xyz/0x194541D1009d22f7aE586c3AAeF4273B5aA79596"
			target="_blank"
			class="text-link"
			>View all articles<svg
				xmlns="http://www.w3.org/2000/svg"
				height="20px"
				viewBox="0 -960 960 960"
				width="20px"
				fill="currentColor"><path d="M522-480 333-669l51-51 240 240-240 240-51-51 189-189Z" /></svg
			></a
		>
	</div>
</div>

<style scoped lang="scss">
	.stack {
		display: grid;
		overflow: visible;
		width: 100%;

		.articles-title-row {
			align-items: flex-end;
			display: flex;
			justify-content: space-between;
			margin-top: 2.5rem;

			h3 {
				margin-bottom: 0;
			}

			a {
				align-items: center;
				display: flex;
			}
		}

		@media (min-width: 768px) {
			&:hover {
				:global(#article-1) {
					transform: rotate(-1deg);
				}
				:global(#article-2) {
					transform: rotate(-25deg) translate(-150px, -75px);
				}
				:global(#article-3) {
					transform: rotate(-38deg) translate(-290px, -155px);
				}
			}
		}
	}

	.stack :global(article) {
		grid-area: 1/1;
		width: 300px;
		margin-inline: auto;

		@media (max-width: 450px) {
			min-width: unset;
			width: 100%;
		}
	}

	:global(#article-1) {
		z-index: 2;
	}

	:global(#article-2) {
		transition: transform 0.2s ease;
		transform: rotate(-4deg) translateY(0px);
		z-index: 1;

		@media (max-width: 375px) {
			display: none;
		}
	}

	:global(#article-3) {
		transition: transform 0.2s ease;
		transform: rotate(-8deg) translateY(0px);
		z-index: 0;

		@media (max-width: 375px) {
			display: none;
		}
	}
</style>
