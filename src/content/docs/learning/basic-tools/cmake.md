---
title: CMake：组织 C/C++ 构建
description: 认识 CMake 的作用，并用最小项目生成和执行一次构建。
kind: document
category: 工具使用
audience:
  - C 或 C++ 初学者
order: 30
updatedAt: 2026-08-17
keywords:
  - CMake
  - C++
  - 构建系统
draft: false
contributors:
  - 冰水
sourceUrl: https://cmake.org/cmake/help/latest/guide/tutorial/index.html
---

CMake 用配置文件描述一个项目应当如何构建，再为当前平台生成实际的构建文件。它通常会调用编译器和构建工具，但 CMake 本身不是编译器。

## 一个最小项目

假设目录中有 `main.cpp`，再新建 `CMakeLists.txt`：

```cmake
cmake_minimum_required(VERSION 3.20)
project(hello LANGUAGES CXX)

add_executable(hello main.cpp)
```

在项目根目录运行：

```powershell
cmake -S . -B build
cmake --build build
```

第一条命令读取当前目录的源码配置，并把生成文件放进 `build`；第二条命令执行构建。把生成结果放在独立目录中，可以让源码目录保持清楚，也方便完整清理后重新构建。

项目变大后，CMake 还可以管理多个源文件、第三方库、测试和不同构建配置。刚开始不需要背下全部语法，先能读懂目标、源文件和依赖之间的关系。

## 延伸学习

- [CMake 官方教程](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
