/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/21/2017 11:24:51 AM                        */
/*==============================================================*/


drop table if exists TAB_ACCOUNT;

drop table if exists TAB_ADGROUP;

drop table if exists TAB_ADG_ADP;

drop table if exists TAB_ADVERTISER;

drop table if exists TAB_AD_PLAN;

drop table if exists TAB_AD_PLAN_LOG;

drop table if exists TAB_AD_POSITION;

drop table if exists TAB_CREATIVE;

drop table if exists TAB_CREATIVE_LOG;

drop table if exists TAB_DICTIONARY;

drop table if exists TAB_DICT_CREATIVE;

drop table if exists TAB_EXTRA_TRACK_LINK;

drop table if exists TAB_MATERIAL;

drop table if exists TAB_OFFER;

drop table if exists TAB_OFFER_CITY;

drop table if exists TAB_PRODUCT;

drop table if exists TAB_ROLE;

drop table if exists TAB_STRATEGY;

drop table if exists TAB_STRATEGY_CITY;

drop table if exists TAB_TRACK_LINK;

/*==============================================================*/
/* Table: TAB_ACCOUNT                                           */
/*==============================================================*/
create table TAB_ACCOUNT
(
   ACCOUNT_ID           int not null auto_increment comment '账户ID',
   ACCOUNT_EMAIL        varchar(60) comment '账户邮箱',
   ACCOUNT_NAME         varchar(50) comment '账户简称',
   ACCOUNT_PWD          varchar(60) comment '密码',
   ACCOUNT_STATUS       varchar(10) default 'disable' comment '状态',
   ACCOUNT_ROLE_ID      int comment '角色ID',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           char(19) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ACCOUNT_ID)
);

alter table TAB_ACCOUNT comment '账户表';

/*==============================================================*/
/* Table: TAB_ADGROUP                                           */
/*==============================================================*/
create table TAB_ADGROUP
(
   ADGROUP_ID           int not null auto_increment comment '广告组id',
   ADGROUP_NAME         varchar(50) comment '广告组名称',
   ADPLAN_ID            int not null comment '广告计划id',
   CREATIVE_ID          int not null comment '创意id',
   TRACKLINK_ID         int not null comment '投放链接id',
   STRATEGY_ID          int not null comment '策略id',
   DAY_BUDGET           double comment '日预算',
   BUDGET_STRATEGY_TYPE varchar(10) comment '预算策略类型',
   TIME_FRAME           varchar(10) comment '时间段',
   PRICE_STRATEGY       varchar(10) comment '出价策略',
   PRICE_OVERFLOW       int comment '溢出出价',
   PRICE_MAX_CPM        double comment '最高CPM价格',
   PRICE_TARGET_CPC     double comment '目标CPC价格',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ADGROUP_ID)
);

alter table TAB_ADGROUP comment '广告组';

/*==============================================================*/
/* Table: TAB_ADG_ADP                                           */
/*==============================================================*/
create table TAB_ADG_ADP
(
   ADG_ADP_ID           int not null auto_increment comment '广告组-广告位id',
   ADG_ID               int not null comment '广告组id',
   ADP_ID               varchar(32) not null comment '广告位id',
   FIX_PRICE            double comment '固定价格',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ADG_ADP_ID)
);

alter table TAB_ADG_ADP comment '广告组-广告位表';

/*==============================================================*/
/* Table: TAB_ADVERTISER                                        */
/*==============================================================*/
create table TAB_ADVERTISER
(
   AD_ID                int not null auto_increment comment '广告主id',
   ACCOUNT_ID           int not null comment '账户id',
   AD_COMPANY_NAME      varchar(60) comment '公司名称',
   AD_COMPANY_ADDR      varchar(150) comment '公司地址',
   AD_CONTACT_NAME      varchar(30) comment '联系人',
   AD_CONTACT_TEL       varchar(30) comment '联系电话',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (AD_ID)
);

alter table TAB_ADVERTISER comment '广告主表';

