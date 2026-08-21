grant delete on public.articles to authenticated;

create policy "Authors can delete their unpublished articles"
on public.articles for delete to authenticated
using (
  (select auth.uid()) = author_id
  and status in ('draft', 'review')
);

create policy "Admins can delete all articles"
on public.articles for delete to authenticated
using (
  exists (
    select 1 from public.profiles
    where user_id = (select auth.uid()) and role = 'admin'
  )
);
