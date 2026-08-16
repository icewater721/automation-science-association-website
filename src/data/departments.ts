export interface Department {
  code: string;
  name: string;
  englishName: string;
  summary: string;
  responsibilities: string[];
}

export const departments: Department[] = [
  {
    code: '01',
    name: '科创部',
    englishName: 'Innovation',
    summary: '服务大创与科研项目全过程，帮助同学完成申报、推进与结项。',
    responsibilities: ['项目申报与经验分享', '中期检查与结项服务'],
  },
  {
    code: '02',
    name: '赛事部',
    englishName: 'Competition',
    summary: '组织院级科创赛事，传递重点赛事信息，帮助参赛同学快速起步。',
    responsibilities: ['院级赛事策划与执行', '重点赛事联络与答疑'],
  },
  {
    code: '03',
    name: '运维部',
    englishName: 'Operations',
    summary: '维护双创审核、答疑与活动内容，让科协服务稳定、信息清晰。',
    responsibilities: ['双创审核与问题答疑', '活动记录与内容维护'],
  },
];
