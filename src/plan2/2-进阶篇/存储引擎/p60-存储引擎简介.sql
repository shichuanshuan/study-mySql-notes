-- 查询建表语句  --- 默认存储引擎: InnoDB
show create table account;

-- 查询当前数据库支持的存储引擎
show engines;

-- 创建表 my_myisam, 并指定 MyISAM存储引擎
语法：
create table 表名(
    字段1 字段 1 类型,
    ...
    字段n 字段 n 类型
) engine = innoDB;

示例：
create table my_myisam(
    id int,
    name varchar(20)
) engine = MyISAM;


-- 创建表 my_memory, 指定 Memory 存储引擎
create table my_memory(
    id int,
    name varchar(20)
) engine = Memory;