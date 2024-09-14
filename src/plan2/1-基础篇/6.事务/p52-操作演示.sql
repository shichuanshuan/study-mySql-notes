-- 事务简介
事务是一组操作的集合，它是一个不可分割的工作单位，事务会把所有的操作作为一个整体一起向系统提交或撤销操作请求，
即这些操作要么同时成功，要么同时失败


------------------------------- 事务操作 -------------------------------
-- 数据准备
create table account(
    id int auto_increment primary key,
    name varchar(20),
    money int
);
insert into account(id, name, money) values(null, '张三', 2000),(null, '李四', 2000);


-- 恢复数据
update account set money = 2000 where name = '张三' or name = '李四';

-- 方式1
--------------------------------------------
查看/设置事务提交方式。其实每个语句后面都有 commit，默认是开启的，即 @@autocommit = 1
select @@autocommit;
set @@autocommit = 0;


提交事务()
commit;


回滚事务()
rollback;
---------------------------------------------

-- 转账操作(张三给李四转账 1000)
-- 1. 查询张三账户余额
select * from account where name = '张三';


-- 2. 将张三账户余额-1000
update account set money = money - 1000 where name = '张三';


程序抛出异常

-- 3. 将李四账户余额+1000
update account set money = money + 1000 where name = '李四';



-- 方式2
开启事务
start transaction 或 begin;


提交事务
commit;

回滚事务
rollback;