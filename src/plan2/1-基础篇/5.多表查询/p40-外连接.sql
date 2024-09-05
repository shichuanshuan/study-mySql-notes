-- 1. 外连接
-- 2. 左外连接
A、B两个集合，查询左表所有数据，以及两张表交集部分数据


-- 2.1 语法
相当于查询表1（左表）的所有数据，包含表1和表2交集部分的数据
select 字段列表 from 表1 left outer join 表2 on 条件...;


示例：
查询 emp 表的所有数据，和对应的部门信息（左外连接）
-- 表结构：emp，dept
-- 连接条件：emp.dept_id = dept.id

select e.*, d.name from emp e left outer join dept d on e.dept_id = d.id;

可以省略 outer
select e.*, d.name from emp e left join dept d on e.dept_id = d.id;


-- 3. 右外连接
A、B两个集合，查询右表所有数据，以及两张表交集部分数据


-- 3.2 语法
相当于查询表2（右表）的所有数据，包含表1和表2交集部分的数据
select 字段列表 from 表1 right outer join 表2 on 条件...;


示例：
查询 dept 表的所有数据，和对应的员工信息（右外连接）
select d.*, e.* from emp e right outer join dept d on e.dept_id = d.id;