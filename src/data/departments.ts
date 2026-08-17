export interface Department {
  code: string;
  name: string;
  englishName: string;
  mission: string;
  summary: string;
  responsibilities: string[];
}

export const departments: Department[] = [
  {
    code: '01',
    name: '科创部',
    englishName: 'Innovation',
    mission: '服务大创与科研项目全过程，',
    summary: '帮助同学完成从申报到结项的全流程支持。',
    responsibilities: [
      '跟进大创、科研立项等长周期项目，做好申报提醒、中期检查和结项辅助',
      '每学期组织项目申报培训或经验分享会，邀请有经验的学长学姐现场答疑',
      '管理科创成果数据库，归档近三年参赛与获奖数据，为综测加分、评奖评优提供支撑',
    ],
  },
  {
    code: '02',
    name: '赛事部',
    englishName: 'Competition',
    mission: '负责院级赛事的策划与执行，',
    summary: '同时对接校级及以上重点赛事（挑战杯、互联网+等）。',
    responsibilities: [
      '策划并执行“科协杯”等院级赛事，从报名、现场组织到结果公示全程负责',
      '及时转发校级及以上赛事通知，组建院级联络群，确保信息不遗漏',
      '引入“老带新”辅导机制：邀请往届获奖者给参赛队伍做集中答疑和经验分享',
    ],
  },
  {
    code: '03',
    name: '运维部',
    englishName: 'Operation',
    mission: '负责双创系统日常审核与平台运维，',
    summary: '同时承担活动记录、数据整理和宣传支持工作。',
    responsibilities: [
      '双创系统审核“日清周结”，确保一般申请 2 个工作日内反馈',
      '活动拍照、简讯撰写（每场活动后 3 天内出稿）',
      '运营答疑群，整理常见问题 FAQ，减少重复咨询',
      '每学期收集同类院校公开获奖数据，形成《对标分析简报》',
      '维护成员成长档案，全员建档、学期末集中更新',
    ],
  },
];
