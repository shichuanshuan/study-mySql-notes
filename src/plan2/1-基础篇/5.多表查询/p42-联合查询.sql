-- 联合查询-union，union all
对于 union 查询，就是把多次查询的结果合并起来，形成一个新的查询结果集


语法：
select 字段列表 from 表A...
union all
select 字段列表 from 表B...;

注意：对于联合查询的多张表的列数必须保持一致，字段类型也需要保持一致

union all 会将全部的数据直接合并在一起，union 会对合并之后的数据去重


示例：
1. 将薪资低于 5000 的员工，和年龄大于 50 岁的员工全部查询出来。

select * from emp where salary < 5000

union all

select * from emp where age > 50;


去重
select * from emp where salary < 5000

union

select * from emp where age > 50;