<script>
	import { ProjectsData } from '$lib';
	import { onMount } from 'svelte';
	import ContentCard from './ContentCard.svelte';
	import { fade } from 'svelte/transition';

	// STATE VARS
	let showPrevBtn = $state(false);
	let showNextBtn = $state(true);

	// ELEMENTS
	let projectsCarousel;

	// CONSTANTS
	const WIDTH_PROJECT_CARD = 300;

	// LIFECYCLE
	onMount(() => {
		projectsCarousel.addEventListener('scroll', checkScroll);
		checkScroll();

		return () => {
			projectsCarousel.removeEventListener('scroll', checkScroll);
		};
	});

	// METHODS
	const checkScroll = () => {
		const maxScroll = projectsCarousel.scrollWidth - projectsCarousel.clientWidth;

		showPrevBtn = projectsCarousel.scrollLeft >= WIDTH_PROJECT_CARD;
		showNextBtn = projectsCarousel.scrollLeft < maxScroll;
	};

	function scrollProjects(scrollDistance) {
		const projectsWrapper = document.querySelector('.projects-wrapper');
		projectsWrapper.scrollBy({ left: scrollDistance, behavior: 'smooth' });
	}
</script>

<div class="content-card projects-container">
	<h3>Projects</h3>
	<div class="projects-wrapper" bind:this={projectsCarousel}>
		{#each ProjectsData.projects as project}
			<ContentCard
				title={project.title}
				subTitle={project.subtitle}
				description={project.description}
				link={project.link}
			/>
		{/each}
	</div>
	{#if showPrevBtn}
		<button
			id="prev-project-btn"
			class="project-pagination-btn"
			onclick={() => scrollProjects(-300)}
			aria-label="previous-project-button"
			transition:fade={{ duration: 500 }}
			><svg
				xmlns="http://www.w3.org/2000/svg"
				height="48px"
				viewBox="0 -960 960 960"
				width="48px"
				fill="currentColor"><path d="M561-240 320-481l241-241 43 43-198 198 198 198-43 43Z" /></svg
			></button
		>
	{/if}
	{#if showNextBtn}
		<button
			id="next-project-btn"
			class="project-pagination-btn"
			onclick={() => scrollProjects(300)}
			aria-label="next-project-button"
			transition:fade={{ duration: 500 }}
		>
			<svg
				xmlns="http://www.w3.org/2000/svg"
				height="48px"
				viewBox="0 -960 960 960"
				width="48px"
				fill="currentColor"><path d="M530-481 332-679l43-43 241 241-241 241-43-43 198-198Z" /></svg
			>
		</button>
	{/if}
</div>

<style scoped lang="scss">
	.projects-container {
		overflow-x: hidden;
		position: relative;
		width: 100%;

		.projects-wrapper {
			align-items: stretch;
			display: flex;
			gap: 1.5rem;
			overflow-x: auto;
			scrollbar-width: none;
			scroll-snap-type: x mandatory;
		}

		.projects-wrapper::-webkit-scrollbar {
			display: none;
		}

		.project-pagination-btn {
			border: none;
			background-color: var(--shadow-1);
			border-radius: 50%;
			color: var(--secondary);
			cursor: pointer;
		}

		#prev-project-btn {
			left: 0;
			position: absolute;
			top: 50%;
		}

		#next-project-btn {
			position: absolute;
			right: 0;
			top: 50%;
		}
	}
</style>
