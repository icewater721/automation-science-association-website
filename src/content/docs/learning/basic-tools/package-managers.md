---
title: 包管理器：安装和记录依赖
description: 了解包管理器、依赖清单和锁文件之间的关系。
kind: document
category: 基础工具
audience:
  - 项目开发初学者
order: 50
updatedAt: 2026-08-17
keywords:
  - 包管理器
  - 依赖
  - npm
  - pnpm
  - pip
  - vcpkg
draft: false
sourceUrl: https://vcpkg.io/en/docs/README.html
---

包管理器帮助我们查找、安装、升级和移除别人发布的软件包。不同语言和平台通常有各自的工具，例如 Node.js 的 npm、pnpm，Python 的 pip，C/C++ 的 vcpkg，以及 Windows 的 WinGet。

## 一个简单例子

在已有的 Node.js 项目中，可以运行：

```powershell
pnpm add package-name
```

包管理器会下载依赖，并更新项目的依赖清单和锁文件。依赖清单说明项目需要什么，锁文件记录这次实际解析出的精确版本。团队应当保留锁文件，让不同成员和自动构建尽量安装相同版本。

不要看到命令就直接全局安装。先确认它是项目依赖、开发工具，还是操作系统级软件。也不要在同一项目中随意混用多个同类包管理器，否则可能产生多份相互冲突的锁文件。

## 常见选择

- Node.js 项目：npm、pnpm。
- Python 项目：pip；通常配合虚拟环境隔离不同项目。
- C/C++ 项目：vcpkg、Conan。
- Windows 软件：WinGet。

具体选择应跟随课程或项目已有约定，而不是只比较工具流行程度。

## 延伸学习

- [pnpm 官方文档](https://pnpm.io/)
- [Python Packaging 官方安装教程](https://packaging.python.org/en/latest/tutorials/installing-packages/)
- [vcpkg 官方文档](https://vcpkg.io/en/docs/README.html)
