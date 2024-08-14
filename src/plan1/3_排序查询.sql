#进阶3：排序查询

/*
引入：

语法：
	select 查询列表
	from 表
	where 筛选条件
	order by 排序列表 [asc | desc]
特点：
	1.asc 代表的是升序，desc 代码的是降序
	如果不写，默认是升序
*/
#案例1：查询员工信息，要求工资从高到低
SELECT * FROM employees ORDER BY salary DESC;

SELECT * FROM employees ORDER BY salary;



#案例2：查询部门编号 >= 90的员工信息，按入职时间的先后进行排序【添加筛选条件】
SELECT 
	*
FROM
	employees
WHERE
	department_id >= 90
ORDER BY
	hiredate ASC;
	
	
#案例3：按年薪的高低显示员工的信息和年薪 【按表达式排序】

SELECT 
	*, 
	salary*12*(1+IFNULL(commission_pct, 0)) 年薪
FROM
	employees
ORDER BY
	salary*12*(1+IFNULL(commission_pct, 0)) DESC;
	
	
#案例4：按年薪的高低显示员工的信息和年薪 【按别名排序】
SELECT
	*,
	salary*12*(1+IFNULL(commission_pct, 0)) 年薪
FROM
	employees
ORDER BY
	年薪 DESC;
	
	
#案例5：按姓名的长度显示员工的姓名和工资【按函数排序】
SELECT
	LENGTH(last_name) 字节长度, 
	last_name,
	salary
FROM
	employees
ORDER BY
	LENGTH(last_name) DESC;
	
	
#案例6：查询员工信息，要求按工资升序，再按员工编号降序【按多个字段排序】
SELECT
	*
FROM
	employees
ORDER BY
	salary ASC,
	employee_id DESC;
	
	

