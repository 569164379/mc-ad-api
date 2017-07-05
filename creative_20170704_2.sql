/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     7/4/2017 10:47:33 AM                         */
/*==============================================================*/


drop table if exists TAB_ACCOUNT;

drop table if exists TAB_CREATIVE;

drop table if exists TAB_CREATIVE_LOG;

drop table if exists TAB_DICTIONARY;

drop table if exists TAB_DICT_CREATIVE;

drop table if exists TAB_MATERIAL;

drop table if exists TAB_PRODUCT;

/*==============================================================*/
/* Table: TAB_ACCOUNT                                           */
/*==============================================================*/
create table TAB_ACCOUNT
(
   ACCOUNT_ID           int not null auto_increment comment '�˻�ID',
   ACCOUNT_EMAIL        varchar(60) comment '�˻�����',
   ACCOUNT_NAME         varchar(50) comment '�˻�����',
   ACCOUNT_PWD          varchar(60) comment '����',
   ACCOUNT_STATUS       varchar(10) comment '״̬',
   ACCOUNT_EXPIRE       varchar(10) comment '����ʱ��',
   ACCOUNT_TYPE         varchar(50) comment '�˻���ɫ',
   ACCOUNT_ADDRESS      varchar(200) comment '��ַ',
   ACCOUNT_POST_CODE    varchar(10) comment '�ʱ�',
   ACCOUNT_TELPHONE     varchar(20) comment '�ƶ��绰',
   ACCOUNT_FIXED_TEL    varchar(20) comment '�̶��绰',
   ACCOUNT_CONTACT      varchar(100) comment '�˻���ϵ��Ϣ',
   ACCOUNT_CREATED      varchar(19) comment '����ʱ��',
   ACCOUNT_MODIFIED     varchar(19) comment '�޸�ʱ��',
   primary key (ACCOUNT_ID)
);

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

alter table TAB_MATERIAL add constraint FK_REFERENCE_1 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

alter table TAB_PRODUCT add constraint FK_REFERENCE_7 foreign key (PRODUCT_CREATER)
      references TAB_ACCOUNT (ACCOUNT_ID) on delete restrict on update restrict;

