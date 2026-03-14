// @ts-check
import { defineConfig } from 'astro/config';
import starlight from '@astrojs/starlight';

// https://astro.build/config
export default defineConfig({
	site: 'https://jonathan-vella.github.io',
	base: '/microhack-azure-migrate',
	integrations: [
		starlight({
			title: 'Azure Migration Workshop',
			logo: {
				src: './public/images/logo.svg',
			},
			social: [
				{
					icon: 'github',
					label: 'GitHub',
					href: 'https://github.com/jonathan-vella/microhack-azure-migrate',
				},
			],
			sidebar: [
				{
					label: 'Getting Started',
					autogenerate: { directory: 'getting-started' },
				},
				{
					label: 'Challenges',
					autogenerate: { directory: 'challenges' },
				},
				{
					label: 'Guides',
					autogenerate: { directory: 'guides' },
				},
				{
					label: 'Reference',
					autogenerate: { directory: 'reference' },
				},
				{
					label: 'About',
					autogenerate: { directory: 'about' },
				},
			],
			customCss: ['./src/styles/custom.css'],
		}),
	],
});
