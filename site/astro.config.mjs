// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	integrations: [
		starlight({
			title: 'Azure Migration Workshop',
			social: [{ icon: 'github', label: 'GitHub', href: 'https://github.com/yourorg/microhack-azure-migrate' }],
			sidebar: [
				{ label: 'Getting Started', autogenerate: { directory: 'getting-started' } },
				{ label: 'Challenges', autogenerate: { directory: 'challenges' } },
				{ label: 'Guides', autogenerate: { directory: 'guides' } },
				{ label: 'Reference', autogenerate: { directory: 'reference' } },
				{ label: 'About', autogenerate: { directory: 'about' } },
			],
		}),
	],
});
