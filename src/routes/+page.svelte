<script>
	import Bio from './Bio.svelte';
	import ContactMe from './ContactMe.svelte';
	import GitHubActivity from './GitHubActivity.svelte';
	import SoftwareSkills from './SoftwareSkills.svelte';

	// PROPS
	let { data } = $props();
</script>

<div class="home-container">
	<Bio />
	<GitHubActivity activityData={data} />
	<SoftwareSkills />
	<ContactMe />
</div>

<style scoped lang="scss">
	.home-container {
		box-sizing: border-box;
		display: flex;
		flex-direction: column;
		margin-block: 2rem;
		padding-inline: 2rem;
	}

	// .home-row {
	// 	align-items: flex-start;
	// 	display: flex;
	// 	gap: 2rem;
	// }
</style>
