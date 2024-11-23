<script>
	import { SecurityReviews } from '$lib';

	// METHODS
	function getTotalHighsFound() {
		const compData = SecurityReviews.competitionData;

		return compData.reduce((sum, comp) => sum + comp.vulnerabilityDetails.highsFound, 0);
	}

	function getTotalMediumsFound() {
		const compData = SecurityReviews.competitionData;

		return compData.reduce((sum, comp) => sum + comp.vulnerabilityDetails.mediumsFound, 0);
	}

	function getTotalLowsFound() {
		const compData = SecurityReviews.competitionData;

		return compData.reduce((sum, comp) => sum + comp.vulnerabilityDetails.lowsFound, 0);
	}
</script>

<div class="content-card">
	<h3>Security</h3>
	<div class="security-content">
		<p>Total competitions: <span id="total-comps">{SecurityReviews.totalCompetitions}</span></p>
		<div class="vulnerabilities">
			<div class="vulnerability-category">
				<p><span id="high">{getTotalHighsFound()}</span></p>
				<h4>High</h4>
			</div>
			<div class="vulnerability-category">
				<p><span id="medium">{getTotalMediumsFound()}</span></p>
				<h4>Medium</h4>
			</div>
			<div class="vulnerability-category">
				<p><span id="low">{getTotalLowsFound()}</span></p>
				<h4>Low</h4>
			</div>
		</div>
		<a href="https://github.com/MGM103/Security-reviews" target="_blank" class="text-link"
			>View findings
			<svg
				xmlns="http://www.w3.org/2000/svg"
				height="20px"
				viewBox="0 -960 960 960"
				width="20px"
				fill="currentColor"><path d="M522-480 333-669l51-51 240 240-240 240-51-51 189-189Z" /></svg
			>
		</a>
	</div>
</div>

<style scoped lang="scss">
	.security-content {
		#total-comps {
			color: var(--accent);
			font-weight: 500;
		}

		.vulnerabilities {
			align-items: center;
			display: grid;
			grid-template-columns: repeat(3, 1fr);
			justify-items: center;
			margin-block: 2rem;
			text-align: center;

			.vulnerability-category {
				border-right: 1px solid var(--shadow-1);
				box-sizing: border-box;
				padding-inline: 2rem;
				width: 100%;

				&:last-child {
					border-right: none;
				}

				p {
					font-size: 28px;
				}

				#high {
					color: var(--tertiary-hover-dark);
				}

				#medium {
					color: var(--tertiary);
				}

				#low {
					color: var(--tertiary-hover-light);
				}
			}
		}

		a {
			align-items: center;
			display: flex;
			margin-top: 1rem;
		}
	}

	svg {
		color: var(--accent);
	}
</style>
