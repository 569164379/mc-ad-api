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
   CREATIVE_UPLOADER    varchar(50) comment '创意上传者email',
   CREATIVE_STATUS      varchar(50) comment '创意状态： 待审核waiting 审核通过passed 审核未通过refused',
   CREATIVE_TAG         varchar(50) comment '创意标签',
   CREATIVE_LEVEL       varchar(50) comment '创意分级 1,2,3',
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
   OPERATOR_ID          int not null auto_increment comment '操作日志ID',
   CREATIVE_ID          int comment '创意ID',
   OPERATOR_TYPE        int comment '操作类型(上传创意(''upload'') 编辑创意(''edit'') 审核创意(''audit'') 合并创意(''merge''))',
   OPERATOR_EMAIL       varchar(50) comment '操作者email',
   OPERATE_DATE         varchar(19) comment '操作时间',
   OPERATOR_RESULT      varchar(500) comment '操作结果',
   primary key (OPERATOR_ID)
);

alter table TAB_CREATIVE_LOG comment '创意操作日志表';

/*==============================================================*/
/* Table: TAB_DICTIONARY                                        */
/*==============================================================*/
create table TAB_DICTIONARY
(
   DICT_ID              int not null comment '数据字典ID',
   DICT_NO              varchar(16) comment '数据字典编号',
   DICT_PARENT_NO       varchar(16) comment '父类编号',
   DICT_NAME            varchar(100) comment '数据字典名称',
   primary key (DICT_ID)
);

alter table TAB_DICTIONARY comment '数据字典表';

/*==============================================================*/
/* Table: TAB_MATERIAL                                          */
/*==============================================================*/
create table TAB_MATERIAL
(
   MATERIAL_ID          int not null auto_increment comment '素材ID',
   CREATIVE_ID          int comment '创意ID',
   MATERIAL_NO          varchar(32) not null comment '素材编号',
   MATERIAL_TITLE       varchar(100) comment '文本标题',
   MATERIAL_WIDTH       int comment '图片长度',
   MATERIAL_HEIGHT      int comment '图片高度',
   MATERIAL_DURATION    int comment '播放时长',
   MATERIAL_URL         varchar(500) comment '素材地址',
   MATERIAL_DESC        varchar(2000) comment '素材描述',
   primary key (MATERIAL_ID)
);

alter table TAB_MATERIAL comment '素材表';

alter table TAB_CREATIVE_LOG add constraint FK_REFERENCE_2 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

alter table TAB_MATERIAL add constraint FK_REFERENCE_1 foreign key (CREATIVE_ID)
      references TAB_CREATIVE (CREATIVE_ID) on delete restrict on update restrict;

