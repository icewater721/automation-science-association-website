import { defineConfig } from 'astro/config';

export default defineConfig({
  output: 'static',
  site: 'https://icewater721.github.io',
  base: '/automation-science-association-website',
  redirects: {
    '/docs': '/articles',
    '/docs/learning/basic-tools/vscode': '/articles/vscode',
    '/docs/learning/basic-tools/git-github': '/articles/git-github',
    '/docs/learning/basic-tools/cmake': '/articles/cmake',
    '/docs/learning/basic-tools/containers': '/articles/containers',
    '/docs/learning/basic-tools/package-managers': '/articles/package-managers',
  },
});
