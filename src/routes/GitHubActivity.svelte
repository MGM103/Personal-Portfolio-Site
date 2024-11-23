<script>
	import { onMount } from 'svelte';

	// PROPS
	let { activityData } = $props();

	// CONSTANTS
	const DAYS_IN_WEEK = 7;
	const WEEKS_IN_YEAR = 52;

	// LIFECYCLE
	onMount(() => {
		const contributionsData = activityData.data;

		createGitHubActivityGraph(contributionsData);
	});

	// METHODS
	function createGitHubActivityGraph(contributions) {
		const activityGraph = document.getElementById('activity-graph-content');
		const weeklyContributions = contributions.weeks;

		for (let dayOfWeek = 0; dayOfWeek < DAYS_IN_WEEK; dayOfWeek++) {
			const graphRow = document.createElement('tr');

			for (let weekOfYear = 0; weekOfYear < WEEKS_IN_YEAR; weekOfYear++) {
				const week = weeklyContributions[weekOfYear];
				const day = week.contributionDays[dayOfWeek];
				const contributionsInDay = day ? day.contributionCount : 0;

				const td = document.createElement('td');
				td.style.height = '10px';
				td.style.width = '10px';
				td.style.borderRadius = '2px';
				td.title = `${contributionsInDay} contributions`;

				if (contributionsInDay == 0) {
					td.style.backgroundColor = 'var(--gh-no-activity)';
				} else if (contributionsInDay <= 2) {
					td.style.backgroundColor = 'var(--gh-low-activity)';
				} else if (contributionsInDay <= 5) {
					td.style.backgroundColor = 'var(--gh-med-activity)';
				} else if (contributionsInDay <= 7) {
					td.style.backgroundColor = 'var(--gh-high-activity)';
				} else {
					td.style.backgroundColor = 'var(--gh-max-activity)';
				}
				graphRow.appendChild(td);
			}

			activityGraph.appendChild(graphRow);
			activityGraph.style.opacity = 1;
		}
	}
</script>

<div class="content-card gh-activity-container">
	<div class="gh-activity-heading">
		<h3>GitHub Activity</h3>
		<a href="https://github.com/MGM103" target="_blank" class="text-link">view profile</a>
	</div>
	<div class="gh-activity-content">
		<p>Yearly contributions: <span>{activityData.data.totalContributions}</span></p>
		<div class="table-wrapper">
			<table id="activity-graph">
				<tbody id="activity-graph-content"></tbody>
			</table>
		</div>
	</div>
</div>

<style lang="scss">
	.gh-activity-container {
		display: flex;
		flex-direction: column;
		max-width: fit-content;
		overflow: hidden;
		width: 100%;

		.gh-activity-heading {
			align-items: center;
			display: flex;
			justify-content: space-between;
			margin-bottom: 1rem;
			width: 100%;

			h3 {
				margin: 0;
			}
		}

		.gh-activity-content {
			span {
				color: var(--accent);
				font-weight: 500;
			}

			.table-wrapper {
				overflow-x: auto;
				padding-bottom: 0.5rem;
				width: 100%;

				table {
					border-collapse: separate;
					border-spacing: 4px;
					width: max-content;
				}
			}
		}
	}
</style>
