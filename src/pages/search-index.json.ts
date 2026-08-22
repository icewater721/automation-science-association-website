import type { APIRoute } from 'astro';
import { getCollection } from 'astro:content';
import { searchEntries, type SearchEntry } from '../data/search';
import { withBase } from '../utils/paths';

export const prerender = true;

const slugFor = (id: string) =>
  id
    .split('/')
    .at(-1)
    ?.replace(/\.mdx?$/, '') ?? id;

export const GET: APIRoute = async () => {
  const documents = await getCollection(
    'docs',
    ({ data }) => data.kind === 'document' && !data.draft,
  );
  const documentEntries: SearchEntry[] = documents.map((entry) => ({
    title: entry.data.title,
    description: entry.data.description,
    category: entry.data.category,
    url: withBase(`/articles/${slugFor(entry.id)}/`),
    keywords: entry.data.keywords,
    date: (entry.data.publishedAt ?? entry.data.updatedAt).toISOString(),
    searchText: entry.body,
  }));
  const documentUrls = new Set(documentEntries.map((entry) => entry.url));
  const entries = [
    ...searchEntries.filter((entry) => !documentUrls.has(entry.url)),
    ...documentEntries,
  ];

  return new Response(JSON.stringify(entries), {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
  });
};
