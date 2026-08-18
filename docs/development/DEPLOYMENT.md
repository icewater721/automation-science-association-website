# 网站部署与更新

## 当前公开网址

```text
https://icewater721.github.io/automation-science-association-website/
```

网站目前由 GitHub Pages 托管，使用 HTTPS，不依赖开发者电脑或本地终端持续运行。

## 当前发布流程

```text
修改源码
  ↓
本地检查和构建
  ↓
提交到 sprint-3
  ↓
推送到 GitHub
  ↓
GitHub Actions 自动构建并发布到 Pages
```

自动部署配置位于 `.github/workflows/deploy.yml`。Sprint 3 期间，推送到 `sprint-3` 会触发部署。

## 发布前检查

```powershell
pnpm check
pnpm format:check
pnpm build
```

三项均通过后，再提交并推送代码。推送后可在仓库的 Actions 页面查看部署结果。

## GitHub 仓库设置

- Settings → Pages → Source：`GitHub Actions`
- Settings → Environments → `github-pages`：允许 `sprint-3` 部署
- Enforce HTTPS：保持启用

## 子路径说明

当前项目部署在用户主页下的仓库子路径：

```text
/automation-science-association-website/
```

`astro.config.mjs` 中的 `base` 和 `src/utils/paths.ts` 负责生成正确的站内链接。新增页面或静态资源时，不要假设网站一定部署在域名根目录。

## 正式域名

Sprint 3 暂不购买正式域名。以后绑定正式域名时，需要调整 DNS、GitHub Pages 域名设置和 Astro 的 `site`/`base` 配置，并重新验收全部站内链接。
