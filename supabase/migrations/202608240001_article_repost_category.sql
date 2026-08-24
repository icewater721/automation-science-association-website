alter table public.articles
drop constraint if exists article_category;

alter table public.articles
add constraint article_category
check (
  category in (
    '技术分享',
    '工具使用',
    '竞赛经验',
    '项目记录',
    '搬运',
    '公告',
    '未分类'
  )
);
