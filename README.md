# Automation Science Association Website

本仓库存放武汉科技大学人工智能与自动化学院科协门户网站的代码与项目文档。

## 项目信息

- 正式名称：`Automation Science Association Website`
- 项目简称：`ASAW`
- 远程仓库：<https://github.com/icewater721/automation-science-association-website>
- 公开网址：<https://icewater721.github.io/automation-science-association-website/>

独立竞赛平台不属于本项目的业务功能；门户仅在正式地址确定后提供入口。需求和优先级采用 Scrum 管理，Sprint 内采用 AI 辅助开发流程。

## 当前阶段

Sprint 0–4 已关闭。网站目前具有主页、文档与文章阅读、全站静态内容搜索、浅色/深色主题、邮箱验证码登录、个人主页、管理员申请、文章草稿与发布、GitHub Pages 自动部署等能力。Sprint 5 进入规划阶段。

## 当前架构

网站采用“静态站点 + 托管后端服务”的混合架构：

- Astro 在构建时生成静态 HTML、CSS 和 JavaScript。
- GitHub Actions 自动构建并发布到 GitHub Pages。
- Markdown/Astro Content Collections 保存仓库内置文档。
- Supabase Auth、Postgres 与 Storage 提供登录、资料、权限、文章和图片能力。
- 浏览器使用公开的 publishable key 访问 Supabase；数据安全依赖 RLS、约束与受控数据库函数，仓库中不得出现 secret/service-role key。

## 技术栈

- Astro 7、TypeScript、原生 CSS
- Astro Content Collections + Markdown
- Supabase Auth、Postgres、Storage
- pnpm、Prettier、Astro Check
- GitHub Actions + GitHub Pages

## 本地开发

需要 Node.js 22.12 或更高版本，以及 pnpm 11。

```bash
pnpm install
pnpm dev
```

开发服务器启动后，按终端显示的本地地址访问网站。无需长期挂着本地终端，公网版本由 GitHub Pages 托管。

## 质量检查

```bash
pnpm check
pnpm format:check
pnpm build
```

生产构建结果位于 `dist/`，不要手工修改 `.astro/` 或 `dist/`。

## 目录约定

- `src/`：页面、组件、内容和样式源码
- `public/`：图片等静态资源
- `supabase/migrations/`：数据库结构、权限和数据迁移
- `docs/product/`：产品愿景、Backlog 与页面规格
- `docs/design/`：视觉与交互说明
- `docs/architecture/`：技术栈、系统架构与 ADR
- `docs/development/`：内容维护与部署说明
- `docs/scrum/`：Sprint 计划和回顾

个人学习笔记保存在 `E:\cs note`，不进入代码仓库。每个 Sprint 结束时进行一次面向新手的学习回顾，流程见 `docs/scrum/LEARNING_REVIEW_PROCESS.md`。
