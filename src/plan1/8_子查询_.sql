#进阶八：子查询
/*
含义：
出现在其他语句中的 select 语句，称为子查询或内查询
外部的查询语句，称为主查询或外查询

分类：
按子查询出现的位置：
	select 后面：
		仅仅支持标量子查询
		
	from	后面：
		支持表子查询
	
	where 或 having 后面：⭐
		标量子查询 （）
		列子查询   （）
		
		行子查询
		
	exists 后面：相关子查询
按结果集的行列数不同：
	标量子查询（结果集只有一行一列）
	列子查询 （结果集只有一列多行）
	行子查询 （结果集有一行多列）
	表子查询 （结果集一般为多行多列）
*/

#一、where 或 having 后面
/*
1、标量子查询 （单行子查询）
2、列子查询   （多行子查询）

3、行子查询   （多行多列）

特点：
1、子查询放在小括号内
2、子查询一般放在条件的右侧
3、标量子查询，一般搭配着单行操作符使用
>  <  >=  <=  =  <>

列子查询，一般搭配着多行操作符使用
in、 any/some、all

*/
#1、标量子查询

# 案例1：谁的工资比 Abel 高
USE myemployees;

#1.查询 Abel 的工资
SELECT salary
FROM employees
WHERE last_name = 'Abel';

#2.查询员工的信息，满足 salary > 1 结果
SELECT *
FROM employees
WHERE salary > (
	SELECT salary
	FROM employees
	WHERE last_name = 'Abel'
);

#案例2：返回job_id 与 141 号员工相同，salary 比143 号员工多的员工 姓名，job_id 和 工资
#1.查询 141 号员工的 job_id
SELECT job_id
FROM employees
WHERE employee_id = 141;

#2.查询 143 号员工的 salary
SELECT salary
FROM employees
WHERE employee_id = 143;

#3.查询员工的姓名，job_id 和工资，要求 job_id =1 并且salary >2
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = (
	SELECT job_id
	FROM employees
	WHERE employee_id = 141
) AND salary > (
	SELECT salary
	FROM employees
	WHERE employee_id = 143
);


#案例3：返回公司最少工资的员工的last_name, job_id 和 salary

#1.查询公司的 最低工资
SELECT MIN(salary)
FROM employees;

#2.查询last_name, job_id 和 salary, 要求 salary =1
SELECT last_name, job_id, salary
FROM employees
WHERE salary = (
	SELECT MIN(salary)
	FROM employees
);


#案例4：查询最低工资大于 50 号部门最低工资的部门 id 和其最低工资

#1 查询 50 号部门的最低工资
SELECT MIN(salary)
FROM employees
WHERE department_id = 50;

#2 查询每个部门的最低工资
SELECT MIN(salary),department_id
FROM employees
GROUP BY department_id;

#3 在 2 基础上筛选，满足 min(salary) > 1
SELECT MIN(salary), department_id
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (
	SELECT MIN(salary)
	FROM employees
	WHERE department_id = 50
);


#2.列子查询（多行子查询）
#案例1: 返回 location_id 是 1400 或 1700 的部门中的所有员工姓名

#1. 查询 location_id 是 1400 或 1700 的部门编号
SELECT DISTINCT department_id
FROM departments
WHERE location_id IN (1400, 1700)

#2. 查询员工姓名，要求部门号是 1 列表中的某一个
SELECT last_name
FROM employees
WHERE department_id IN (
	SELECT DISTINCT department_id
	FROM departments
	WHERE location_id IN (1400, 1700)
);


#案例2:返回其他部门中比 job_id 为 'IT_PROG' 部门任意工资低的员工的员工号、姓名、job_id 以及 salary

#1.查询 job_id 为 'IT_PROG' 部门任意工资
SELECT DISTINCT salary
FROM employees
WHERE job_id = 'IT_PROG';

#2.查询员工号、姓名、job_id 以及 salary, salary <(1) 的任意一个
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < ANY(

	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
	
) AND job_id <> 'IT_PROG';

# 或
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < (
	SELECT MAX(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';


#案例3:返回其他部门中比 job_id 为 'IT_PROG' 部门所有工资低的员工的员工号、姓名、job_id 以及 salary

SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < ALL(

	SELECT DISTINCT salary
	FROM employees
	WHERE job_id = 'IT_PROG'
	
) AND job_id <> 'IT_PROG';

# 或
SELECT last_name, employee_id, job_id, salary
FROM employees
WHERE salary < (
	SELECT MIN(salary)
	FROM employees
	WHERE job_id = 'IT_PROG'
) AND job_id <> 'IT_PROG';



#3、行子查询（结果集一行多列或多行多列）

#案例：查询员工编号表最小并且工资最高的员工信息

#1.查询最小的员工编号
SELECT MIN(employee_id)
FROM employees;

#2.查询最高工资
SELECT MAX(salary)
FROM employees;

#3.查询员工信息
SELECT *
FROM employees
WHERE employee_id = (
	SELECT MIN(employee_id)
	FROM employees
) AND salary = (
	SELECT MAX(salary)
	FROM employees
);


#二、select 后面
#案例：查询每个部门的员工个数

SELECT d.*,(
	SELECT COUNT(*)
	FROM employees e
	WHERE e.department_id = d.department_id
) 个数
FROM departments d;

#案例2：查询员工号=102的部门名

SELECT (
	SELECT department_name
	FROM departments d
	INNER JOIN employees e
	ON d.department_id = e.department_id
	WHERE e.employee_id = 102
) 部门名;

# 三、from后面
/*
将子查询结果充当一张表，要求必须起别名
*/

#案例：查询每个部门的平均工资的工资等级

#1.查询每个部门的平均工资
SELECT AVG(salary), department_id
FROM employees
GROUP BY department_id;

SELECT * FROM job_grades;

#2.连接1的结果集和 job_grades 表，筛选条件平均工资 between lowest_sal and highest_sal
SELECT ag_dep.*, g.grade_level
FROM (
	SELECT AVG(salary) ag, department_id
	FROM employees
	GROUP BY department_id
) ag_dep
INNER JOIN job_grades g
ON ag_dep.ag BETWEEN lowest_sal AND highest_sal;


#四、exists后面（相关子查询）
/*
语法：
exists（完整的查询语句）
结果：
1 或 0

*/

SELECT EXISTS(SELECT employee_id FROM employees WHERE salary=3000);


#案例1：查询有员工的部门名

#in
SELECT department_name
FROM departments d
WHERE d.department_id IN(
	SELECT department_id
	FROM employees
);

SELECT department_name
FROM departments d
WHERE EXISTS(
	SELECT *
	FROM employees e
	WHERE d.department_id = e.department_id
);

#案例2：查询没有女朋友的男神信息
USE girls;
#in

SELECT bo.*
FROM boys bo
WHERE bo.id NOT IN(
	SELECT boyfriend_id
	FROM beauty
);

#exists
SELECT bo.*
FROM boys bo
WHERE NOT EXISTS(
	SELECT boyfriend_id
	FROM beauty b
	WHERE bo.id=b.boyfriend_id
);





















