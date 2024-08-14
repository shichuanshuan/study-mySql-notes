-- 1. 数据库操作省略
/*
省略
*/


-- 2. DDL-表操作-创建
/*
create tables 表名(
字段1 字段1类型 comment 字段1注释,
字段2 字段2类型 comment 字段2注释,
...
字段n 字段n类型 comment 字段n注释
) comment 表注释

示例：
create table tb_user(
id int comment "编号",
name varchar(20) comment "姓名",
age int comment "年龄"
) comment "用户表";
*/


-- 3. 查询指定表的建表语句
/*
show create table 表名;

示例：

*/