#视图
/*
含义：虚拟表和普通表一样使用
mysql 5.1版本出现的新特征，是通过表动态生成的数据

比如：舞蹈班和普通班级的对比

视图和表的对比
	创建语法的关键字	是否实际占用物理空间	使用
视图	create view		只是保存了 sql		增删改查，只是一般不能增删改
表	create table		占用			增删改查

*/

#案例：查询姓张的学生名和专业名
SELECT stuname,majorname
FROM stuinfo s
INNER JOIN major m 
ON s.majorid=m.id
WHERE s.stuname LIKE '张%';

CREATE VIEW v1
AS
SELECT stuname, majorname
FROM stuinfo s
INNER JOIN major m
ON s.majorid = m.id;

SELECT * FROM v1 WHERE stuname LIKE '张%';


#一、创建视图
/*
语法：
create view 视图名
as
查询语句;

*/
USE myemployees;

#1.查询姓名中包含 a 字符的员工名、部门名和工种信息

#创建
CREATE VIEW myv1
AS
SELECT last_name, department_name, job_title
FROM employees e
JOIN departments d
ON e.department_id = d.department_id
JOIN jobs j
ON j.job_id = e.job_id;

#使用
SELECT * FROM myv1 WHERE last_name LIKE '%a%';


#2.查询各部门的平均工资级别

#创建视图查看每个部门的平均工资
CREATE VIEW myv2
AS
SELECT AVG(salary) ag, department_id
FROM employees
GROUP BY department_id;

#使用
SELECT myv2.ag, g.grade_level
FROM myv2
JOIN job_grades g
ON myv2.ag BETWEEN g.lowest_sal AND g.highest_sal;

#3.查询平均工资最低的部门信息
SELECT * FROM myv2 ORDER BY ag LIMIT 1;

#4.查询平均工资最低的部门名和工资
CREATE VIEW myv3
AS
SELECT * FROM myv2 ORDER BY ag LIMIT 1;

SELECT d.*, m.ag
FROM myv3 m
JOIN departments d
ON m.department_id = d.department_id;


/*
视图的好处
重用 sql 语句
简化复杂的 sql 操作，不必知道它的查询细节
保护数据，提高安全性

*/


#二、视图的修改

#方式一：
/*
create or replace view 视图名
as
查询语句；

*/

SELECT * FROM myv3
CREATE OR REPLACE VIEW myv3
AS
SELECT AVG(salary), job_id
FROM employees
GROUP BY job_id;

#方式二
/*
语法:
alter view 视图名
as
查询语句；

*/
ALTER VIEW myv3
AS
SELECT * FROM employees;


#三、删除视图
/*

语法：drop view 视图名,视图名...
*/

DROP VIEW myv1,myv2,myv3;


#四、查看视图

SHOW CREATE VIEW myv3;














