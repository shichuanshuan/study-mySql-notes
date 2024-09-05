-- 1. 内连接
相当于查询A、B集合的交集部分数据

-- 2. 语法
-- 2.1 隐式内连接
select 字段列表 from 表1, 表2 where 条件...;


示例：
查询每一个员工的姓名，及关联的部门的名称（隐式内连接实现）
-- 表结构：emp，dept
-- 连接条件：emp.dept_id = dept.id

select emp.name, dept.name from emp, dept where emp.dept_id = dept.id;

别名
select e.name, d.name from emp e, dept d where e.dept_id = d.id;




-- 2.2 显示内连接
select 字段列表 from 表1 inner join 表2 on 连接条件...;


示例：
查询每一个员工的姓名，及关联的部门的名称（显式内连接实现）
-- 表结构：emp，dept
-- 连接条件：emp.dept_id = dept.id
select e.name, d.name from emp e inner join dept d on e.dept_id = d.id;

可以省略 inner
select e.name, d.name from emp e join dept d on e.dept_id = d.id;