alter table public.profiles
add column if not exists role text;

do $$
begin
  if exists (
    select 1
    from information_schema.columns
    where table_schema = 'public'
      and table_name = 'profiles'
      and column_name = 'is_collaborator'
  ) then
    execute 'update public.profiles set role = ''editor'' where is_collaborator = true';
    execute 'alter table public.profiles drop column is_collaborator';
  end if;
end
$$;

alter table public.profiles
drop constraint if exists profile_role;

alter table public.profiles
add constraint profile_role check (role is null or role in ('editor', 'admin'));