/*==============================================================*/
/* Table: TAB_AD_PLAN                                           */
/*==============================================================*/
create table TAB_AD_PLAN
(
   ADPLAN_ID            int not null auto_increment comment '广告计划ID',
   PRODUCT_ID           int not null comment '产品ID',
   ADVERTISER_ID        int not null comment '广告主ID',
   ADPLAN_NAME          varchar(100) not null comment '广告计划名称',
   ADPLAN_START_DATE    varchar(10) not null comment '广告计划开始时间',
   ADPLAN_END_DATE      varchar(10) comment '广告计划结束时间',
   ADPLAN_PAY_TYPE      varchar(10) comment '广告计划结算方式',
   ADPLAN_TOTAL_BUDGET  double comment '广告计划总预算',
   ADPLAN_STATUS        varchar(10) comment '广告计划状态（active、pause）',
   ADPLAN_DCP           varchar(500) comment '广告计划描述',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) default 'mc_v1.0' comment 'mc版本（default值： mc_v1.0 ）',
   primary key (ADPLAN_ID)
);

alter table TAB_AD_PLAN comment '广告计划';

/*==============================================================*/
/* Table: TAB_AD_PLAN_LOG                                       */
/*==============================================================*/
create table TAB_AD_PLAN_LOG
(
   ADPLANLOG_ID         int not null auto_increment comment '操作日志记录ID',
   ADPLANLOG_TIME       char(19) not null comment '操作日志时间',
   ADPLANLOG_OPERATOR   int not null comment '操作人',
   ADPLAN_ID            int not null comment '操作日志ID',
   ADPLANLOG_TYPE       int not null comment '操作类型',
   ADPLANLOG_RESULT     int not null comment '操作结果',
   ADPLANLOG_RESULT_VALUE varchar(60) comment '操作结果值',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ADPLANLOG_ID)
);

alter table TAB_AD_PLAN_LOG comment '广告计划操作记录表';

/*==============================================================*/
/* Table: TAB_AD_POSITION                                       */
/*==============================================================*/
create table TAB_AD_POSITION
(
   ADP_ID               char(32) not null comment '广告位id',
   ADP_APP_ID           char(32) comment 'appid',
   ADP_NAME             varchar(100) comment '广告位名称',
   ADP_APP_NAME         varchar(100) comment 'app名称',
   ADP_TYPE             varchar(50) comment '广告位类型',
   FLOOR_PRICE          double comment '底价',
   ADP_SIZE             varchar(100) comment '尺寸大小',
   ADP_MATERIAL_TYPE    varchar(100) comment '素材类型',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ADP_ID)
);

alter table TAB_AD_POSITION comment '广告位';

/*==============================================================*/
/* Table: TAB_CREATIVE                                          */
/*==============================================================*/
create table TAB_CREATIVE
(
   CREATIVE_ID          int not null auto_increment comment '创意ID',
   PRODUCT_ID           int comment '产品ID',
   CREATIVE_NAME        varchar(50) comment '创意名称',
   CREATIVE_UPLOADER    int comment '创意上传者email',
   CREATIVE_STATUS      int comment '创意状态： 待审核waiting 审核通过passed 审核未通过refused',
   CREATIVE_TAG         int comment '创意标签',
   CREATIVE_LEVEL       int comment '创意分级 1,2,3',
   CREATIVE_CREATED     varchar(19) comment '创建时间',
   CREATIVE_MODIFIED    varchar(19) comment '修改时间',
   primary key (CREATIVE_ID)
);

alter table TAB_CREATIVE comment '创意表';

/*==============================================================*/
/* Table: TAB_CREATIVE_LOG                                      */
/*==============================================================*/
create table TAB_CREATIVE_LOG
(
   CREATIVELOG_ID       int not null auto_increment comment '操作日志ID',
   CREATIVE_ID          int comment '创意ID',
   CREATIVELOG_TYPE     int comment '操作类型(上传创意(''upload'') 编辑创意(''edit'') 审核创意(''audit'') 合并创意(''merge''))',
   CREATIVELOG_EMAIL    int comment '操作者email',
   CREATIVELOG_DATE     varchar(19) comment '操作时间',
   CREATIVELOG_RESULT   int comment '操作结果',
   primary key (CREATIVELOG_ID)
);

alter table TAB_CREATIVE_LOG comment '创意操作日志表';

