<script>
	let { title, subTitle, description, link } = $props();
</script>

<article>
	<section id="cc-thumbnail">
		<h3>{title}</h3>
	</section>
	<section id="cc-about">
		<h4>{subTitle}</h4>
		<p>{description}</p>
		<a href={link} target="_blank" class="accented-btn-link">View</a>
	</section>
</article>

<style scoped lang="scss">
	article {
		background-color: var(--surface-3);
		border: 1px solid var(--shadow-1);
		border-radius: 8px;
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		min-width: 300px;
		scroll-snap-align: start;
	}

	#cc-thumbnail {
		aspect-ratio: 2 / 1;
		align-content: center;
		box-sizing: border-box;
		padding: 2rem;
		position: relative;

		h3 {
			font-size: 1.875rem;
			font-weight: 550;
			line-height: 1.25;
			margin-block: auto;
			text-align: center;
		}
	}

	#cc-about {
		border-top: 1px solid var(--shadow-1);
		box-sizing: border-box;
		display: flex;
		flex: 1 1;
		flex-direction: column;
		padding: 1rem;
		padding-bottom: 2rem;

		h4 {
			margin: 0;
		}

		a {
			margin-top: auto;
			width: fit-content;
		}
	}
</style>
