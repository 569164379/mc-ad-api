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
   ACCOUNT_ID           int not null auto_increment comment '�˻�ID',
   ACCOUNT_EMAIL        varchar(60) comment '�˻�����',
   ACCOUNT_NAME         varchar(50) comment '�˻����',
   ACCOUNT_PWD          varchar(60) comment '����',
   ACCOUNT_STATUS       varchar(10) default 'disable' comment '״̬',
   ACCOUNT_ROLE_ID      int comment '��ɫID',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           char(19) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ACCOUNT_ID)
);

alter table TAB_ACCOUNT comment '�˻���';

/*==============================================================*/
/* Table: TAB_ADGROUP                                           */
/*==============================================================*/
create table TAB_ADGROUP
(
   ADGROUP_ID           int not null auto_increment comment '�����id',
   ADGROUP_NAME         varchar(50) comment '���������',
   ADPLAN_ID            int not null comment '���ƻ�id',
   CREATIVE_ID          int not null comment '����id',
   TRACKLINK_ID         int not null comment 'Ͷ������id',
   STRATEGY_ID          int not null comment '����id',
   DAY_BUDGET           double comment '��Ԥ��',
   BUDGET_STRATEGY_TYPE varchar(10) comment 'Ԥ���������',
   TIME_FRAME           varchar(10) comment 'ʱ���',
   PRICE_STRATEGY       varchar(10) comment '���۲���',
   PRICE_OVERFLOW       int comment '�������',
   PRICE_MAX_CPM        double comment '���CPM�۸�',
   PRICE_TARGET_CPC     double comment 'Ŀ��CPC�۸�',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ADGROUP_ID)
);

alter table TAB_ADGROUP comment '�����';

/*==============================================================*/
/* Table: TAB_ADG_ADP                                           */
/*==============================================================*/
create table TAB_ADG_ADP
(
   ADG_ADP_ID           int not null auto_increment comment '�����-���λid',
   ADG_ID               int not null comment '�����id',
   ADP_ID               varchar(32) not null comment '���λid',
   FIX_PRICE            double comment '�̶��۸�',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ADG_ADP_ID)
);

alter table TAB_ADG_ADP comment '�����-���λ��';

/*==============================================================*/
/* Table: TAB_ADVERTISER                                        */
/*==============================================================*/
create table TAB_ADVERTISER
(
   AD_ID                int not null auto_increment comment '�����id',
   ACCOUNT_ID           int not null comment '�˻�id',
   AD_COMPANY_NAME      varchar(60) comment '��˾����',
   AD_COMPANY_ADDR      varchar(150) comment '��˾��ַ',
   AD_CONTACT_NAME      varchar(30) comment '��ϵ��',
   AD_CONTACT_TEL       varchar(30) comment '��ϵ�绰',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (AD_ID)
);

alter table TAB_ADVERTISER comment '�������';

/*==============================================================*/
/* Table: TAB_AD_PLAN                                           */
/*==============================================================*/
create table TAB_AD_PLAN
(
   ADPLAN_ID            int not null auto_increment comment '���ƻ�ID',
   PRODUCT_ID           int not null comment '��ƷID',
   ADVERTISER_ID        int not null comment '�����ID',
   ADPLAN_NAME          varchar(100) not null comment '���ƻ�����',
   ADPLAN_START_DATE    varchar(10) not null comment '���ƻ���ʼʱ��',
   ADPLAN_END_DATE      varchar(10) comment '���ƻ�����ʱ��',
   ADPLAN_PAY_TYPE      varchar(10) comment '���ƻ����㷽ʽ',
   ADPLAN_TOTAL_BUDGET  double comment '���ƻ���Ԥ��',
   ADPLAN_STATUS        varchar(10) comment '���ƻ�״̬��active��pause��',
   ADPLAN_DCP           varchar(500) comment '���ƻ�����',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) default 'mc_v1.0' comment 'mc�汾��defaultֵ�� mc_v1.0 ��',
   primary key (ADPLAN_ID)
);

alter table TAB_AD_PLAN comment '���ƻ�';