/*==============================================================*/
/* Table: TAB_DICTIONARY                                        */
/*==============================================================*/
create table TAB_DICTIONARY
(
   DICT_ID              int not null auto_increment comment '数据字典ID',
   DICT_NO              varchar(18) comment '数据字典编号(每三位为一个层级)',
   DICT_NAME            varchar(100) comment '数据字典名称',
   DICT_PARENT_NO       varchar(15) comment '数据字典父编码',
   DICT_STATUS          varchar(10) not null comment '数据字典状态（disable, enable）',
   primary key (DICT_ID)
);

alter table TAB_DICTIONARY comment '数据字典表';

/*==============================================================*/
/* Table: TAB_DICT_CREATIVE                                     */
/*==============================================================*/
create table TAB_DICT_CREATIVE
(
   DC_ID                int not null auto_increment comment '主键ID',
   DICT_ID              int comment '数据字典ID',
   CREATIVE_ID          int comment '创意ID',
   DC_CREATED           char(19) comment '创建时间',
   DC_CREATER           int comment '创建人',
   DC_MODIFIED          char(19) comment '修改时间',
   DC_MODIFIER          int comment '修改人',
   DC_ISDEL             int comment '是否删除（1 是，0否）',
   primary key (DC_ID)
);

alter table TAB_DICT_CREATIVE comment '标签-创意表';

/*==============================================================*/
/* Table: TAB_EXTRA_TRACK_LINK                                  */
/*==============================================================*/
create table TAB_EXTRA_TRACK_LINK
(
   ETRACKLINK_ID        int not null auto_increment comment '额外链接id',
   ADGROUP_ID           int not null comment '广告组id',
   ETRACKLINK_TYPE      varchar(10) comment '额外链接类型',
   ETRACKLINK_VALUE     varchar(500) comment '额外链接值',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ETRACKLINK_ID)
);

/*==============================================================*/
/* Table: TAB_MATERIAL                                          */
/*==============================================================*/
create table TAB_MATERIAL
(
   MATERIAL_ID          int not null auto_increment comment '素材ID',
   CREATIVE_ID          int comment '创意ID',
   MATERIAL_NO          varchar(32) not null comment '素材编号',
   MATERIAL_TYPE        varchar(10) comment '素材类型(txt/pic/vid/sud)',
   MATERIAL_TITLE       varchar(100) comment '文本标题',
   MATERIAL_WIDTH       int comment '图片长度',
   MATERIAL_HEIGHT      int comment '图片高度',
   MATERIAL_DURATION    int comment '播放时长',
   MATERIAL_URL         varchar(500) comment '素材地址',
   MATERIAL_DESC        varchar(2000) comment '素材描述',
   MATERIAL_ISDEL       int comment '是否删除（0 否，1是）',
   MATERIAL_CREATED     varchar(19) comment '创建时间',
   MATERIAL_MODIFIED    varchar(19) comment '修改时间',
   MATERIAL_CREATER     int comment '上传者',
   MATERIAL_MODIFIER    int comment '关联创意者',
   primary key (MATERIAL_ID)
);

alter table TAB_MATERIAL comment '素材表';

/*==============================================================*/
/* Table: TAB_OFFER                                             */
/*==============================================================*/
create table TAB_OFFER
(
   OFFER_ID             int not null auto_increment comment '订单id',
   PRODUCT_ID           int not null comment '产品id',
   ADVERTISER_ID        int comment '广告主账号id',
   OFFER_NAME           varchar(400) character set utf8 not null comment '订单名称',
   OFFER_CLICK_TL       varchar(1000) not null comment '监测方给MC的追踪链接',
   OFFER_S_DATE         varchar(50) not null comment '开始日期',
   OFFER_E_DATE         varchar(50) default '2030-01-01' comment '结束日期',
   OFFER_EARNING_T      varchar(50) not null default 'CPA' comment '结算方式',
   OFFER_EARNING_C      varchar(50) not null default 'CNY' comment '结算币种',
   OFFER_EARNING_N      varchar(50) not null comment '结算单价',
   OFFER_E_EXPEND_T     varchar(50) default 'CPA' comment '放出方式',
   OFFER_E_EXPEND_C     varchar(50) default 'CNY' comment '放出币种',
   OFFER_E_EXPEND_N     varchar(50) comment '放出单价',
   OFFER_DAY_CAP        int comment '总量级',
   OFFER_ACTIVE_EVENT   varchar(50) not null default 'fopen' comment '激活事件',
   OFFER_DEVICE_TYPE    varchar(10) comment '(Phone、Pad)',
   OFFER_OS_HVERSION    varchar(10) comment '系统最高版本',
   OFFER_OS_LVERSION    varchar(10) comment '系统最低版本',
   OFFER_DCP            varchar(800) comment '描述',
   OFFER_STATUS         varchar(50) not null default 'private' comment '订单状态（public、private、pause）',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (OFFER_ID)
);

