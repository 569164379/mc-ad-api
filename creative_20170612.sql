/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     6/12/2017 4:54:19 PM                         */
/*==============================================================*/


drop table if exists TAB_ACCOUNT;

drop table if exists TAB_CREATIVE;

drop table if exists TAB_CREATIVE_LOG;

drop table if exists TAB_DICTIONARY;

drop table if exists TAB_MATERIAL;

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
   CREATIVE_UPLOADER    varchar(50) comment '�����ϴ���email',
   CREATIVE_STATUS      varchar(50) comment '����״̬�� �����waiting ���ͨ��passed ���δͨ��refused',
   CREATIVE_TAG         varchar(50) comment '�����ǩ',
   CREATIVE_LEVEL       varchar(50) comment '����ּ� 1,2,3',
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
   OPERATOR_ID          int not null auto_increment comment '������־ID',
   CREATIVE_ID          int comment '����ID',
   OPERATOR_TYPE        int comment '��������(�ϴ�����(''upload'') �༭����(''edit'') ��˴���(''audit'') �ϲ�����(''merge''))',
   OPERATOR_EMAIL       varchar(50) comment '������email',
   OPERATE_DATE         varchar(19) comment '����ʱ��',
   OPERATOR_RESULT      varchar(500) comment '�������',
   primary key (OPERATOR_ID)
);

alter table TAB_CREATIVE_LOG comment '���������־��';

/*==============================================================*/
/* Table: TAB_DICTIONARY                                        */
/*==============================================================*/
create table TAB_DICTIONARY
(
   DICT_ID              int not null comment '�����ֵ�ID',
   DICT_NO              varchar(16) comment '�����ֵ���',
   DICT_PARENT_NO       varchar(16) comment '������',
   DICT_NAME            varchar(100) comment '�����ֵ�����',
   primary key (DICT_ID)
);

alter table TAB_DICTIONARY comment '�����ֵ��';

/*==============================================================*/
/* Table: TAB_MATERIAL                                          */
/*==============================================================*/
create table TAB_MATERIAL
(
   MATERIAL_ID          int not null auto_increment comment '�ز�ID',
   CREATIVE_ID          int comment '����ID',
   MATERIAL_NO          varchar(32) not null comment '�زı��',
   MATERIAL_TITLE       varchar(100) comment '�ı�����',
   MATERIAL_WIDTH       int comment 'ͼƬ����',
   MATERIAL_HEIGHT      int comment 'ͼƬ�߶�',
   MATERIAL_DURATION    int comment '����ʱ��',
   MATERIAL_URL         varchar(500) comment '�زĵ�ַ',
   MATERIAL_DESC        varchar(2000) comment '�ز�����',
   primary key (MATERIAL_ID)
);

alter table TAB_MATERIAL comment '�زı�';

alter table TAB_CREATIVE_LOG add constraint FK_REFERENCE_2 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

alter table TAB_MATERIAL add constraint FK_REFERENCE_1 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

