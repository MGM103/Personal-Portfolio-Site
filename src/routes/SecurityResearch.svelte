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

<div id="security-research" class="content-card">
	<h3>Security</h3>
	<div class="security-content">
		<p id="total-comps">
			Total competitions: <span id="num-comps">{SecurityReviews.totalCompetitions}</span>
		</p>
		<div class="vulnerabilities">
			<div class="vulnerability-category">
				<p><span id="high">{getTotalHighsFound()}</span></p>
				<h4>High</h4>
			</div>
			<div class="vulnerability-category">
				<p><span id="medium">{getTotalMediumsFound()}</span></p>
				<h4>Med</h4>
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
	#security-research {
		width: 100%;
	}

	.security-content {
		#total-comps {
			white-space: nowrap;
		}

		#num-comps {
			color: var(--accent);
			font-weight: 500;
		}

		.vulnerabilities {
			align-items: center;
			display: flex;
			justify-items: center;
			margin-block: 2rem;
			text-align: center;

			@media (min-width: 768px) and (max-width: 920px) {
				flex-wrap: wrap;

				& > div {
					border-left: none !important;
				}
			}

			@media (max-width: 550px) {
				flex-direction: column;
			}

			.vulnerability-category {
				border-left: 1px solid var(--shadow-1);
				box-sizing: border-box;
				padding-inline: 2rem;
				width: 100%;

				&:first-child {
					border-left: none;
				}

				&:last-child {
					@media (min-width: 768px) and (max-width: 1280px) {
						display: none;
					}
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

				@media (max-width: 550px) {
					border-bottom: 1px solid var(--shadow-1);
					border-left: unset;
					padding-block: 0.5rem;
					padding-inline: 1rem;

					&:last-child {
						border-bottom: none;
					}
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
