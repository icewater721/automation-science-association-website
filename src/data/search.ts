import { withBase } from '../utils/paths';

export interface SearchEntry {
  title: string;
  description: string;
  category: string;
  url: string;
  keywords: string[];
}

// Sprint 1 先索引当前已经存在的页面。后续新闻、通知和活动的数据模型
// 会在构建时汇入这里，不需要为搜索功能单独维护数据库。
export const searchEntries: SearchEntry[] = [
  {
    title: '首页 | 武科大人工智能学院科协',
    description: '武科大人工智能学院学生科协首页。',
    category: '主页',
    url: withBase(),
    keywords: ['科协', '自动化', '人工智能', 'ASAW', '武汉科技大学'],
  },
  {
    title: '文档中心',
    description: '了解学院学生科协、文档中心及项目反馈方式。',
    category: '文档',
    url: withBase('/docs/'),
    keywords: ['文档', '资料', '帮助', 'Issue', 'Vibe Coding'],
  },
  {
    title: 'VS Code：从打开文件夹开始',
    description:
      '认识 VS Code 的基本界面，并学习打开项目、查找文件、使用终端和安装扩展。',
    category: '学习资料',
    url: withBase('/docs/learning/basic-tools/vscode/'),
    keywords: ['VS Code', '编辑器', '工作区', '扩展', '终端'],
  },
  {
    title: 'Git 与 GitHub：保存并协作',
    description: '用 Git 记录代码变化，并通过 GitHub 备份项目和开展协作。',
    category: '学习资料',
    url: withBase('/docs/learning/basic-tools/git-github/'),
    keywords: ['Git', 'GitHub', '版本控制', '分支', '协作'],
  },
  {
    title: 'CMake：组织 C/C++ 构建',
    description: '认识 CMake 的作用，并用最小项目生成和执行一次构建。',
    category: '学习资料',
    url: withBase('/docs/learning/basic-tools/cmake/'),
    keywords: ['CMake', 'C++', '构建', '编译'],
  },
  {
    title: '容器：获得一致的运行环境',
    description: '认识镜像和容器，并理解容器适合解决什么问题。',
    category: '学习资料',
    url: withBase('/docs/learning/basic-tools/containers/'),
    keywords: ['容器', 'Docker', '镜像', '运行环境'],
  },
  {
    title: '包管理器：安装和记录依赖',
    description: '了解包管理器、依赖清单和锁文件之间的关系。',
    category: '学习资料',
    url: withBase('/docs/learning/basic-tools/package-managers/'),
    keywords: ['包管理器', '依赖', 'npm', 'pnpm', 'pip', 'vcpkg'],
  },
  {
    title: '服务中心',
    description: '学院学生科协的独立服务入口，具体服务将在后续 Sprint 中实现。',
    category: '服务',
    url: withBase('/services/'),
    keywords: ['服务', '办事', '帮助', '科协服务'],
  },
  {
    title: '学生科协及其部门介绍',
    description: '学院学生科协以及科创部、赛事部和运维部的工作介绍。',
    category: '科协简介',
    url: `${withBase()}#departments`,
    keywords: ['科协', '组织', '竞赛牵引', '项目驱动', '平台支撑'],
  },
  {
    title: '科创部',
    description: '负责大创与科研立项、申报培训、中期检查和结项辅助。',
    category: '部门',
    url: `${withBase()}#departments`,
    keywords: ['大创', '科研', '立项', '申报', '结项'],
  },
  {
    title: '赛事部',
    description: '负责院级赛事、重点赛事联络和参赛经验传承。',
    category: '部门',
    url: `${withBase()}#departments`,
    keywords: ['科协杯', '竞赛', '报名', '赛事'],
  },
  {
    title: '运维部',
    description: '负责双创审核、常见问题答疑、活动记录和内容维护。',
    category: '部门',
    url: `${withBase()}#departments`,
    keywords: ['双创', '审核', 'FAQ', '答疑', '简讯'],
  },
  {
    title: '加入我们',
    description: '学院学生科协招新与参与方式。',
    category: '加入科协',
    url: `${withBase()}#services`,
    keywords: ['招新', '加入', '成员', '科协干事'],
  },
  {
    title: '联系我们',
    description: '赛事、大创、双创系统与科协活动咨询入口。',
    category: '联系',
    url: `${withBase()}#contact`,
    keywords: ['咨询', '答疑', '联系', '邮箱', 'QQ'],
  },
];
