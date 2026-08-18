---
title: VS Code
description: 认识 VS Code 的基本界面，并完成打开项目、查找文件、使用终端和安装扩展等基础操作。
kind: document
audience:
  - VS Code 初学者
order: 10
updatedAt: 2026-08-18
keywords:
  - VS Code
  - 编辑器
  - 工作区
  - 扩展
  - 终端
draft: false
sourceUrl: https://code.visualstudio.com/docs/
---

VS Code（Visual Studio Code）是由 Microsoft 开发的功能强大的轻量级源代码编辑器。你可以用它编写程序和文档、管理项目文件，使用终端和 Git 等工具。

对入门者而言，我们也更推荐VS code，而不是Visual Studio。相比之下，VS Code更轻便，UI设计现代化更好，通过插件能满足绝大多数入门级需求；VS code可以编写与查看多种语言，这一点是Visual Studio做不到的。

## 准备工作

通过 https://code.visualstudio.com 下载VS Code。

下载完成后，在左侧边栏找到Extensions，搜索“简体中文”扩展，下载后重启VS Code，界面就是中文了。

## 打开文件夹

启动 VS Code 后，选择菜单中的“文件 → 打开文件夹”，然后选择你要学习或开发的项目文件夹。

打开文件夹后，VS Code 会把它视为当前工作区。左侧资源管理器会显示这个文件夹中的全部内容，终端也可以从该文件夹开始运行命令。

## 认识主要界面

VS Code 的界面分为五个区域：

1. **活动栏**：切换资源管理器、搜索、源代码管理、运行和扩展等功能。
2. **侧边栏**：显示当前功能的具体内容，例如项目文件树。
3. **编辑区**：阅读和修改文件的主要区域。
4. **面板**：显示终端、输出、问题和调试信息。
5. **状态栏**：显示当前文件、Git 分支、错误数量等状态。

界面布局可以调整。刚开始时建议保留默认布局，先理解每个区域解决什么问题。

## 使用资源管理器

点击活动栏中的资源管理器图标，可以查看当前项目的文件树。

你可以在这里：

- 创建文件和文件夹。
- 重命名或移动文件。
- 展开目录并打开文件。
- 通过右键菜单在指定目录中打开终端。

修改前先确认文件位于哪个目录。项目中可能存在同名文件，路径往往比文件名更能说明它的用途。

## 查找文件和内容

当项目文件增多后，不要只依靠逐层展开文件夹。

- 按 Ctrl + P，可以按文件名快速打开文件。
- 按 Ctrl + Shift + F，可以在当前文件夹中搜索文字。
- 按 Ctrl + F，可以在当前文件中搜索。

全局搜索适合寻找某段文案、函数名或配置项在哪里出现。修改公共名称前，也可以先搜索它被哪些文件使用。

## 使用命令面板

按 Ctrl + Shift + P 可以打开命令面板。许多不熟悉位置的功能都可以通过输入名称找到。

例如，你可以搜索：

- Format Document：格式化当前文档。
- Preferences: Open Settings：打开设置。
- Developer: Reload Window：重新加载 VS Code 窗口。

不必记住大量菜单路径。知道功能名称时，命令面板通常是更直接的入口。

## 打开集成终端

选择“查看 → 终端”，或者按 Ctrl + ` ，可以在 VS Code 底部打开集成终端。

终端通常会从当前工作区根目录开始。运行命令前，先确认终端提示符显示的目录是否正确。

终端可以用于：

- 运行程序和开发服务器。
- 执行项目检查或构建命令。
- 使用 Git 查看和保存版本。
- 查看工具输出和报错。

## 安装扩展

按 Ctrl + Shift + X 可以打开扩展视图。扩展能够为特定语言、框架或工具增加语法提示、格式化和调试等能力。

扩展并不是越多越好。数量过多可能增加启动时间，也可能让格式化和代码提示规则相互冲突。

## 延伸阅读

- [VS Code 官方入门教程](https://code.visualstudio.com/docs/editing/getting-started)
- [VS Code 用户界面说明](https://code.visualstudio.com/docs/editing/userinterface)
- [VS Code 集成终端入门](https://code.visualstudio.com/docs/terminal/getting-started)
- [VS Code 扩展使用说明](https://code.visualstudio.com/docs/getstarted/extensions)
