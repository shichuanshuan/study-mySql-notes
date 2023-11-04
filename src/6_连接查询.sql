# 进阶6 连接查询
/*
含义：又称多表查询，当查询的字段来自于多个表时，就会用到连接查询

笛卡尔乘积现象：表1 有 m 行， 表2 有 n 行， 结果 = m * n 行

发生原因：没有有效的连接条件
如何避免：添加有效的连接条件

分类：
	按年代分类
	sql92 标准：仅仅支持内连接
	sql99 标准【推荐】：支持内连接 + 外连接（左外和右外）+ 交叉连接
	
	按功能分类：
		内连接：
			等值连接
			非等值连接
			自连接
		外连接：
			左外连接
			右外连接
			全外连接
		交叉连接
*/
SELECT * FROM beauty;

SELECT * FROM boys;

SELECT NAME, boyName FROM boys, beauty;

SELECT NAME, boyName FROM boys, beauty
WHERE beauty.boyfriend_id = boys.id;

# 一、sql92 标准
# 1、等值连接
/*

1. 多表等值连接的结果为多表的交集部分
2. n 表连接，至少需要 n - 1 个连接条件
3. 多表的顺序没有要求
4. 一般需要为表起别名
5. 可以搭配前面介绍的所有子句使用，不如排序、分组、筛选
*/

# 案例1：查询女神名和对应的男神名
SELECT NAME, boyName
FROM boys, beauty
WHERE beauty.boyfriend_id = boys.id;

# 案例2：查询员工名和对应的部门名
SELECT last_name, department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;


SELECT last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;


#2、为表起别名
/*
1.提高语句的简洁度
2.区分多个重名的字段

注意：如果为表起了别名，则查询的字段就不能使用原来的表明去限定
*/
# 查询员工名、工种号、工种名
SELECT last_name, e.job_id, job_title
FROM employees AS e, jobs
WHERE e.job_id = jobs.job_id;

# 3、两个表的顺序可以调换

SELECT last_name, e.job_id, j.job_title
FROM jobs j, employees AS e
WHERE e.job_id = j.job_id;

# 4、可以加筛选

# 案例：查询有奖金的员工名、部门名
SELECT last_name, department_name, commission_pct
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.commission_pct IS NOT NULL;

# 案例2：查询城市名中第二个字符为 o 的部门名和城市名
SELECT department_name, city
FROM departments d, locations l
WHERE d.location_id = l.location_id
AND city LIKE '_o%';

#5、可以加分组

# 案例1：查询每个城市的部门个数
SELECT COUNT(*) 个数, city
FROM departments d, locations l
WHERE d.location_id = l.location_id
GROUP BY city;

# 案例2：查询有奖金的每个部门的部门名和部门的领导编号和该部门的最低工资
SELECT department_name, d.manager_id, MIN(salary)
FROM departments d, employees e
WHERE d.department_id = e.department_id
AND commission_pct IS NOT NULL
GROUP BY department_name, d.manager_id;

#6、可以加排序
#案例：查询每个工种的工种名和员工的个数，并且按员工个数降序
SELECT job_title, COUNT(*)
FROM employees e, jobs j
WHERE e.job_id = j.job_id
GROUP BY job_title
ORDER BY COUNT(*) DESC;

#7、可以实现三表连接
#案例：查询员工名、部门名和所在的城市
SELECT last_name, department_name, city
FROM employees e, departments d, locations l
WHERE e.department_id = d.department_id
AND d.location_id = l.location_id
AND city LIKE 's%'
ORDER BY department_name DESC;


#2、非等值连接
#案例1：查询员工的工资和工资级别
SELECT salary, grade_level
FROM employees e, job_grades g
WHERE salary BETWEEN g.lowest_sal AND g.highest_sal
AND g.grade_level = 'A';

SELECT * FROM job_grades;

/*
CREATE TABLE job_grades
(grade_level VARCHAR(3),
lowest_sal INT,
highest_sal INT);

INSERT INTO job_grades
VALUES ('A',1000,2999);

INSERT INTO job_grades
VALUES ('B',3000,5999);

INSERT INTO job_grades
VALUES ('C',6000,9999);

INSERT INTO job_grades
VALUES ('D',10000,14999);

INSERT INTO job_grades
VALUES ('E',15000,24999);

INSERT INTO job_grades
VALUES ('F',25000,40000);

DELETE FROM job_grades where grader_level = 'F';

DELETE FROM job_grades;

select * from job_grades;
*/

#3、自连接

#案例：查询 员工名和上级的名称
SELECT e.employee_id, e.last_name, m.employee_id, m.last_name
FROM employees e, employees m
WHERE e.`manager_id` = m.`employee_id`;
















