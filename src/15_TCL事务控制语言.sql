#TCL
/*
Transaction Control Language 事务控制语言

事务：
一个或一组sql语句组成一个执行单元，这个执行单元要么全部执行，要么全部不执行。

案例：转账

张三丰	1000
郭襄	1000

update 表 set 张三丰的余额=500 where name='张三丰'

意外
update 表 set 郭襄的余额=1500 where name='郭襄'


事务的特性：
ACID
原子性：一个事务不可再分割，要么都执行要么都不执行
一致性：一个事务执行会使数据从一个一致状态，到另一个一致状态
隔离性：一个事务的执行不受其他事务的干扰
	脏读：对于两个事务T1，T2，T1读取了已经被T2更新但还没被提交的字段之后，若T2回滚，T1读取的内容就是临时且无效的.
	
	不可重复读：对于两个事务T1、T2，T1读取了一个字段，然后T2更新了该字段.之后，T1再次读取同一个字段，值就不同了
	
	幻读：对于两个事务T1、T2，T1从一个表中读取了一个字段，然后T2在该表中插入了一些新的行.之后，如果T1再次读取同一个表，
	就会多出几行.
	
持久性：一个事务一旦提交，则会永久改变数据库的数据；


事务的创建

隐式事务：事务没有明显的开机和结束的标记
比如 insert、update、delete语句

delete from 表 where id = 1;

显示事务：事务具有明显的开机和结束的标记
前提：必须先设置自动提交功能为禁用





set autocommit=0;

步骤1：开启事务
set autocommit=0;
start transaction;可选的

步骤2：编写事务中的 sql 语句(select insert update delete)

语句1
语句2
...

步骤3：结束事务
commit；提交事务
rollback；回滚事务






开启事务的语句;
update 表 set 张三丰的余额=500 where name='张三丰'

意外
update 表 set 郭襄的余额=1500 where name='郭襄'

结束事务的语句
*/

SHOW VARIABLES LIKE 'autocommit';
SHOW ENGINES;

DROP TABLE IF EXISTS account;

CREATE TABLE account(
	id INT PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(20),
	balance DOUBLE
);

INSERT INTO account(username, balance)
VALUES('zwj', 1000), ('zm', 1000);

#演示事务的使用步骤

#关闭自动提交
SET autocommit=0;
#开启事务
START TRANSACTION;

#编写一组事务的语句
UPDATE account SET balance = 500 WHERE id=1;
UPDATE account SET balance = 1500 WHERE id=2;


#结束事务
#COMMIT;
ROLLBACK;


SELECT * FROM account;


#2. delete 和 truncate 在事务使用时的区别

#演示 delete,支持回滚(数据不会删除)

SET autocommit=0;
START TRANSACTION;
DELETE FROM account;
ROLLBACK;


#演示 truncate,不支持回滚(数据会删除)
SET autocommit=0;
START TRANSACTION;
TRUNCATE account;
ROLLBACK;
