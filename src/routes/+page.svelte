<script>
	import { BioImg, GitHubSvg, LinkedInSvg, ResumeSvg } from '$lib/assets';
	import {
		AngularSvg,
		AzureCloudSvg,
		AzureDevOpsSvg,
		ClangSvg,
		CSharpSvg,
		CSSSvg,
		DockerSvg,
		GitHubActionsSvg,
		GolangSvg,
		HTML5Svg,
		JavaScriptSvg,
		JavaSvg,
		JenkinsSvg,
		KubernetesSvg,
		MongodbSvg,
		NextSvg,
		NginxSvg,
		NodeSvg,
		PostgresSvg,
		PysparkSvg,
		PythonSvg,
		ReactSvg,
		RustSvg,
		SoliditySvg,
		SqliteSvg,
		SqlSvg,
		SvelteSvg,
		TypeScriptSvg,
		VueSvg
	} from '$lib/assets';
</script>

<div class="home-container">
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
				<a href="/" title="Résumé"><ResumeSvg /></a>
			</div>
		</div>
		<div class="bio-second-row">
			<img id="bio-head-shot" src={BioImg} alt="head shot" />
			<div class="bio-content">
				<h2>Hi there, I'm <span>Marcus👋</span></h2>
				<p>Welcome to my personal site!</p>
				<p>
					I'm a software engineer specialising in full-stack development. This site showcases my
					latest <a href="/projects">projects</a>, all my <a href="/blog">technical writing</a> and
					my progress as an independent <a href="/security">security researcher</a>.
				</p>
				<p>
					Should my skills or previous experience align with a position you are looking to fill, or
					if you would like to discuss a potential project, please feel free to contact me via
					<a href="mailto:marcus.marinelli3@gmail.com?subject=Work%20Enquiry">email</a>.
				</p>
			</div>
		</div>
	</div>
	<div class="content-card software-skills">
		<h3>Software Skill-set</h3>
		<h4>Programming Languages</h4>
		<div id="programming-languages">
			<div class="row">
				<GolangSvg />
				<JavaScriptSvg />
				<TypeScriptSvg />
				<JavaSvg />
				<SoliditySvg />
			</div>
			<div class="row">
				<HTML5Svg />
				<CSSSvg />
				<ClangSvg />
				<CSharpSvg />
				<RustSvg />
			</div>
		</div>
		<h4>JS Front-end Frameworks & Runtimes</h4>
		<div class="row">
			<ReactSvg />
			<VueSvg />
			<SvelteSvg />
			<NextSvg />
			<AngularSvg />
			<NodeSvg />
		</div>
		<h4>Cloud & DevOps</h4>
		<div class="row">
			<AzureCloudSvg />
			<AzureDevOpsSvg />
			<DockerSvg />
			<GitHubActionsSvg />
			<JenkinsSvg />
			<KubernetesSvg />
			<NginxSvg />
		</div>
		<h4>Data</h4>
		<div class="row">
			<PostgresSvg />
			<SqlSvg />
			<SqliteSvg />
			<MongodbSvg />
			<PysparkSvg />
		</div>
	</div>
</div>

<style scoped lang="scss">
	.home-container {
		margin-block: 2rem;
	}

	.content-card {
		background-color: var(--surface-2);
		box-shadow: 0 0px 2px var(--shadow-1);
		border-radius: 8px;
		margin-block: 1rem;
		padding: 2rem;
		width: fit-content;
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

			a {
				display: inline-block;
				text-decoration: none;
				transition: transform 0.15s ease-in;

				&:hover {
					transform: scale(1.025);
				}
			}
		}
	}

	#bio-head-shot {
		border-radius: 16px;
		max-height: 250px;
		max-width: 250px;
	}

	.software-skills {
		h3 {
			margin-top: 0;
		}

		h4 {
			font-size: 0.875rem;
			margin-top: 2rem;
		}

		#programming-languages {
			display: flex;
			flex-direction: column;
			gap: 1rem;
		}

		.row {
			align-items: center;
			display: flex;
			flex-wrap: wrap;
			gap: 0.75rem;
			justify-content: left;
		}
	}
</style>
