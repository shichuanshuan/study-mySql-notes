-- 1. 自连接
自己连接自己，把自己的一张表看成两张表处理


-- 2. 自连接查询语法
自连接查询，可以是内连接查询，也可以是外连接查询。
select 字段列表 from 表A 别名A join 表A 别名B on 条件...


示例：
1. 查询员工及其所属领导的名字
表结构：emp

select a.name, b.name from emp a, emp b where a.managerid = b.id;



2. 查询所有员工 emp 及其领导的名字 emp，如果员工没有领导，也需要查询出来

select a.name '员工', b.name '领导' from emp a left join emp b on a.managerid = b.id;