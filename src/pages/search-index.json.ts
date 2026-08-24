import type { APIRoute } from 'astro';
import { searchEntries } from '../data/search';

export const prerender = true;

export const GET: APIRoute = async () => {
  return new Response(JSON.stringify(searchEntries), {
    headers: {
      'Content-Type': 'application/json; charset=utf-8',
    },
  });
};
