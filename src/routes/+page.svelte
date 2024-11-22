<script>
	import Bio from './Bio.svelte';
	import SoftwareSkills from './SoftwareSkills.svelte';
	import GitHubActivity from './GitHubActivity.svelte';

	// PROPS
	let { data } = $props();
</script>

<div class="home-container">
	<Bio />
	<SoftwareSkills />
	<GitHubActivity activityData={data} />
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