/*==============================================================*/
/* Table: TAB_AD_PLAN_LOG                                       */
/*==============================================================*/
create table TAB_AD_PLAN_LOG
(
   ADPLANLOG_ID         int not null auto_increment comment '������־��¼ID',
   ADPLANLOG_TIME       char(19) not null comment '������־ʱ��',
   ADPLANLOG_OPERATOR   int not null comment '������',
   ADPLAN_ID            int not null comment '������־ID',
   ADPLANLOG_TYPE       int not null comment '��������',
   ADPLANLOG_RESULT     int not null comment '�������',
   ADPLANLOG_RESULT_VALUE varchar(60) comment '�������ֵ',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ADPLANLOG_ID)
);

alter table TAB_AD_PLAN_LOG comment '���ƻ�������¼��';

/*==============================================================*/
/* Table: TAB_AD_POSITION                                       */
/*==============================================================*/
create table TAB_AD_POSITION
(
   ADP_ID               char(32) not null comment '���λid',
   ADP_APP_ID           char(32) comment 'appid',
   ADP_NAME             varchar(100) comment '���λ����',
   ADP_APP_NAME         varchar(100) comment 'app����',
   ADP_TYPE             varchar(50) comment '���λ����',
   FLOOR_PRICE          double comment '�׼�',
   ADP_SIZE             varchar(100) comment '�ߴ��С',
   ADP_MATERIAL_TYPE    varchar(100) comment '�ز�����',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ADP_ID)
);

alter table TAB_AD_POSITION comment '���λ';

/*==============================================================*/
/* Table: TAB_CREATIVE                                          */
/*==============================================================*/
create table TAB_CREATIVE
(
   CREATIVE_ID          int not null auto_increment comment '����ID',
   PRODUCT_ID           int comment '��ƷID',
   CREATIVE_NAME        varchar(50) comment '��������',
   CREATIVE_UPLOADER    int comment '�����ϴ���email',
   CREATIVE_STATUS      int comment '����״̬�� �����waiting ���ͨ��passed ���δͨ��refused',
   CREATIVE_TAG         int comment '�����ǩ',
   CREATIVE_LEVEL       int comment '����ּ� 1,2,3',
   CREATIVE_CREATED     varchar(19) comment '����ʱ��',
   CREATIVE_MODIFIED    varchar(19) comment '�޸�ʱ��',
   primary key (CREATIVE_ID)
);

alter table TAB_CREATIVE comment '�����';

/*==============================================================*/
/* Table: TAB_CREATIVE_LOG                                      */
/*==============================================================*/
create table TAB_CREATIVE_LOG
(
   CREATIVELOG_ID       int not null auto_increment comment '������־ID',
   CREATIVE_ID          int comment '����ID',
   CREATIVELOG_TYPE     int comment '��������(�ϴ�����(''upload'') �༭����(''edit'') ��˴���(''audit'') �ϲ�����(''merge''))',
   CREATIVELOG_EMAIL    int comment '������email',
   CREATIVELOG_DATE     varchar(19) comment '����ʱ��',
   CREATIVELOG_RESULT   int comment '�������',
   primary key (CREATIVELOG_ID)
);

alter table TAB_CREATIVE_LOG comment '���������־��';

/*==============================================================*/
/* Table: TAB_DICTIONARY                                        */
/*==============================================================*/
create table TAB_DICTIONARY
(
   DICT_ID              int not null auto_increment comment '�����ֵ�ID',
   DICT_NO              varchar(18) comment '�����ֵ���(ÿ��λΪһ���㼶)',
   DICT_NAME            varchar(100) comment '�����ֵ�����',
   DICT_PARENT_NO       varchar(15) comment '�����ֵ丸����',
   DICT_STATUS          varchar(10) not null comment '�����ֵ�״̬��disable, enable��',
   primary key (DICT_ID)
);

alter table TAB_DICTIONARY comment '�����ֵ��';

/*==============================================================*/
/* Table: TAB_DICT_CREATIVE                                     */
/*==============================================================*/
create table TAB_DICT_CREATIVE
(
   DC_ID                int not null auto_increment comment '����ID',
   DICT_ID              int comment '�����ֵ�ID',
   CREATIVE_ID          int comment '����ID',
   DC_CREATED           char(19) comment '����ʱ��',
   DC_CREATER           int comment '������',
   DC_MODIFIED          char(19) comment '�޸�ʱ��',
   DC_MODIFIER          int comment '�޸���',
   DC_ISDEL             int comment '�Ƿ�ɾ����1 �ǣ�0��',
   primary key (DC_ID)
);

