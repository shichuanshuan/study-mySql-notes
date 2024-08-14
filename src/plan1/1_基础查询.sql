#进阶1：基础查询
/*
select 查询列表 from 表名

类似于：println(打印东西)

特点:

1、查询列表可以是：表中的字段、常量值、表达式、函数
2、查询的结果是一个虚拟的表格
*/

#要先切换到对应的表
USE myemployees;


#1.查询表中的单个字段
#语法：select 查询内容 from 在哪个表中查询
SELECT last_name FROM employees;


#2.查询表中的多个字段
SELECT last_name, salary, email FROM employees;


#3.查询多个，可以双击表中内容，F12 刷新格式
SELECT `employee_id`,`first_name`,`last_name` FROM employees;

#查询全部内容 方法二
SELECT * FROM employees;

#4.查询常量值
SELECT 100;
SELECT 'john';


#5.查询表达式
SELECT 100%98;


#6.查询函数
SELECT VERSION();


#7.起别名
/*
1.便于理解
2.如果要查询的字段有重名的情况，使用别名可以区分开来

*/
#方式一：使用 as
SELECT 100%98 AS 结果;
SELECT last_name AS 姓, first_name AS 名 FROM employees;

#方式二：使用空格
SELECT last_name 姓, first_name 名 FROM employees;

#案例:查询 salary，显示结果为 out put,系统会误认为是关键字
#因此加上双引号就行了
SELECT salary AS "out put" FROM employees;


#8.去重

#案例：查询员工表中涉及到的所有部门编号
SELECT department_id FROM employees;

#加关键字 distinct
SELECT DISTINCT department_id FROM employees;

#9.+号的作用

/*
java中的 + 号
1.运算符，连接操作数都为数值型
2.连接符，只要有一个操作数为字符串

mysql中的 + 号
仅仅只有一个功能：运算符

select 100+90;    两个操作数都为数值型，则做加法运算
select '123'+90;  只要其中一方为字符型，试图将字符型转换成数值型
                  如果转换成功，则继续做加法运算
select 'john'+90; 如果转换失败，则将字符型转换成 0

select null+10;   只要其中一方为null，则结果肯定为null

*/
#案例：查询员工名和姓连接成一个字段，并显示为 姓名
/*
错误示范
select 
	last_name+first_name as 姓名
from
	employees;
*/
SELECT CONCAT('a', 'b', 'c') AS 结果;

SELECT 
       CONCAT(last_name, first_name) AS 姓名
FROM
       employees;
       
