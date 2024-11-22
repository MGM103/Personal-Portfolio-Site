<script>
	import { BioImg, GitHubSvg, LinkedInSvg, ResumeSvg } from '$lib/assets';
</script>

<div class="content-card">
	<div class="content-container">
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
			<img id="bio-head-shot" src={BioImg} alt="head shot" />
			<div class="bio-content">
				<h2>Hi there, I'm <span>Marcus👋</span></h2>
				<p>Welcome to my personal site!</p>
				<p>
					I'm a software engineer specialising in full-stack development. This site showcases my
					latest <a href="/projects" class="text-link">projects</a>, all my
					<a href="/blog" class="text-link">technical writing</a>
					and my progress as an independent
					<a href="/security" class="text-link">security researcher</a>.
				</p>
				<p>
					Should my skills or previous experience align with a position you are looking to fill, or
					if you would like to discuss a potential project, please feel free to contact me via
					<a href="mailto:marcus.marinelli3@gmail.com?subject=Work%20Enquiry" class="text-link"
						>email</a
					>.
				</p>
			</div>
		</div>
	</div>
</div>

<style scoped lang="scss">
	.content-container {
		padding: 2rem;
	}

	.bio-top-row {
		align-items: center;
		display: flex;
		flex-direction: row;
		justify-content: space-between;
		margin-bottom: 2rem;

		h1 {
			margin: 0;
		}

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

		@media (max-width: 680px) {
			flex-direction: column;
			gap: 2rem;
		}

		.bio-content {
			h2 {
				margin-top: 0;

				span {
					color: var(--accent);
				}
			}
		}
	}

	#bio-head-shot {
		border-radius: 16px;
		max-height: 250px;
		max-width: 250px;
	}
</style>
