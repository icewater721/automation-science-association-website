create table public.articles (
  id uuid primary key default gen_random_uuid(),
  author_id uuid not null references auth.users(id) on delete cascade,
  title text not null default '',
  summary text not null default '',
  content_markdown text not null default '',
  category text not null default '其他',
  status text not null default 'draft',
  slug text unique,
  cover_url text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  published_at timestamptz,
  constraint article_title_length check (char_length(title) <= 60),
  constraint article_summary_length check (char_length(summary) <= 160),
  constraint article_category check (category in ('基础工具', '竞赛经验', '项目记录', '科协动态', '其他')),
  constraint article_status check (status in ('draft', 'review', 'published', 'archived'))
);

alter table public.articles enable row level security;
grant select on public.articles to anon, authenticated;
grant insert (author_id, title, summary, content_markdown, category, status, slug, cover_url, updated_at) on public.articles to authenticated;
grant update (title, summary, content_markdown, category, status, slug, cover_url, updated_at, published_at) on public.articles to authenticated;

create policy "Published articles are public"
on public.articles for select
using (status = 'published');

create policy "Authors can read their articles"
on public.articles for select to authenticated
using ((select auth.uid()) = author_id);

create policy "Editors can create drafts"
on public.articles for insert to authenticated
with check (
  (select auth.uid()) = author_id
  and status = 'draft'
  and exists (select 1 from public.profiles where user_id = (select auth.uid()) and role in ('editor', 'admin'))
);

create policy "Authors can update their unpublished articles"
on public.articles for update to authenticated
using ((select auth.uid()) = author_id and status in ('draft', 'review'))
with check ((select auth.uid()) = author_id and status in ('draft', 'review'));

create policy "Admins can update all articles"
on public.articles for update to authenticated
using (exists (select 1 from public.profiles where user_id = (select auth.uid()) and role = 'admin'))
with check (exists (select 1 from public.profiles where user_id = (select auth.uid()) and role = 'admin'));
