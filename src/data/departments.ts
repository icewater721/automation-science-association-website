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
    summary: '陪伴创意从申报走向落地，为长周期科创项目提供节点化服务。',
    responsibilities: [
      '大创与科研立项跟进',
      '项目申报培训与经验分享',
      '中期检查与结项辅助',
    ],
  },
  {
    code: '02',
    name: '赛事部',
    englishName: 'Competition',
    summary: '连接赛事信息、参赛队伍与现场执行，让更多同学找到起步的入口。',
    responsibilities: [
      '院级赛事策划与组织',
      '重点赛事通知与联络',
      '往届经验传承与答疑',
    ],
  },
  {
    code: '03',
    name: '运维部',
    englishName: 'Operations',
    summary: '维护科协的日常服务与内容积累，让信息流转更清晰、响应更及时。',
    responsibilities: [
      '双创系统日常审核',
      '常见问题整理与答疑',
      '活动记录、简讯与内容维护',
    ],
  },
];
