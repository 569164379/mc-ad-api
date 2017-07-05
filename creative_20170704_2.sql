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
   ACCOUNT_ID           int not null auto_increment comment '账户ID',
   ACCOUNT_EMAIL        varchar(60) comment '账户邮箱',
   ACCOUNT_NAME         varchar(50) comment '账户名字',
   ACCOUNT_PWD          varchar(60) comment '密码',
   ACCOUNT_STATUS       varchar(10) comment '状态',
   ACCOUNT_EXPIRE       varchar(10) comment '过期时间',
   ACCOUNT_TYPE         varchar(50) comment '账户角色',
   ACCOUNT_ADDRESS      varchar(200) comment '地址',
   ACCOUNT_POST_CODE    varchar(10) comment '邮编',
   ACCOUNT_TELPHONE     varchar(20) comment '移动电话',
   ACCOUNT_FIXED_TEL    varchar(20) comment '固定电话',
   ACCOUNT_CONTACT      varchar(100) comment '账户联系信息',
   ACCOUNT_CREATED      varchar(19) comment '创建时间',
   ACCOUNT_MODIFIED     varchar(19) comment '修改时间',
   primary key (ACCOUNT_ID)
);

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

