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
    title: '武汉科技大学人工智能与自动化学院科协',
    description: '学院科学技术协会门户网站主页。',
    category: '主页',
    url: '/',
    keywords: ['科协', '自动化', '人工智能', 'ASAW', '武汉科技大学'],
  },
  {
    title: '文档中心',
    description: '学院学生科协的文档入口，正式内容将在后续 Sprint 中实现。',
    category: '文档',
    url: '/docs/',
    keywords: ['文档', '资料', '帮助'],
  },
  {
    title: '学生科协及其部门介绍',
    description: '学院学生科协以及科创部、赛事部和运维部的工作介绍。',
    category: '科协简介',
    url: '/#departments',
    keywords: ['科协', '组织', '竞赛牵引', '项目驱动', '平台支撑'],
  },
  {
    title: '科创部',
    description: '负责大创与科研立项、申报培训、中期检查和结项辅助。',
    category: '部门',
    url: '/#departments',
    keywords: ['大创', '科研', '立项', '申报', '结项'],
  },
  {
    title: '赛事部',
    description: '负责院级赛事、重点赛事联络和参赛经验传承。',
    category: '部门',
    url: '/#departments',
    keywords: ['科协杯', '竞赛', '报名', '赛事'],
  },
  {
    title: '运维部',
    description: '负责双创审核、常见问题答疑、活动记录和内容维护。',
    category: '部门',
    url: '/#departments',
    keywords: ['双创', '审核', 'FAQ', '答疑', '简讯'],
  },
  {
    title: '加入我们',
    description: '学院学生科协招新与参与方式。',
    category: '加入科协',
    url: '/#join',
    keywords: ['招新', '加入', '成员', '科协干事'],
  },
  {
    title: '联系我们',
    description: '赛事、大创、双创系统与科协活动咨询入口。',
    category: '联系',
    url: '/#contact',
    keywords: ['咨询', '答疑', '联系', '邮箱', 'QQ'],
  },
];
