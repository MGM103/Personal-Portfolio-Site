<script>
	import Articles from './Articles.svelte';
	import Bio from './Bio.svelte';
	import ContactMe from './ContactMe.svelte';
	import GitHubActivity from './GitHubActivity.svelte';
	import Projects from './Projects.svelte';
	import SecurityResearch from './SecurityResearch.svelte';
	import SoftwareSkills from './SoftwareSkills.svelte';

	// PROPS
	let { data } = $props();
</script>

<div class="home-container">
	<Bio />
	<div class="home-content">
		<SoftwareSkills />
		<GitHubActivity activityData={data} />
		<Projects />
		<SecurityResearch />
		<Articles />
		<ContactMe />
	</div>
</div>

<style scoped lang="scss">
	.home-container {
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		margin-block: 2rem;
		margin-inline: auto;
		max-width: 1370px;
		padding-inline: 2rem;

		@media (max-width: 400px) {
			padding-inline: 1.5rem;
		}
	}

	.home-content {
		display: grid;
		gap: 2rem;
		grid-template-columns: repeat(3, minmax(0, 1fr));

		@media (min-width: 768px) {
			:global(.software-skills) {
				grid-column: span 1;
				grid-row: span 2;
			}

			:global(.gh-activity-container) {
				grid-column: span 2;
			}

			:global(.stack) {
				grid-column: span 2;
				grid-row: span 2;
			}

			:global(.projects-container) {
				grid-column: span 2;
			}

			:global(#security-research) {
				grid-row: span 1;
			}

			:global(#contact-me) {
				grid-row: span 1;
			}
		}

		@media (max-width: 768px) {
			grid-template-columns: 1fr;
		}
	}
</style>