alter table TAB_OFFER comment '订单表';

/*==============================================================*/
/* Table: TAB_OFFER_CITY                                        */
/*==============================================================*/
create table TAB_OFFER_CITY
(
   OFFERCITY_ID         int not null auto_increment comment '订单城市id',
   OFFER_ID             int not null comment '订单id',
   CITY_ID              int not null comment '城市id',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           char(19) not null default 'mc_v1.0' comment 'mc版本',
   primary key (OFFERCITY_ID)
);

alter table TAB_OFFER_CITY comment '订单-城市表';

/*==============================================================*/
/* Table: TAB_PRODUCT                                           */
/*==============================================================*/
create table TAB_PRODUCT
(
   PRODUCT_ID           int not null auto_increment comment '产品id',
   PRODUCT_NAME         varchar(400) character set utf8 not null comment '产品名称',
   PRODUCT_TYPE         varchar(50) not null default 'Mobile Apps' comment '类型',
   PRODUCT_OS           varchar(255) not null default 'iOS' comment '系统平台',
   PRODUCT_LP           varchar(1000)  not null comment '落地页',
   PRODUCT_DCP          varchar(800) character set utf8 comment '描述',
   PRODUCT_APP_PACKAGE  varchar(400) comment '产品的appid',
   PRODUCT_STATUS       varchar(50) not null default 'active' comment '产品的状态',
   PRODUCT_ICON_URL     varchar(500) comment '图标url',
   PRODUCT_CREATE_TIME  varchar(19) comment '创建时间',
   PRODUCT_CREATER      int comment '创建人',
   PRODUCT_MODIFY_TIME  varchar(19) comment '修改时间',
   PRODUCT_MODIFIER     int comment '修改人',
   primary key (PRODUCT_ID)
);

alter table TAB_PRODUCT comment '产品表';

/*==============================================================*/
/* Table: TAB_ROLE                                              */
/*==============================================================*/
create table TAB_ROLE
(
   ROLE_ID              int not null auto_increment comment '角色id',
   ROLE_NAME            varchar(100) not null comment '角色名称',
   ROLE_PARENT_ID       int not null comment '父角色id',
   ROLE_STATUS          varchar(10) comment '角色状态',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           char(19) not null default 'mc_v1.0' comment 'mc版本',
   primary key (ROLE_ID)
);

alter table TAB_ROLE comment '角色表';

/*==============================================================*/
/* Table: TAB_STRATEGY                                          */
/*==============================================================*/
create table TAB_STRATEGY
(
   STRATEGY_ID          int not null auto_increment comment '策略id',
   DEVICE_TYPE          varchar(50) comment '设备类型',
   MINOSV               varchar(10) comment '最低系统版本',
   MAXOSV               varchar(10) comment '最高系统版本',
   CONNECTION_TYPE      varchar(50) comment '网络环境',
   PARA_VALIDATION      varchar(50) comment '参数验证',
   FREQUENCY_PARA       varchar(10) comment '频控参数',
   FREQUENCY_INTERVAL   int comment '频控间隔',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (STRATEGY_ID)
);

alter table TAB_STRATEGY comment '广告投放策略';

/*==============================================================*/
/* Table: TAB_STRATEGY_CITY                                     */
/*==============================================================*/
create table TAB_STRATEGY_CITY
(
   STRA_CITY_ID         int not null auto_increment comment '策略-城市id',
   STRATEGY_ID          int not null comment '策略id',
   CITY_ID              int not null comment '城市id',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (STRA_CITY_ID)
);

