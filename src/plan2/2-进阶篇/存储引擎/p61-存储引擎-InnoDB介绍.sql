-- InnoDB
-- 介绍
InnoDB 是一种兼顾高可靠性和高性能的通用存储引擎，在 MySQL 5.5 之后，InnoDB是默认的 MySQL 存储引擎。

-- 特点
DML 操作遵循 ACID 模型，支持事务；
行级锁，提高并发访问性能；
支持外键 FOREIGN KEY 约束，保证数据的完整性和正确性;

-- 文件
xxx.ibd: xxx代表的是表名，innoDB引擎的每张表都会对应这样一个表空间文件，存储该表结构(frm,sdi)、数据和索引。
参数：innodb_file_per_table

-- 逻辑存储结构
TableSpece: 表空间
Segment: 段
Extent: 区
Page: 页
Row: 行


-- MyISAM
-- 介绍
  MyISAM 是 MySQL 早期的默认存储引擎

-- 特点
不支持事务，不支持外键
支持表锁，不支持行锁
访问速度快

-- 文件
xxx.sdi: 存储表结构信息
xxx.MYD: 存储数据
xxx.MYI: 存储索引


-- Memory
-- 介绍
Memory 引擎的表数据存储在内存中，由于受到硬件问题、或断电问题的影响，只能将这些表作为临时表或缓存使用

-- 特点
内存存放
hash索引（默认）

-- 文件
xxx.sdi: 存储表结构信息