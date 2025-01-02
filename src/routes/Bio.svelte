<script>
	import { GitHubSvg, LinkedInSvg, ResumeSvg } from '$lib/assets';
</script>

<svelte:head>
	<link rel="preload" href="/images/cv_cropped_photo.webp" as="image" type="image/webp" />
	<link rel="preload" href="/images/cv_cropped_photo.jpg" as="image" type="image/jpeg" />
</svelte:head>

<div class="content-card">
	<div class="bio-top-row">
		<h1>Bio</h1>
		<div class="bio-links">
			<a href="https://github.com/MGM103" target="_blank" title="GitHub"><GitHubSvg /></a>
			<a
				href="https://www.linkedin.com/in/marcus-marinelli-b1a10b1a0/"
				target="_blank"
				title="LinkedIn"><LinkedInSvg /></a
			>
			<a
				href="https://drive.google.com/file/d/1PjX0o2Jo1tCR3rbRnKqOH74kPNhBzD_P/view"
				target="_blank"
				title="Résumé"><ResumeSvg /></a
			>
		</div>
	</div>
	<div class="bio-second-row">
		<picture>
			<source srcset="/images/cv_cropped_photo.webp" type="image/webp" />
			<source srcset="/images/cv_cropped_photo.jpg" type="image/jpeg" />
			<img id="bio-head-shot" src="/images/cv_cropped_photo.jpg" alt="head shot" />
		</picture>
		<div class="bio-content">
			<h2>Hi there, I'm <span>Marcus👋</span></h2>
			<p>Welcome to my personal site!</p>
			<p>
				I'm a software engineer specialising in full-stack development. This site showcases my
				latest <a href="https://github.com/MGM103" class="text-link" target="_blank">projects</a>,
				all my
				<a
					href="https://mirror.xyz/0x194541D1009d22f7aE586c3AAeF4273B5aA79596"
					class="text-link"
					target="_blank">technical writing</a
				>
				and my progress as an independent
				<a href="https://github.com/MGM103/Security-reviews" class="text-link" target="_blank"
					>security researcher</a
				>.
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

		.bio-content {
			h2 {
				span {
					color: var(--accent);
					white-space: nowrap;
				}
			}
		}
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
