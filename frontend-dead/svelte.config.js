import adapter from '@sveltejs/adapter-auto';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import autoprefixer from 'autoprefixer';
import tailwind from 'tailwindcss'

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: vitePreprocess({
		postcss: {
			plugins: [
				tailwind,
				autoprefixer
			]
		}
}),

	kit: {
		adapter: adapter()
	}
};

export default config;
