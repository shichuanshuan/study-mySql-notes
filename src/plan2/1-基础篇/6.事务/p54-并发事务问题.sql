-- 1. 事务四大特性
原子性：事务是不可分割的最小操作单元，要么全部成功，要么全部失败。
一致性：事务完成时，必须使所有的数据都保持一致状态
隔离性：数据库系统提供的隔离机制，保证事务在不受外部并发操作影响的独立环境下运行。
持久性：事务一旦提交或回滚，它对数据库中的数据的改变就是永久的



-- 2. 并发事务问题
问题            描述

脏读            一个事务读到另一个事务还没有提交的数据
不可重复读      一个事务先读取同一条记录，但是两次读取的数据不同，称之为不可重复读
幻读            一个事务按照条件查询数据时，没有对应的数据行，但是在插入数据时，又发现这行数据已经存在，好像出现了”幻影“



-- 3. 并发事务演示及隔离级别
-- 3.1 事务隔离级别

隔离级别                        脏读        不可重复读      幻读
Read uncommitted               存在         存在            存在
Read committed                 不存在       存在            存在
Repeatable Read(Mysql默认)     不存在       不存在          存在
Serializable                    不存在      不存在          不存在

注意：事务隔离级别越高，数据越安全，但是性能越低

-- 3.2 查看事务隔离级别
select @@TRANSACTION_ISOLATION;


-- 3.3 设置事务隔离级别
set [session | global] transaction isolation level [Read uncommitted | Read committed | Repeatable Read | Serializable]

session:表示当前客户端的隔离级别
global:表示所有客户端的隔离级别