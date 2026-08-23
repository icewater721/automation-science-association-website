create table if not exists public.article_contributors (
  article_id uuid not null references public.articles(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  contributed_at timestamptz not null default now(),
  primary key (article_id, user_id)
);

alter table public.article_contributors enable row level security;
grant select on public.article_contributors to authenticated;

create policy "Admins can read article contributors"
on public.article_contributors for select to authenticated
using ((select public.is_admin()));

insert into public.article_contributors (article_id, user_id, contributed_at)
select id, author_id, created_at from public.articles
on conflict (article_id, user_id) do nothing;

create or replace function public.track_article_contributor()
returns trigger
language plpgsql
security definer
set search_path = ''
as $$
declare
  contributor_id uuid := (select auth.uid());
begin
  if contributor_id is null and tg_op = 'INSERT' then
    contributor_id := new.author_id;
  end if;
  if contributor_id is not null then
    insert into public.article_contributors (article_id, user_id, contributed_at)
    values (new.id, contributor_id, now())
    on conflict (article_id, user_id)
    do update set contributed_at = excluded.contributed_at;
  end if;
  return new;
end;
$$;

drop trigger if exists track_article_contributor on public.articles;
create trigger track_article_contributor
after insert or update of title, summary, content_markdown, category, status
on public.articles
for each row execute function public.track_article_contributor();

create or replace function public.get_article_contributors(target_article_id uuid)
returns table (
  user_id uuid,
  display_name text,
  avatar_url text,
  contributed_at timestamptz
)
language sql
stable
security definer
set search_path = ''
as $$
  select
    contributor.user_id,
    coalesce(nullif(profile.display_name, ''), '科协成员'),
    profile.avatar_url,
    contributor.contributed_at
  from public.article_contributors contributor
  join public.profiles profile on profile.user_id = contributor.user_id
  join public.articles article on article.id = contributor.article_id
  where contributor.article_id = target_article_id
    and (article.status = 'published' or public.is_admin())
  order by contributor.contributed_at;
$$;

revoke all on function public.get_article_contributors(uuid) from public;
grant execute on function public.get_article_contributors(uuid) to anon, authenticated;