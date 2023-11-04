#进阶5、分组查询
/*
语法：
	select 分组函数，列（要求出想在 group by 的后面）
	from 表
	【where 筛选条件】
	group by 分组的列表
	【order by 子句】
注意：
	查询列表必须特殊，要求是分组函数和group by后出现的字段
	
特点：
	1、分组查询中的筛选条件分为两类
			数据源		位置			关键字
	分组前筛选	原始表		group by 子句的前面	where
	分组后筛选	分组后的结果集	group by 字句的后面	having
	
	(1) 分组函数做条件肯定是放在 having 子句中
	(2) 能用分组前筛选的，就优先考虑使用分组前筛选
	2、group by 子句支持单个字段分组，多个字段分组（多个字段之间用逗号隔开没有顺序要求），表达式或函数（用的较少）
	3、也可以添加排序（排序放在整个分组查询的最后）
*/

# 引入：查询每个部门的平均工资
SELECT AVG(salary) FROM employees;

# 简单的分组查询
# 案例1：查询每个工种的最高工资

SELECT MAX(salary), job_id
FROM employees
GROUP BY job_id;

# 案例2：查询每个位置上的部门个数
SELECT COUNT(*), location_id
FROM departments
GROUP BY location_id;


SELECT COUNT(*), location_id
FROM departments
GROUP BY location_id;


# 添加筛选条件 分组前筛选
# 案例1： 查询邮箱中包含 a 字符的，每个部门的平均工资
SELECT AVG(salary), department_id
FROM employees
WHERE email LIKE '%a%'
GROUP BY department_id;

# 案例2：查询有奖金的每个领导手下员工的最高工资
SELECT MAX(salary), manager_id
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY manager_id;


# 添加复杂的筛选条件 分组后筛选

# 案例1：查询哪个部门的员工个数 > 2

# (1). 查询每个部门的员工个数
SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id;

# (2). 根据 (1) 的结果进行筛选，查询哪个部门的员工个数 > 2
SELECT COUNT(*), department_id
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 2;


# 案例2：查询每个工种有奖金的员工的最高工资 > 12000的工种编号和最高工资

# (1). 查询每个工种有奖金的员工的最高工资
SELECT MAX(salary), job_id 
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id;

# (2). 根据 (1) 结果继续筛选，最高工资 > 12000
SELECT MAX(salary), job_id 
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY job_id
HAVING MAX(salary) > 12000;


# 案例3：查询领导编号 > 102 的每个领导手下的最低工资 > 5000的领导编号是哪个，以及最低工资

# (1). 查询每个领导手下的员工固定最低工资
SELECT MIN(salary), manager_id
FROM employees
GROUP BY manager_id;

# (2). 添加筛选条件：编号 > 102
SELECT MIN(salary), manager_id
FROM employees
WHERE manager_id > 102
GROUP BY manager_id;

# (3). 添加筛选条件：最低工资 > 5000
SELECT MIN(salary), manager_id
FROM employees
WHERE manager_id > 102
GROUP BY manager_id
HAVING MIN(salary) > 5000;


# 按表达式或函数分组

# 案例：按员工姓名的长度分组，查询每一组的员工个数，筛选员工个数 > 5 的有哪些

# (1) 查询每个长度的员工个数
SELECT COUNT(*), LENGTH(last_name) len_name
FROM employees
GROUP BY LENGTH(last_name);

# (2) 添加筛选条件
SELECT COUNT(*), LENGTH(last_name) len_name
FROM employees
GROUP BY LENGTH(last_name)
HAVING COUNT(*) > 5;


SELECT COUNT(*) c, LENGTH(last_name) len_name
FROM employees
GROUP BY len_name
HAVING c > 5;


# 按多个字段分组

# 案例：查询每个部门每个工种的员工的平均工资

SELECT AVG(salary), department_id, job_id
FROM employees
GROUP BY department_id, job_id;


# 添加排序

# 案例：查询每个部门每个工种的员工的平均工资，并且按平均工资的高低显示

SELECT AVG(salary), department_id, job_id
FROM employees
WHERE department_id IS NOT NULL
GROUP BY job_id, department_id
HAVING AVG(salary) > 10000

ORDER BY AVG(salary) DESC;













