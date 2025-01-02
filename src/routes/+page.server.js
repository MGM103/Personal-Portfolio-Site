import { GITHUB_PAT } from '$env/static/private';
import { error } from '@sveltejs/kit';

export async function load() {
	const today = new Date();
	const lastYear = new Date();
	lastYear.setFullYear(today.getFullYear() - 1);

	const toDate = today.toISOString();
	const fromDate = lastYear.toISOString();

	console.log(`From: ${fromDate}\nTo: ${toDate}`);

	const query = `
        query {
            user(login: "mgm103") {
                contributionsCollection(from: "${fromDate}", to: "${toDate}") {
                    contributionCalendar {
                        totalContributions
                        weeks {
                            contributionDays {
                                date
                                contributionCount
                            }
                        }
                    }
                }
            }
        }
    `;

	const response = await fetchGitHubGraphQLData(query);
	const data = response.data.user.contributionsCollection.contributionCalendar;
	console.log(data.weeks[51]);

	return {
		data
	};
}

async function fetchGitHubGraphQLData(query) {
	const endpoint = 'https://api.github.com/graphql';

	try {
		const response = await fetch(endpoint, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json',
				Authorization: `bearer ${GITHUB_PAT}`
			},
			body: JSON.stringify({ query })
		});

		if (response.ok) {
			const json = await response.json();
			return json;
		}

		throw new error('GraphQL fetch failed');
	} catch (e) {
		console.error('Request for GitHub data failed: ', e);
	}
}