alter table TAB_DICT_CREATIVE comment '��ǩ-�����';

/*==============================================================*/
/* Table: TAB_EXTRA_TRACK_LINK                                  */
/*==============================================================*/
create table TAB_EXTRA_TRACK_LINK
(
   ETRACKLINK_ID        int not null auto_increment comment '��������id',
   ADGROUP_ID           int not null comment '�����id',
   ETRACKLINK_TYPE      varchar(10) comment '������������',
   ETRACKLINK_VALUE     varchar(500) comment '��������ֵ',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ETRACKLINK_ID)
);

/*==============================================================*/
/* Table: TAB_MATERIAL                                          */
/*==============================================================*/
create table TAB_MATERIAL
(
   MATERIAL_ID          int not null auto_increment comment '�ز�ID',
   CREATIVE_ID          int comment '����ID',
   MATERIAL_NO          varchar(32) not null comment '�زı��',
   MATERIAL_TYPE        varchar(10) comment '�ز�����(txt/pic/vid/sud)',
   MATERIAL_TITLE       varchar(100) comment '�ı�����',
   MATERIAL_WIDTH       int comment 'ͼƬ����',
   MATERIAL_HEIGHT      int comment 'ͼƬ�߶�',
   MATERIAL_DURATION    int comment '����ʱ��',
   MATERIAL_URL         varchar(500) comment '�زĵ�ַ',
   MATERIAL_DESC        varchar(2000) comment '�ز�����',
   MATERIAL_ISDEL       int comment '�Ƿ�ɾ����0 ��1�ǣ�',
   MATERIAL_CREATED     varchar(19) comment '����ʱ��',
   MATERIAL_MODIFIED    varchar(19) comment '�޸�ʱ��',
   MATERIAL_CREATER     int comment '�ϴ���',
   MATERIAL_MODIFIER    int comment '����������',
   primary key (MATERIAL_ID)
);

alter table TAB_MATERIAL comment '�زı�';

/*==============================================================*/
/* Table: TAB_OFFER                                             */
/*==============================================================*/
create table TAB_OFFER
(
   OFFER_ID             int not null auto_increment comment '����id',
   PRODUCT_ID           int not null comment '��Ʒid',
   ADVERTISER_ID        int comment '������˺�id',
   OFFER_NAME           varchar(400) character set utf8 not null comment '��������',
   OFFER_CLICK_TL       varchar(1000) not null comment '��ⷽ��MC��׷������',
   OFFER_S_DATE         varchar(50) not null comment '��ʼ����',
   OFFER_E_DATE         varchar(50) default '2030-01-01' comment '��������',
   OFFER_EARNING_T      varchar(50) not null default 'CPA' comment '���㷽ʽ',
   OFFER_EARNING_C      varchar(50) not null default 'CNY' comment '�������',
   OFFER_EARNING_N      varchar(50) not null comment '���㵥��',
   OFFER_E_EXPEND_T     varchar(50) default 'CPA' comment '�ų���ʽ',
   OFFER_E_EXPEND_C     varchar(50) default 'CNY' comment '�ų�����',
   OFFER_E_EXPEND_N     varchar(50) comment '�ų�����',
   OFFER_DAY_CAP        int comment '������',
   OFFER_ACTIVE_EVENT   varchar(50) not null default 'fopen' comment '�����¼�',
   OFFER_DEVICE_TYPE    varchar(10) comment '(Phone��Pad)',
   OFFER_OS_HVERSION    varchar(10) comment 'ϵͳ��߰汾',
   OFFER_OS_LVERSION    varchar(10) comment 'ϵͳ��Ͱ汾',
   OFFER_DCP            varchar(800) comment '����',
   OFFER_STATUS         varchar(50) not null default 'private' comment '����״̬��public��private��pause��',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (OFFER_ID)
);

alter table TAB_OFFER comment '������';

/*==============================================================*/
/* Table: TAB_OFFER_CITY                                        */
/*==============================================================*/
create table TAB_OFFER_CITY
(
   OFFERCITY_ID         int not null auto_increment comment '��������id',
   OFFER_ID             int not null comment '����id',
   CITY_ID              int not null comment '����id',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           char(19) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (OFFERCITY_ID)
);

