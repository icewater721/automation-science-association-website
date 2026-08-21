-- Any signed-in user can create and manage personal drafts. Only admins publish.
update public.articles set status = 'draft' where status = 'review';

drop policy if exists "Editors can create drafts" on public.articles;
drop policy if exists "Authors can update their unpublished articles" on public.articles;
drop policy if exists "Authors can delete their unpublished articles" on public.articles;

create policy "Authenticated users can create drafts"
on public.articles for insert to authenticated
with check ((select auth.uid()) = author_id and status = 'draft');

create policy "Authors can update their drafts"
on public.articles for update to authenticated
using ((select auth.uid()) = author_id and status = 'draft')
with check ((select auth.uid()) = author_id and status = 'draft');

create policy "Authors can delete their drafts"
on public.articles for delete to authenticated
using ((select auth.uid()) = author_id and status = 'draft');

drop policy if exists "Editors can upload article images" on storage.objects;
create policy "Authenticated users can upload article images"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'article-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);

update public.profiles set role = null where role = 'editor';
alter table public.profiles drop constraint if exists profile_role;
alter table public.profiles
add constraint profile_role check (role is null or role = 'admin');
