---
title: 容器：获得一致的运行环境
description: 认识镜像和容器，并理解容器适合解决什么问题。
kind: document
category: 工具使用
audience:
  - 开发环境初学者
order: 40
updatedAt: 2026-08-17
keywords:
  - 容器
  - Docker
  - 镜像
  - 开发环境
draft: false
contributors:
  - 冰水
sourceUrl: https://docs.docker.com/get-started/
---

容器把应用及其运行所需的依赖打包起来，并在相对隔离的环境中运行。它常用来减少“在我的电脑上可以运行，换一台电脑就不行”的问题。

镜像是一份只读的运行模板，容器是由镜像启动的运行实例。同一个镜像可以启动多个容器。容器也不是简单的“小型虚拟机”；在 Windows 上使用 Docker Desktop 时，底层实现还可能借助虚拟化环境。

## 一个最小体验

安装并启动 Docker 后，可以运行：

```powershell
docker run --rm hello-world
```

Docker 会查找 `hello-world` 镜像、创建容器并运行它。`--rm` 表示容器结束后删除这个运行实例。镜像仍会保留，除非另行删除。

真实项目通常还会使用 `Dockerfile` 描述如何制作镜像，并用端口映射、环境变量和数据卷连接外部环境。开始时先理解镜像、容器和数据三者的区别，再学习复杂编排。

不要随意运行来源不明的镜像，也不要把包含密码或个人文件的目录挂载给不可信容器。

## 延伸学习

- [Docker 官方入门](https://docs.docker.com/get-started/)
- [Docker 官方动手实验](https://docs.docker.com/get-started/workshop/)
