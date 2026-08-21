create policy "Admins can read all articles"
on public.articles for select to authenticated
using (
  exists (
    select 1
    from public.profiles
    where user_id = (select auth.uid())
      and role = 'admin'
  )
);

create index articles_public_feed_idx
on public.articles (status, published_at desc);

create index articles_author_drafts_idx
on public.articles (author_id, status, updated_at desc);
