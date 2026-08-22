# Sprint 3：现有成果完善与公开部署

## 状态

已完成。Sprint 3 的实现和公网验收已在进入 Sprint 4 前完成；本文件于 2026-08-22 补齐关闭状态。

## Sprint Goal

完善已有主页、文档中心和搜索能力，并把只能通过本机开发服务器访问的网站部署为稳定的公网 HTTPS 网站。

## 已完成

- [x] 使用 GitHub Pages 提供公开 HTTPS 地址。
- [x] 配置 Astro `site`、`base` 和子路径链接。
- [x] 添加 GitHub Actions 自动检查、构建和部署。
- [x] 验收主页、文档、搜索索引、静态资源和站内跳转。
- [x] 从 Content Collections 生成文档路由和静态搜索索引。
- [x] 记录公开网址、部署流程和正式域名后续事项。
- [x] 完成类型检查和生产构建。
- [x] 完成 Sprint Review 与回顾（补充记录见 `SPRINT_3_REVIEW.md`）。

## 延后或被后续迭代取代

- 正式域名：继续使用 GitHub Pages 默认域名。
- 手机端专项验收：待正式域名和移动端迭代统一进行。
- 内容扩充：安排到内容型 Sprint。
- Sprint 3 中出现过的多风格主题后来在 Sprint 4 被简约浅色/深色主题取代。
- 数据库、登录和发布能力原本不在 Sprint 3 范围，后来因产品方向调整进入 Sprint 4。

## Definition of Done 结果

- 公开 HTTPS 地址可用。
- 推送到部署分支后可自动构建并发布。
- 公网子路径下核心页面与资源可用。
- 新增公开 Markdown 可自动生成页面并进入静态搜索索引。
- 项目保存了部署说明。
- Sprint Goal 达成。