/*==============================================================*/
/* Table: TAB_TRACK_LINK                                        */
/*==============================================================*/
create table TAB_TRACK_LINK
(
   TRACKLINK_ID         int not null auto_increment comment '投放链接id',
   PRODUCT_ID           int not null comment '产品id',
   ADVERTISER_ID        int not null comment '广告主id',
   TRACKLINK_NAME       varchar(100) comment '投放链接名称',
   IMP_LINK             varchar(500) comment '展示链接',
   CLICK_LINK           varchar(500) comment '点击链接',
   MODE                 int comment 'mode',
   IMP_SYN_TYPE         varchar(10) comment '展示同步方式',
   CLICK_SYN_TYPE       varchar(10) comment '点击同步方式',
   CREATE_TIME          char(19) not null comment '创建时间',
   UPDATE_TIME          char(19) comment '修改时间',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc版本',
   primary key (TRACKLINK_ID)
);

alter table TAB_TRACK_LINK comment '追踪链接';

alter table TAB_ACCOUNT add constraint FK_REFERENCE_12 foreign key (ACCOUNT_ROLE_ID)
      references TAB_ROLE (ROLE_ID) on delete restrict on update restrict;

alter table TAB_ADGROUP add constraint FK_REFERENCE_13 foreign key (STRATEGY_ID)
      references TAB_STRATEGY (STRATEGY_ID) on delete restrict on update restrict;

alter table TAB_ADGROUP add constraint FK_REFERENCE_14 foreign key (TRACKLINK_ID)
      references TAB_TRACK_LINK (TRACKLINK_ID) on delete restrict on update restrict;

alter table TAB_ADG_ADP add constraint FK_REFERENCE_16 foreign key (ADG_ID)
      references TAB_ADGROUP (ADGROUP_ID) on delete restrict on update restrict;

alter table TAB_ADG_ADP add constraint FK_REFERENCE_17 foreign key (ADP_ID)
      references TAB_AD_POSITION (ADP_ID) on delete restrict on update restrict;

alter table TAB_ADVERTISER add constraint FK_REFERENCE_11 foreign key (ACCOUNT_ID)
      references TAB_ACCOUNT (ACCOUNT_ID) on delete restrict on update restrict;

alter table TAB_AD_PLAN_LOG add constraint FK_REFERENCE_8 foreign key (ADPLAN_ID)
      references TAB_AD_PLAN (ADPLAN_ID) on delete restrict on update restrict;

alter table TAB_CREATIVE add constraint FK_REFERENCE_3 foreign key (CREATIVE_TAG)
      references TAB_DICTIONARY (DICT_ID) on delete restrict on update restrict;

alter table TAB_CREATIVE add constraint FK_REFERENCE_6 foreign key (PRODUCT_ID)
      references TAB_PRODUCT (PRODUCT_ID) on delete restrict on update restrict;

alter table TAB_CREATIVE_LOG add constraint FK_REFERENCE_2 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

alter table TAB_DICT_CREATIVE add constraint FK_REFERENCE_4 foreign key (DICT_ID)
      references TAB_DICTIONARY (DICT_ID) on delete restrict on update restrict;

alter table TAB_DICT_CREATIVE add constraint FK_REFERENCE_5 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

alter table TAB_EXTRA_TRACK_LINK add constraint FK_REFERENCE_15 foreign key (ADGROUP_ID)
      references TAB_ADGROUP (ADGROUP_ID) on delete restrict on update restrict;

alter table TAB_MATERIAL add constraint FK_REFERENCE_1 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

alter table TAB_OFFER add constraint FK_REFERENCE_9 foreign key (PRODUCT_ID)
      references TAB_PRODUCT (PRODUCT_ID) on delete restrict on update restrict;

alter table TAB_OFFER_CITY add constraint FK_REFERENCE_10 foreign key (OFFER_ID)
      references TAB_OFFER (OFFER_ID) on delete restrict on update restrict;

alter table TAB_PRODUCT add constraint FK_REFERENCE_7 foreign key (PRODUCT_CREATER)
      references TAB_ACCOUNT (ACCOUNT_ID) on delete restrict on update restrict;

alter table TAB_STRATEGY_CITY add constraint FK_REFERENCE_18 foreign key (STRATEGY_ID)
      references TAB_STRATEGY (STRATEGY_ID) on delete restrict on update restrict;

