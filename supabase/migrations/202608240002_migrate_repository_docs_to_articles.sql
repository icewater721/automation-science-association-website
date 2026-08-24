-- One-time migration: move the five original repository documents into the
-- regular article workflow. The files remain in the repository as a temporary
-- fallback until the migration has been verified in production.
do $$
declare
  target_author uuid;
begin
  select profile.user_id
  into target_author
  from public.profiles profile
  where profile.role = 'admin'
  order by
    case when profile.display_name = '冰水' then 0 else 1 end,
    profile.created_at asc
  limit 1;

  if target_author is null then
    raise exception 'Cannot migrate repository documents: no admin profile exists.';
  end if;

  insert into public.articles (
    author_id,
    title,
    summary,
    content_markdown,
    category,
    status,
    slug,
    created_at,
    updated_at,
    published_at
  )
  values
    (
      target_author,
      'VS Code',
      '认识 VS Code 的基本界面，并完成打开项目、查找文件、使用终端和安装扩展等基础操作。',
      $vscode$VS Code（Visual Studio Code）是由 Microsoft 开发的功能强大的轻量级源代码编辑器。你可以用它编写程序和文档、管理项目文件，使用终端和 Git 等工具。

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
- [VS Code 扩展使用说明](https://code.visualstudio.com/docs/getstarted/extensions)$vscode$,
      '工具使用', 'published', 'vscode',
      '2026-08-18 00:00:00+08', '2026-08-18 00:00:00+08', '2026-08-18 00:00:00+08'
    ),
    (
      target_author,
      'Git 与 GitHub',
      '用 Git 记录代码变化，并通过 GitHub 备份项目和开展协作。',
      $git$Git 是版本控制工具，负责记录文件如何变化；GitHub 是托管 Git 仓库和协作项目的网站，两者经常一起使用。

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
- [《Pro Git》中文版](https://git-scm.com/book/zh/v2)$git$,
      '工具使用', 'published', 'git-github',
      '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08'
    ),
    (
      target_author,
      'CMake：组织 C/C++ 构建',
      '认识 CMake 的作用，并用最小项目生成和执行一次构建。',
      $cmake$CMake 用配置文件描述一个项目应当如何构建，再为当前平台生成实际的构建文件。它通常会调用编译器和构建工具，但 CMake 本身不是编译器。

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

- [CMake 官方教程](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)$cmake$,
      '工具使用', 'published', 'cmake',
      '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08'
    ),
    (
      target_author,
      '容器：获得一致的运行环境',
      '认识镜像和容器，并理解容器适合解决什么问题。',
      $containers$容器把应用及其运行所需的依赖打包起来，并在相对隔离的环境中运行。它常用来减少“在我的电脑上可以运行，换一台电脑就不行”的问题。

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
- [Docker 官方动手实验](https://docs.docker.com/get-started/workshop/)$containers$,
      '工具使用', 'published', 'containers',
      '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08'
    ),
    (
      target_author,
      '包管理器：安装和记录依赖',
      '了解包管理器、依赖清单和锁文件之间的关系。',
      $packages$包管理器帮助我们查找、安装、升级和移除别人发布的软件包。不同语言和平台通常有各自的工具，例如 Node.js 的 npm、pnpm，Python 的 pip，C/C++ 的 vcpkg，以及 Windows 的 WinGet。

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
- [vcpkg 官方文档](https://vcpkg.io/en/docs/README.html)$packages$,
      '工具使用', 'published', 'package-managers',
      '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08', '2026-08-17 00:00:00+08'
    )
  on conflict (slug) do nothing;
end;
$$;
