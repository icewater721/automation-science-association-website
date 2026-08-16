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
];
