<script>
	import { onMount } from 'svelte';
	import { BLOG_URL, GITHUB_URL, LINKEDIN_URL, RESUME_URL, SECURITY_PORTFOLIO_URL } from '$lib';
	import { GitHubSvg, LinkedInSvg, ResumeSvg } from '$lib/assets';

	// STATE VARS
	let greetingWave = $state(false);

	// LIFECYCLE
	onMount(() => {
		greetingAnimation();
	});

	// METHODS
	function greetingAnimation() {
		const greetingElements = document.getElementById('greeting').querySelectorAll('span');

		greetingElements.forEach((span, index) => {
			setTimeout(() => {
				if (index < greetingElements.length - 1) {
					span.style.transition = 'color 0.15s ease';
					span.style.color = 'var(--accent)';

					if (index < greetingElements.length - 2) {
						setTimeout(() => {
							span.style.color = 'unset';
						}, 500);
					}
				}
			}, 500 * index);
		});

		setTimeout(() => {
			greetingWave = true;
		}, 2000);
	}
</script>

<svelte:head>
	<link rel="preload" href="/images/cv_cropped_photo.webp" as="image" type="image/webp" />
	<link rel="preload" href="/images/cv_cropped_photo.jpg" as="image" type="image/jpeg" />
</svelte:head>

<div class="content-card">
	<div class="bio-top-row">
		<h1>Bio</h1>
		<div class="bio-links">
			<a href={GITHUB_URL} target="_blank" title="GitHub"><GitHubSvg /></a>
			<a href={LINKEDIN_URL} target="_blank" title="LinkedIn"><LinkedInSvg /></a>
			<a href={RESUME_URL} target="_blank" title="Résumé"><ResumeSvg /></a>
		</div>
	</div>
	<div class="bio-second-row">
		<picture>
			<source srcset="/images/cv_cropped_photo.webp" type="image/webp" />
			<source srcset="/images/cv_cropped_photo.jpg" type="image/jpeg" />
			<img id="bio-head-shot" src="/images/cv_cropped_photo.jpg" alt="head shot" />
		</picture>
		<div class="bio-content">
			<h2 id="greeting">
				<span>Hi</span> <span>there</span>, <span>I'm</span> <span>Marcus</span>
				<span id="greeting-wave" class={greetingWave ? 'wave' : ''}>👋</span>
			</h2>
			<p>Welcome to my personal site!</p>
			<p>
				I'm a software engineer specialising in full-stack development. This site showcases my
				latest <a href={GITHUB_URL} class="text-link" target="_blank">projects</a>, all my
				<a href={BLOG_URL} class="text-link" target="_blank">technical writing</a>
				and my progress as an independent
				<a href={SECURITY_PORTFOLIO_URL} class="text-link" target="_blank">security researcher</a>.
			</p>
			<p>
				Should my skills or previous experience align with a position you are looking to fill, or if
				you would like to discuss a potential project, please feel free to contact me via
				<a href="mailto:marcus.marinelli3@gmail.com?subject=Work%20Enquiry" class="text-link"
					>email</a
				>.
			</p>
		</div>
	</div>
</div>

<style scoped lang="scss">
	.content-card {
		width: 100%;
	}

	.bio-top-row {
		align-items: center;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-bottom: 1rem;

		.bio-links {
			align-items: center;
			display: flex;
			gap: 0.5rem;
			justify-content: center;
			width: max-content;
		}
	}

	.bio-second-row {
		align-items: flex-start;
		box-sizing: border-box;
		display: flex;
		gap: 4rem;
		justify-content: left;

		@media (max-width: 768px) {
			flex-direction: column;
			gap: 2rem;

			img {
				display: none;
			}
		}

		@media (min-width: 768px) and (max-width: 850px) {
			picture {
				flex: 1;
			}

			.bio-content {
				flex: 1;
			}
		}
	}

	#greeting-wave {
		display: inline-block;
	}

	#bio-head-shot {
		border-radius: 16px;
		max-height: 250px;
		max-width: 250px;

		@media (min-width: 768px) and (max-width: 850px) {
			max-height: 100%;
			max-width: 100%;
			object-fit: contain;
		}
	}
</style>
