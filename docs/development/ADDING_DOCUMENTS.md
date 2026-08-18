# 新增和修改文档

网站公开文档保存在 `src/content/docs/`。正文使用 Markdown，目录层级由文件夹决定。

## 修改已有文档

1. 在 `src/content/docs/` 中找到对应的 `.md` 文件。
2. 修改正文，并同步更新文件顶部的 `updatedAt`。
3. 启动本地网站，在对应页面检查标题、链接、代码块和目录跳转。
4. 完成检查后再提交 Git 记录。

## 新增文档

在所属分类文件夹中新建 `.md` 文件。文件名使用简短的小写英文和连字符，例如 `git-github.md`。

每篇文档顶部需要填写：

```yaml
---
title: 页面标题
description: 一句话说明页面解决什么问题
kind: document
audience:
  - 适用读者
order: 20
updatedAt: 2026-08-18
keywords:
  - 搜索关键词
draft: false
---
```

- `kind` 使用 `document`；分类说明页使用 `category`。
- `order` 决定同一分类中的阅读顺序。
- 尚未公开的内容将 `draft` 设为 `true`。
- 引用外部资料时，可以增加 `sourceUrl`，正文中也应给出清楚的来源链接。

## 当前维护注意事项

- 新文档页面会由 Astro 自动生成，不需要手写 HTML。
- 新增基础工具文档后，目前仍需同步更新 `DocsLayout.astro` 的左侧目录和 `search.ts` 的搜索条目。
- 不要直接修改 `.astro/` 或 `dist/`，它们是工具生成的目录。
- 不要上传账号密码、访问令牌或学生隐私信息。

## 提交前检查

```powershell
pnpm check
pnpm format:check
pnpm build
```

三项都通过后，再进入 Review 或提交代码。
