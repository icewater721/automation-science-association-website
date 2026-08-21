alter table public.articles
drop constraint if exists article_category;

update public.articles
set category = '未分类'
where category = '其他';

alter table public.articles
alter column category set default '未分类';

alter table public.articles
add constraint article_category
check (category in ('基础工具', '竞赛经验', '项目记录', '科协动态', '未分类'));
