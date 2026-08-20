create table public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade,
  display_name text not null default '',
  bio text not null default '',
  avatar_url text,
  background_url text,
  role text,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint display_name_length check (char_length(display_name) <= 12),
  constraint bio_length check (char_length(bio) <= 30),
  constraint profile_role check (role is null or role in ('editor', 'admin'))
);

alter table public.profiles enable row level security;
grant select on public.profiles to authenticated;

create policy "Users can read their own profile"
on public.profiles for select to authenticated
using ((select auth.uid()) = user_id);

create policy "Users can update their own profile"
on public.profiles for update to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

revoke update on public.profiles from authenticated;
grant update (display_name, bio, avatar_url, background_url, updated_at)
on public.profiles to authenticated;

create or replace function public.create_profile_for_new_user()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  insert into public.profiles (user_id) values (new.id);
  return new;
end;
$$;

create trigger create_profile_after_signup
after insert on auth.users
for each row execute procedure public.create_profile_for_new_user();

insert into storage.buckets (id, name, public)
values ('profile-images', 'profile-images', true)
on conflict (id) do nothing;

create policy "Users can upload their own profile images"
on storage.objects for insert to authenticated
with check (
  bucket_id = 'profile-images'
  and (storage.foldername(name))[1] = (select auth.uid())::text
);

create policy "Users can update their own profile images"
on storage.objects for update to authenticated
using (
  bucket_id = 'profile-images'
  and owner_id = (select auth.uid()::text)
);

create policy "Users can read their own profile image objects"
on storage.objects for select to authenticated
using (
  bucket_id = 'profile-images'
  and owner_id = (select auth.uid()::text)
);

create policy "Users can delete their own profile images"
on storage.objects for delete to authenticated
using (
  bucket_id = 'profile-images'
  and owner_id = (select auth.uid()::text)
);