alter table TAB_OFFER_CITY comment '����-���б�';

/*==============================================================*/
/* Table: TAB_PRODUCT                                           */
/*==============================================================*/
create table TAB_PRODUCT
(
   PRODUCT_ID           int not null auto_increment comment '��Ʒid',
   PRODUCT_NAME         varchar(400) character set utf8 not null comment '��Ʒ����',
   PRODUCT_TYPE         varchar(50) not null default 'Mobile Apps' comment '����',
   PRODUCT_OS           varchar(255) not null default 'iOS' comment 'ϵͳƽ̨',
   PRODUCT_LP           varchar(1000)  not null comment '���ҳ',
   PRODUCT_DCP          varchar(800) character set utf8 comment '����',
   PRODUCT_APP_PACKAGE  varchar(400) comment '��Ʒ��appid',
   PRODUCT_STATUS       varchar(50) not null default 'active' comment '��Ʒ��״̬',
   PRODUCT_ICON_URL     varchar(500) comment 'ͼ��url',
   PRODUCT_CREATE_TIME  varchar(19) comment '����ʱ��',
   PRODUCT_CREATER      int comment '������',
   PRODUCT_MODIFY_TIME  varchar(19) comment '�޸�ʱ��',
   PRODUCT_MODIFIER     int comment '�޸���',
   primary key (PRODUCT_ID)
);

alter table TAB_PRODUCT comment '��Ʒ��';

/*==============================================================*/
/* Table: TAB_ROLE                                              */
/*==============================================================*/
create table TAB_ROLE
(
   ROLE_ID              int not null auto_increment comment '��ɫid',
   ROLE_NAME            varchar(100) not null comment '��ɫ����',
   ROLE_PARENT_ID       int not null comment '����ɫid',
   ROLE_STATUS          varchar(10) comment '��ɫ״̬',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           char(19) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (ROLE_ID)
);

alter table TAB_ROLE comment '��ɫ��';

/*==============================================================*/
/* Table: TAB_STRATEGY                                          */
/*==============================================================*/
create table TAB_STRATEGY
(
   STRATEGY_ID          int not null auto_increment comment '����id',
   DEVICE_TYPE          varchar(50) comment '�豸����',
   MINOSV               varchar(10) comment '���ϵͳ�汾',
   MAXOSV               varchar(10) comment '���ϵͳ�汾',
   CONNECTION_TYPE      varchar(50) comment '���绷��',
   PARA_VALIDATION      varchar(50) comment '������֤',
   FREQUENCY_PARA       varchar(10) comment 'Ƶ�ز���',
   FREQUENCY_INTERVAL   int comment 'Ƶ�ؼ��',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (STRATEGY_ID)
);

alter table TAB_STRATEGY comment '���Ͷ�Ų���';

/*==============================================================*/
/* Table: TAB_STRATEGY_CITY                                     */
/*==============================================================*/
create table TAB_STRATEGY_CITY
(
   STRA_CITY_ID         int not null auto_increment comment '����-����id',
   STRATEGY_ID          int not null comment '����id',
   CITY_ID              int not null comment '����id',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (STRA_CITY_ID)
);

/*==============================================================*/
/* Table: TAB_TRACK_LINK                                        */
/*==============================================================*/
create table TAB_TRACK_LINK
(
   TRACKLINK_ID         int not null auto_increment comment 'Ͷ������id',
   PRODUCT_ID           int not null comment '��Ʒid',
   ADVERTISER_ID        int not null comment '�����id',
   TRACKLINK_NAME       varchar(100) comment 'Ͷ����������',
   IMP_LINK             varchar(500) comment 'չʾ����',
   CLICK_LINK           varchar(500) comment '�������',
   MODE                 int comment 'mode',
   IMP_SYN_TYPE         varchar(10) comment 'չʾͬ����ʽ',
   CLICK_SYN_TYPE       varchar(10) comment '���ͬ����ʽ',
   CREATE_TIME          char(19) not null comment '����ʱ��',
   UPDATE_TIME          char(19) comment '�޸�ʱ��',
   MC_VERSION           varchar(10) not null default 'mc_v1.0' comment 'mc�汾',
   primary key (TRACKLINK_ID)
);

alter table TAB_TRACK_LINK comment '׷������';

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

