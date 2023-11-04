#进阶4：常见函数
/*

概念：类似于 java 的方法，将一组逻辑语句封装在方法体中，对外暴露了方法名
好处：1、隐藏了实现细节 2、提高代码的重用性
调用：select 函数名(实参列表) 【from】;
特点：
	1.叫什么（函数名）
	2.干什么（函数功能）
分类
	1.单行函数
	如 concat、length、ifnull等
	2.分组函数
	
	功能：做统计使用，又称为统计函数、聚合函数、组函数

*/

#一、字符函数

#1.length 获取参数值的字节个数
SELECT LENGTH('john');
SELECT LENGTH('张三丰hahaha');

SHOW VARIABLES LIKE '%char%';

#2.concat 拼接字符串
SELECT CONCAT(last_name, '_', first_name) 姓名 FROM employees;

#3.upper (小写变大写)
#  lower (大写变小写)
SELECT UPPER('john');
SELECT LOWER('MAKE');


#示例：将姓变大写、名变小写、然后拼接
SELECT 
	CONCAT(UPPER(last_name),LOWER(first_name)) 姓名
FROM
	employees;

#4.substr  截取字符串
#注意：索引从1开始
#截取从指定索引处后面所有字符

SELECT SUBSTR('shidashuan', 4) shi;

SELECT SUBSTR('李莫愁爱上了陆展元', 7) out_put;

#截取从指定索引处指定字符长度的字符
SELECT SUBSTR('李莫愁爱上了陆展元', 1, 3) out_put;

#案例：姓名中首字符大写，其他字符小写然后用_拼接，显示出来
SELECT 
	CONCAT(UPPER(SUBSTR(last_name, 1, 1)), '_', LOWER(SUBSTR(last_name, 2))) out_put
FROM
	employees;


#5.instr 返回子串第一次出现的索引，如果找不到返回 0

SELECT INSTR('杨不悔爱上了殷六侠','殷六侠') out_put;

SELECT INSTR('杨不悔爱上了殷六侠','殷ba侠') out_put;


#6.trim
SELECT LENGTH(TRIM('  张翠山 ')) out_put;

SELECT TRIM('a' FROM 'aaaaZaCSaaaaaa') AS out_out;

#7.lpad 用指定的字符实现左填充指定长度

SELECT LPAD('殷素素', 9, '*') AS out_put;

SELECT LPAD('殷素素', 2, '*') AS out_put;

#8.rpad 用指定的字符实现右填充指定长度

SELECT RPAD('殷素素', 6, '*') AS out_put;

SELECT LPAD("shida", 10, "@") out_put;

#9.replace 替换

SELECT REPLACE('周芷若张无忌爱上了周芷若','周芷若','赵敏') AS out_put;


#二、数学函数

#round 四舍五入
SELECT ROUND(-1.55);
SELECT ROUND(1.567, 2);


#ceil 向上取整,返回>=该参数的最小数

SELECT CEIL(1.5);

#floor 向下取整，返回<=该参数的最大整数
SELECT FLOOR(1.9);


#truncate 截断
SELECT TRUNCATE(1.69999, 1);

#mod 取余
SELECT MOD(10, 3);


#三、日期函数

#now 返回当前系统日期+时间
SELECT NOW();

#curdate 返回当前系统日期，不包含时间
SELECT CURDATE();

#curtime 返回系统当前时间，不包含日期

SELECT CURTIME();


#可以获取指定的部分，年、月、日

SELECT DATE(NOW());

SELECT YEAR(NOW()) 年;
SELECT YEAR('1997-01-16') 年;

SELECT YEAR(hiredate) 年 FROM employees;

SELECT MONTH(NOW()) 月;
SELECT MONTHNAME(NOW()) 月; #显示英文状态

####

SELECT DATE(NOW());

SELECT DATE('19970101');

SELECT first_name, (hiredate) FROM employees;

DESC employees;

USE students;

SELECT * FROM tab_identity;

CREATE TABLE test(
birdy DATETIME
);


INSERT INTO test VALUES('2020-10-10 19:00:00');

SELECT * FROM test WHERE birdy = STR_TO_DATE('2020-10-10', '%Y%c%d');

####


#str_to_date 将字符通过指定的格式转换成日期
/*
序号	格式符		功能
1	%Y		四位的年份
2	%y		2位的年份
3	%m		月份(01,02...11,12)
4	%c		月份(1,2...11,12)
5	%d		日(01,02...)
6	%H		小时(24小时制)
7	%h		小时(12小时制)
8	%i		分钟(00,01...59)
9	%s		秒(00,01...59)

*/
SELECT STR_TO_DATE('1997-01-12', '%Y-%c-%d') AS out_put;

#查询入职日期为 1992-4-3的员工信息
SELECT * FROM employees WHERE hiredate = '1992-4-3';

SELECT * FROM employees WHERE hiredate = STR_TO_DATE('4-3 1992','%c-%d %Y');


#date_format 将日期转换成字符

SELECT DATE_FORMAT(NOW(), '%y年%m月%d日') AS out_put;

#查询有奖金的员工名和入职日期(xx月/xx日 xx年)
SELECT 
	last_name, DATE_FORMAT(hiredate, '%m月/%d日 %y年') 入职日期
FROM
	employees
WHERE
	commission_pct IS NOT NULL;





