import { defineCollection } from 'astro:content';
import { glob } from 'astro/loaders';
import { z } from 'astro/zod';

const docs = defineCollection({
  loader: glob({ pattern: '**/*.{md,mdx}', base: './src/content/docs' }),
  schema: z.object({
    title: z.string(),
    description: z.string(),
    kind: z.enum(['category', 'document']),
    audience: z.array(z.string()).default([]),
    order: z.number().int().nonnegative(),
    updatedAt: z.coerce.date(),
    keywords: z.array(z.string()).default([]),
    draft: z.boolean().default(false),
    sourceUrl: z.url().optional(),
  }),
});

export const collections = { docs };
