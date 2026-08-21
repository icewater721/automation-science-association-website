create or replace function public.get_published_article_feed()
returns table (
  id uuid,
  title text,
  summary text,
  category text,
  published_at timestamptz,
  updated_at timestamptz,
  author_id uuid,
  author_name text,
  author_avatar_url text
)
language sql
stable
security definer
set search_path = ''
as $$
  select
    article.id,
    article.title,
    article.summary,
    article.category,
    article.published_at,
    article.updated_at,
    article.author_id,
    coalesce(nullif(profile.display_name, ''), '科协成员'),
    profile.avatar_url
  from public.articles article
  left join public.profiles profile on profile.user_id = article.author_id
  where article.status = 'published'
  order by article.published_at desc nulls last;
$$;

revoke all on function public.get_published_article_feed() from public;
grant execute on function public.get_published_article_feed() to anon, authenticated;

create or replace function public.get_site_contributor()
returns table (
  display_name text,
  avatar_url text
)
language sql
stable
security definer
set search_path = ''
as $$
  select
    coalesce(nullif(profile.display_name, ''), '科协成员'),
    profile.avatar_url
  from public.profiles profile
  where profile.role = 'admin'
  order by profile.created_at
  limit 1;
$$;

revoke all on function public.get_site_contributor() from public;
grant execute on function public.get_site_contributor() to anon, authenticated;
