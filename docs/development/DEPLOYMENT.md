# 网站部署、数据库迁移与更新

## 公开网址

<https://icewater721.github.io/automation-science-association-website/>

网站由 GitHub Pages 托管，关闭开发者电脑或本地终端不会影响公网访问。

## 静态站点发布

```text
修改源码
  → pnpm check / format:check / build
  → 提交并推送当前部署分支
  → GitHub Actions 构建
  → GitHub Pages 发布
```

实际部署分支以 `.github/workflows/deploy.yml` 为准。每次进入新 Sprint 并切换发布分支时，必须同步更新工作流和 GitHub `github-pages` 环境允许的分支。

GitHub Actions 需要以下 Repository Variables：

- `PUBLIC_SUPABASE_URL`
- `PUBLIC_SUPABASE_PUBLISHABLE_KEY`

它们属于公开客户端配置。不得配置或暴露 Supabase service-role key、SMTP 密钥或其他秘密。

## 数据库迁移

`supabase/migrations/` 中新增 SQL 文件不会因为 GitHub Pages 部署而自动应用。每次涉及数据库的发布必须单独确认：

1. 阅读新迁移内容和影响范围。
2. 在 Supabase SQL Editor 或受控 CLI 中执行。
3. 查看是否成功并检查 RLS、函数和 Storage 策略。
4. 用普通用户和管理员各验收一次相关流程。
5. 记录已应用的最后一个迁移文件。

Sprint 4 结束时最新迁移为：

```text
202608220002_article_categories.sql
```

其线上执行状态仍需 Product Owner 确认。

## 发布前检查

```powershell
pnpm check
pnpm format:check
pnpm build
```

随后检查 GitHub Actions，并在公网验收首页、文章、登录和权限相关流程。

## GitHub 设置

- Settings → Pages → Source：`GitHub Actions`
- Settings → Environments → `github-pages`：允许当前部署分支
- Enforce HTTPS：启用

## 子路径

项目位于 `/automation-science-association-website/`。`astro.config.mjs` 和 `src/utils/paths.ts` 负责正确链接；新增页面和资源不能假设部署在域名根目录。

## 正式域名

当前不购买正式域名。以后绑定域名时，需要配置 DNS、Pages、Astro `site/base`、Supabase Site URL 与 Redirect URLs，并重新验收邮件登录链接和全部站内路径。
