---
title: Git 与 GitHub
description: 用 Git 记录代码变化，并通过 GitHub 备份项目和开展协作。
kind: document
category: 工具使用
audience:
  - Git 初学者
order: 20
updatedAt: 2026-08-17
keywords:
  - Git
  - GitHub
  - 版本控制
  - 协作
draft: false
contributors:
  - 冰水
sourceUrl: https://docs.github.com/zh/get-started/start-your-journey/git-and-github-learning-resources
---

Git 是版本控制工具，负责记录文件如何变化；GitHub 是托管 Git 仓库和协作项目的网站，两者经常一起使用。

## 一个最小工作流程

修改文件后，可以依次运行：

```powershell
git status
git add README.md
git commit -m "docs: update introduction"
git push
```

- `status` 查看当前变化。
- `add` 选择要放入下一次记录的变化。
- `commit` 在本地仓库建立一条带说明的记录。
- `push` 把本地记录上传到远程仓库。

你可以把 `add` 理解为挑选本次要装入包裹的内容，把 `commit` 理解为封装并贴上说明，`push` 则是把包裹送到 GitHub。提交前先看 `status`，能减少把临时文件或隐私信息误传上去的概率。

## 分支有什么用

分支让你在不直接影响稳定版本的情况下开发功能。例如，为导航栏创建分支，完成并检查后再合并到主分支。多人协作时，一个功能对应一个清晰分支，通常比所有人同时修改主分支更容易追踪。

不要把密码、密钥、个人身份信息提交到仓库。即使随后删除，它们仍可能存在于历史记录中。

## 延伸学习

- [GitHub 官方 Git 与 GitHub 学习资源](https://docs.github.com/zh/get-started/start-your-journey/git-and-github-learning-resources)
- [GitHub Skills 交互式课程](https://skills.github.com/)
- [《Pro Git》中文版](https://git-scm.com/book/zh/v2)
