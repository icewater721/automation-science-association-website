insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values (
  'article-images',
  'article-images',
  true,
  8388608,
  array['image/png', 'image/jpeg', 'image/webp', 'image/gif']
)
on conflict (id) do update set
  public = excluded.public,
  file_size_limit = excluded.file_size_limit,
  allowed_mime_types = excluded.allowed_mime_types;

create policy "Article images are publicly readable"
on storage.objects for select
using (bucket_id = 'article-images');

create policy "Editors can upload article images"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'article-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
  and exists (
    select 1 from public.profiles
    where user_id = (select auth.uid())
      and role in ('editor', 'admin')
  )
);

create policy "Editors can manage their article images"
on storage.objects for update to authenticated
using (
  bucket_id = 'article-images'
  and owner_id = (select auth.uid())::text
)
with check (
  bucket_id = 'article-images'
  and owner_id = (select auth.uid())::text
);

create policy "Editors can delete their article images"
on storage.objects for delete to authenticated
using (
  bucket_id = 'article-images'
  and owner_id = (select auth.uid())::text
);
