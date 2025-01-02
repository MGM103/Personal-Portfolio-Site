<script>
	import { LINKEDIN_URL } from '$lib';
	import { LinkedInSvg } from '$lib/assets';
</script>

<div id="contact-me" class="content-card">
	<h3>Contact Me</h3>
	<div class="contact-me-content">
		<svg
			xmlns="http://www.w3.org/2000/svg"
			height="28px"
			viewBox="0 -960 960 960"
			width="28px"
			fill="currentColor"
			><path
				d="M160-160q-33 0-56.5-23.5T80-240v-480q0-33 23.5-56.5T160-800h640q33 0 56.5 23.5T880-720v480q0 33-23.5 56.5T800-160H160Zm320-280L160-640v400h640v-400L480-440Zm0-80 320-200H160l320 200ZM160-640v-80 480-400Z"
			/></svg
		>
		<a href="mailto:marcus.marinelli3@gmail.com?subject=Work%20Enquiry" class="text-link">
			marcus.marinelli3@gmail.com
		</a>
		<div class="linkedIn">
			<LinkedInSvg />
		</div>
		<a href={LINKEDIN_URL} target="_blank" class="text-link">Marcus Marinelli LinkedIn</a>
	</div>
</div>

<style scoped lang="scss">
	#contact-me {
		height: fit-content;
		width: 100%;
	}

	.contact-me-content {
		align-items: center;
		display: grid;
		grid-template-columns: auto 1fr;
		gap: 1rem;

		@media (max-width: 400px) {
			grid-template-columns: auto;

			:global(svg) {
				display: none;
			}
		}

		a {
			word-wrap: anywhere;
		}

		.linkedIn {
			margin-left: -0.25rem;
		}

		svg {
			color: var(--secondary);
		}
	}
</style>
