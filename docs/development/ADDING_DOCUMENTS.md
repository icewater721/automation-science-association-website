# 新增和修改内置文档

网站内置公开文档保存在 `src/content/docs/`，正文使用 Markdown。用户通过网站发布的动态文章保存在 Supabase，不按本说明直接修改。

## 修改已有 Markdown

1. 在 `src/content/docs/` 找到对应 `.md`。
2. 修改正文并更新顶部 `updatedAt`。
3. 本地检查标题、链接、目录、代码块和复制按钮。
4. 运行质量检查后提交。

## 新增 Markdown

在合适文件夹中新建小写英文加连字符的文件，例如 `git-github.md`。基本字段：

```yaml
---
title: 页面标题
description: 一句话说明页面解决什么问题
kind: document
category: 工具使用
audience:
  - 适用读者
order: 20
updatedAt: 2026-08-22
keywords:
  - 搜索关键词
draft: false
contributors:
  - 贡献者昵称
---
```

- `kind` 使用 `document`。
- `category` 使用当前文章分类之一。
- `order` 决定同一组内的阅读顺序。
- 未完成内容将 `draft` 设为 `true`。
- 外部资料应标明来源链接。

## 自动生成内容

- Astro 会自动为公开 Markdown 生成文章页面。
- 静态搜索索引会读取公开 Content Collections 的元数据与正文，无需手工更新 `search.ts`。
- 文章右侧目录根据 Markdown 标题生成。
- 不要直接修改 `.astro/` 或 `dist/`。

## 数据库文章

管理员在网站编辑器中创建和发布。分类、权限与数据结构由 `supabase/migrations/` 管理。已发布文章会在访客打开搜索时从 Supabase 载入，并与静态索引合并；草稿不会进入公开搜索。

## 提交前检查

```powershell
pnpm check
pnpm format:check
pnpm build
```

不要上传账号密码、OTP、SMTP 密钥、service-role key 或学生隐私信息。
