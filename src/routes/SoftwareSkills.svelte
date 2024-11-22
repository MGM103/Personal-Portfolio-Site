<script>
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

<div class="content-card software-skills">
	<div class="content-container">
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
	.software-skills {
		.content-container {
			padding: 2rem;
		}

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
