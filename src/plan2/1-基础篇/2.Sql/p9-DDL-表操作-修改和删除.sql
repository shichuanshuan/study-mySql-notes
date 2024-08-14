-- 表操作-修改
/*
1. 添加字段
alret table 表名 add 字段名 类型(长度) comment 注释;

示例：
alter table emp add nickname varchar(20) comment "昵称";

2. 修改数据类型
alter table 表名 modify 字段名 新数据类型(长度);

示例：
alter table emp mo


3. 修改字段名和字段类型
alter 表名 change 旧字段名 新字段名 类型(长度);

示例：
alter table emp change nickname username varchar(30) comment '用户名';


4. 删除字段
alter table 表名 drop 字段名;

示例：
alter table emp drop username;


5. 修改表名
alter table 表名 rename to 新表名;


示例:
alter table emp rename to employee;


6. 删除表
drop table if exists 表名;

删除指定表，并重新创建该表
truncate tables 表名；


示例：
drop table if exists employee;
*/