# 技术栈

> 状态：Sprint 5 进行中的当前实现，更新于 2026-08-22。

| 层次     | 技术                                 | 用途                                |
| -------- | ------------------------------------ | ----------------------------------- |
| 页面框架 | Astro 7                              | 构建静态页面、路由与组件            |
| 编程语言 | TypeScript                           | 页面脚本、内容和数据类型检查        |
| 样式     | 原生 CSS + 语义化变量                | 侧栏布局、浅色/深色主题和响应式样式 |
| 内置内容 | Astro Content Collections + Markdown | 仓库维护的学习文档                  |
| 动态服务 | Supabase                             | Auth、Postgres、RLS、RPC 与 Storage |
| 搜索     | JSON 索引 + Supabase + TypeScript    | 合并检索静态与已发布动态内容        |
| 字体     | Fontsource Maple Mono                | 文章代码块网页字体                  |
| 包管理   | pnpm 11                              | 依赖和脚本管理                      |
| 质量     | Astro Check、TypeScript、Prettier    | 类型、构建和格式检查                |
| 版本管理 | Git + GitHub                         | 代码历史与协作                      |
| 部署     | GitHub Actions + GitHub Pages        | 自动构建与 HTTPS 静态托管           |

## 为什么继续使用 Astro

- 主页和大多数文档仍是内容型静态页面。
- 静态托管成本低，不需要维护 Node.js 服务器。
- 可以在需要时由浏览器连接 Supabase，不必把整站改为全栈框架。
- Content Collections 适合长期维护仓库内置资料。

## 当前限制

- 动态文章依赖浏览器联网加载；网络失败时只保留静态搜索结果。
- 登录后的权限由 Supabase 托管，不能离线工作。
- `document.execCommand` 用于当前富文本编辑器，属于待替换的技术债。
- 项目尚未建立自动浏览器端回归测试。

## 暂不引入

- 自建运行时服务器
- React/Next.js 全站迁移
- 全局状态管理库
- UI 组件库或 CSS 工具框架
- service-role key 驱动的前端逻辑

新增技术必须由真实需求触发，并通过 ADR 记录边界和代价。
