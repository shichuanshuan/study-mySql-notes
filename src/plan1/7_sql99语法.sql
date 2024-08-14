#二、sql99语法
/*
语法：
	select 查询列表
	from 表1 别名 【连接类型】
	join 表2 别名
	on 连接条件
	【where 筛选条件】
	【group by 分组】
	【having 筛选条件】
	【order by 排序列表】
	
分类
内连接（*）：inner
外连接
	左外（*）：left 【outer】
	右外（*）：right【outer】
	全外： full【outer】
交叉连接：cross
*/

#一）内连接
/*
语法：

select 查询列表
from 表1 别名
inner join 表2 别名
on 连接条件；

分类
等值
非等值
自连接

特点
1. 添加排序、分组、筛选
2. inner 可以省略
3. 筛选条件放在where后面，连接条件放在 on 后面，提高分离性，便于阅读
4. inner join连接和 sql92 语法中的等值连接效果是一样的，都是查询多表的交集
*/

#1、等值连接
#案例1.查询员工名、部门名
SELECT last_name,department_name
FROM departments d
INNER JOIN employees e
ON e.department_id = d.department_id;

#案例2.查询名字中包含 e 的员工名和工种名（添加筛选）
SELECT last_name, job_title
FROM employees e
INNER JOIN jobs j
ON e.job_id = j.job_id
WHERE e.last_name LIKE '%e%';

#案例3.查询部门个数>3的城市名和部门个数
SELECT city,COUNT(*) 部门个数
FROM departments d
INNER JOIN locations l
ON d.location_id = l.location_id
GROUP BY city
HAVING COUNT(*)>3;

#案例4.查询那个部门的员工个数>3的部门名和员工名个数，并按个数降序
#1.查询每个部门的员工个数
SELECT COUNT(*), department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name;

#2 在 1 结果上筛选员工个数>3的记录，并排序
SELECT COUNT(*), department_name
FROM employees e
INNER JOIN departments d
ON e.department_id = d.department_id
GROUP BY department_name
HAVING COUNT(*)>3
ORDER BY COUNT(*) DESC;

#案例5.查询员工名、部门名、工种名，并按部门名降序
SELECT last_name,department_name,job_title
FROM employees e
INNER JOIN departments d ON e.department_id = d.department_id
INNER JOIN jobs j ON e.job_id = j.job_id
ORDER BY department_name DESC;


#二）非等值连接

# 查询员工的工资级别
SELECT salary,grade_level
FROM employees e
INNER JOIN job_grades g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal;

# 查询工资级别的个数 >20 的个数，并且按工资级别降序
SELECT COUNT(*), grade_level
FROM employees e
JOIN job_grades g
ON e.salary BETWEEN g.lowest_sal AND g.highest_sal
GROUP BY grade_level
HAVING COUNT(*) > 20
ORDER BY grade_level DESC;


#三.自连接
# 查询员工的名字、上级的名字
SELECT e.last_name, m.last_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id;

# 查询姓名中包含字符 k 的员工的名字、上级的名字
SELECT e.last_name, m.last_name
FROM employees e
JOIN employees m
ON e.manager_id = m.employee_id
WHERE e.last_name LIKE '%k%';

#二、外连接
/*
应用场景：用于查询一个表中有，另一个表中没有的记录

特点：
1、外连接的查询结果为主表中的所有记录
	如果从表中有和它匹配的，则显示匹配的值
	如果从表中没有和它匹配的，则显示null
	外连接查询结果=内连接结果 + 主表中有而从表中没有的记录
2、左外连接，left join左边的是主表
   右外连接，right join右边的是主表
3、左外和右外交换两个表的顺序，可以实现同样的效果
4、全外连接=内连接的结果 + 表1 中有但表2 没有的 + 表2中有但表1 没有的
*/
# 引入：查询男朋友，不在男朋友表中的女神名
USE girls;

SELECT * FROM beauty;
SELECT * FROM boys;

# 左外连接
SELECT b.name, bo.*
FROM beauty b
LEFT OUTER JOIN boys bo
ON b.boyfriend_id = bo.id
WHERE bo.id IS NULL;

# 右外连接
SELECT b.name, bo.*
FROM beauty b
RIGHT OUTER JOIN boys bo
ON b.boyfriend_id = bo.id
WHERE b.name IS NULL;


# 案例1：查询哪个部门没有员工
USE myemployees;

# 左外
SELECT d.*, e.employee_id
FROM departments d
LEFT OUTER JOIN employees e
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


# 右外
SELECT d.*, e.employee_id
FROM employees e
RIGHT OUTER JOIN departments d
ON d.department_id = e.department_id
WHERE e.employee_id IS NULL;


# 全外 sql不支持全外连接
USE girls;
SELECT b.*, bo.*
FROM beauty b
FULL OUTER JOIN boys bo
ON b.boyfriend_id = bo.id;


# 交叉连接
SELECT b.*, bo.*
FROM beauty b
CROSS JOIN boys bo;





