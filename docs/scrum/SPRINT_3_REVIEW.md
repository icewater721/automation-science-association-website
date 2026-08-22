# Sprint 3 Review 与学习回顾

> Sprint 3 已在进入 Sprint 4 前完成；本回顾于 2026-08-22 根据代码、部署配置和 Git 历史补录。

## Sprint Review

Sprint 3 将项目从“必须在开发者电脑上启动”推进为公开网站：Astro 继续输出静态文件，GitHub Actions 负责检查与构建，GitHub Pages 负责长期托管。项目使用仓库子路径部署，因此站内链接和静态资源必须经过统一的 `base` 处理。

公开网址：<https://icewater721.github.io/automation-science-association-website/>

## 本轮学到什么

### 开发服务器与公网托管不同

`pnpm dev` 用于本地实时开发，关闭终端后本地地址会停止。GitHub Pages 托管的是 `pnpm build` 生成的静态结果，不依赖个人电脑持续运行。

### GitHub Actions 是自动化流水线

```text
提交并推送
  → GitHub 获取源码
  → 安装依赖并检查
  → Astro 构建 dist
  → GitHub Pages 发布
```

### 子路径会影响所有链接

项目网址位于 `/automation-science-association-website/`，不能假设页面部署在域名根目录。统一路径工具可以防止图片、页面和脚本在公网部署后失效。

### 静态不等于没有交互

搜索、主题切换和页面交互可以在浏览器中运行。只有需要跨用户保存数据、身份认证或服务端权限判断时，才需要数据库或后端服务。

## Retrospective

### 做得好的地方

- 先选择免费静态托管，避免过早购买服务器和域名。
- 把构建与部署自动化，降低后续发布门槛。
- 在正式域名前先验证公网访问和子路径问题。

### 可以改进

- Sprint 3 当时缺少独立 Review 文件，导致状态长期停留在“进行中”。
- README、部署说明和 Backlog 没有在 Sprint 切换时同步更新。
- 以后关闭 Sprint 时必须同时更新计划状态、Review、Backlog、README 和部署分支。

## 结论

Sprint Goal 已达成，Sprint 3 正式关闭。遗漏的是项目记录，不是功能实现。
