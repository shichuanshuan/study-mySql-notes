#二、分组函数
/*
功能：用作统计使用，又称为聚合函数或统计函数或组函数

分类：
sum 求和、avg 平均值、max最大值、min最小值、count计算个数

特点
1、sum、avg一般用于处理数值函数
   max、min、count可以处理任何类型
2、以上分组函数都忽略 null 值

3、可以和 distinct 搭配实现去重的运算

5、和分组函数一同查询的字段要求是group by后的字段
*/

#1、简单 的使用
SELECT SUM(salary) FROM employees;
SELECT AVG(salary) FROM employees;
SELECT MAX(salary) FROM employees;
SELECT MIN(salary) FROM employees;
SELECT COUNT(salary) FROM employees;

SELECT 
	SUM(salary) 和, 
	AVG(salary) 平均,
	MAX(salary) 最高,
	MIN(salary) 最低,
	COUNT(salary) 个数
FROM
	employees;


#2、支持哪些类型

SELECT SUM(last_name), AVG(last_name) FROM employees;
SELECT SUM(hiredate), AVG(hiredate) FROM employees;

SELECT MAX(last_name), MIN(last_name) FROM employees;

SELECT MAX(hiredate), MIN(hiredate) FROM employees;

SELECT COUNT(commission_pct) FROM employees;
SELECT COUNT(last_name) FROM employees;


#3.是否忽略 null

SELECT SUM(commission_pct), AVG(commission_pct), SUM(commission_pct)/35, SUM(commission_pct)/107 FROM employees;
SELECT MAX(commission_pct), MIN(commission_pct) FROM employees;

SELECT COUNT(commission_pct) FROM employees;
SELECT commission_pct FROM employees;


#4、和distinct搭配
SELECT SUM(DISTINCT salary),
	SUM(salary) 
FROM 
	employees;

SELECT 
	COUNT(DISTINCT salary),
	COUNT(salary)
FROM
	employees;


#5、count 函数的详细介绍

SELECT COUNT(salary) FROM employees;

SELECT COUNT(*) FROM employees;

SELECT COUNT(1) FROM employees;

SELECT DATEDIFF(NOW(),'1997-01-16');