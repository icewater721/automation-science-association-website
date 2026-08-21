-- Browsing is public. Editing and publishing require an approved admin account.
update public.articles set status = 'draft' where status = 'review';
update public.profiles set role = null where role = 'editor';

alter table public.profiles drop constraint if exists profile_role;
alter table public.profiles
add constraint profile_role check (role is null or role = 'admin');

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.profiles
    where user_id = (select auth.uid()) and role = 'admin'
  );
$$;
revoke all on function public.is_admin() from public;
grant execute on function public.is_admin() to authenticated;

drop policy if exists "Editors can create drafts" on public.articles;
drop policy if exists "Authenticated users can create drafts" on public.articles;
drop policy if exists "Authors can update their unpublished articles" on public.articles;
drop policy if exists "Authors can update their drafts" on public.articles;
drop policy if exists "Authors can delete their unpublished articles" on public.articles;
drop policy if exists "Authors can delete their drafts" on public.articles;
drop policy if exists "Authors can read their articles" on public.articles;

create policy "Admins can create articles"
on public.articles for insert to authenticated
with check ((select public.is_admin()) and (select auth.uid()) = author_id);

create policy "Admins can delete articles"
on public.articles for delete to authenticated
using (select public.is_admin());

drop policy if exists "Editors can upload article images" on storage.objects;
drop policy if exists "Authenticated users can upload article images" on storage.objects;
drop policy if exists "Editors can manage their article images" on storage.objects;
drop policy if exists "Editors can delete their article images" on storage.objects;
create policy "Admins can upload article images"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'article-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
  and (select public.is_admin())
);

create policy "Admins can update article images"
on storage.objects for update to authenticated
using (bucket_id = 'article-images' and (select public.is_admin()))
with check (bucket_id = 'article-images' and (select public.is_admin()));

create policy "Admins can delete article images"
on storage.objects for delete to authenticated
using (bucket_id = 'article-images' and (select public.is_admin()));

create table if not exists public.admin_requests (
  id uuid primary key default gen_random_uuid(),
  user_id uuid not null unique references auth.users(id) on delete cascade,
  display_name text not null default '',
  reason text not null default '',
  status text not null default 'pending',
  created_at timestamptz not null default now(),
  decided_at timestamptz,
  constraint admin_request_reason_length check (char_length(reason) between 1 and 300),
  constraint admin_request_status check (status in ('pending', 'approved', 'rejected'))
);

alter table public.admin_requests enable row level security;
grant select, insert on public.admin_requests to authenticated;

create policy "Users can read their admin request"
on public.admin_requests for select to authenticated
using ((select auth.uid()) = user_id);

create policy "Admins can read admin requests"
on public.admin_requests for select to authenticated
using (select public.is_admin());

create policy "Users can apply for admin"
on public.admin_requests for insert to authenticated
with check ((select auth.uid()) = user_id and status = 'pending');

create or replace function public.decide_admin_request(request_id uuid, approve boolean)
returns void language plpgsql security definer set search_path = ''
as $$
declare applicant uuid;
begin
  if not public.is_admin() then raise exception 'Admin permission required'; end if;
  select user_id into applicant from public.admin_requests where id = request_id and status = 'pending';
  if applicant is null then raise exception 'Pending request not found'; end if;
  update public.admin_requests
  set status = case when approve then 'approved' else 'rejected' end, decided_at = now()
  where id = request_id;
  if approve then update public.profiles set role = 'admin' where user_id = applicant; end if;
end;
$$;
revoke all on function public.decide_admin_request(uuid, boolean) from public;
grant execute on function public.decide_admin_request(uuid, boolean) to authenticated;
