# Automation Science Association Website

本仓库存放科协门户网站的代码与项目内技术文档。

## 项目名称

- 正式名称：`Automation Science Association Website`
- 项目简称：`ASAW`
- 项目根目录：`E:\automation science association website`

## 项目边界

- 本项目是科协门户网站。
- 独立竞赛平台不属于本项目的业务功能；门户仅提供跳转入口。
- 需求和优先级采用 Scrum 管理，Sprint 内采用 AI 辅助开发流程。

## 服务对象

武汉科技大学人工智能与自动化学院科学技术协会，主要面向本校学生与科协成员。

## 品牌资产

- 主 Logo：`public/images/brand/asaw-logo.png`
- 原始尺寸：1254 × 1254 px
- 格式：带透明通道的 PNG

## 当前阶段

Sprint 1 已完成主页 MVP、三种主题、全站搜索、部门介绍和联系入口。项目当前进入 Sprint 2 规划阶段，候选目标是建立活动中心的功能骨架与结构化内容模型。

## 技术栈

- Astro 7
- TypeScript
- 原生 CSS
- pnpm

MVP 为静态网站，不包含数据库、登录系统和管理后台。

## 本地开发

需要 Node.js 22.12 或更高版本，以及 pnpm 11。

```bash
pnpm install
pnpm dev
```

开发服务器启动后，按终端显示的本地地址访问网站。

## 质量检查

```bash
pnpm check
pnpm format:check
pnpm build
```

生产构建结果位于 `dist/`。

## GitHub

远程仓库：<https://github.com/icewater721/automation-science-association-website>

## 目录约定

- `src/`：页面、组件、内容和样式源码
- `public/`：网站直接使用的图片等静态资源
- `docs/product/`：产品愿景、Backlog 与主页规格
- `docs/design/`：视觉与交互设计说明
- `docs/architecture/`：技术栈、系统架构与 ADR
- `docs/scrum/`：各 Sprint 的计划与完成情况

学习笔记不进入代码仓库，统一保存在 `E:\cs note`。

每个 Sprint 结束时进行一次面向新手的学习回顾，理解本轮成果、关键概念、文件位置和基本操作；具体流程见 `docs/scrum/LEARNING_REVIEW_PROCESS.md`。

## 开发原则

1. 先写 User Story 和验收标准，再实现功能。
2. 数据模型和页面流程确认后再写业务代码。
3. 每个 Sprint 都包含实现、测试、评审和回顾。
4. 重要技术选择记录原因，不让架构随 AI 输出漂移。
