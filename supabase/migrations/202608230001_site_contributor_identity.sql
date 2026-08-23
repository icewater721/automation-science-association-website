-- Expose the stable account id of the maintainer associated with repository documents.
drop function if exists public.get_site_contributor();

create function public.get_site_contributor()
returns table (
  user_id uuid,
  display_name text,
  avatar_url text
)
language sql
stable
security definer
set search_path = ''
as $$
  select
    profile.user_id,
    coalesce(nullif(profile.display_name, ''), '科协成员'),
    profile.avatar_url
  from public.profiles profile
  where profile.role = 'admin'
  order by profile.created_at
  limit 1;
$$;

revoke all on function public.get_site_contributor() from public;
grant execute on function public.get_site_contributor() to anon, authenticated;