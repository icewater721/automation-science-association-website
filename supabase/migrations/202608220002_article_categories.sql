alter table public.articles
drop constraint if exists article_category;

update public.articles
set category = case
  when category = '基础工具' then '工具使用'
  when category = '科协动态' then '公告'
  when category = '其他' then '未分类'
  else category
end;

alter table public.articles
alter column category set default '未分类';

alter table public.articles
add constraint article_category
check (category in ('技术分享', '工具使用', '竞赛经验', '项目记录', '公告', '未分类'));
