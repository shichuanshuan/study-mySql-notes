#存储过程和函数
/*
存储过程和函数：类似于 java 中的方法
好处：
1、提高代码的重用性
2、简化操作


*/
#存储过程
/*
含义：一组预先编译好的 sql 语句的集合，理解成批处理语句
1、提高代码的重用性
2、简化操作
3、减少了编译次数并且减少了和数据库服务器的连接次数，提高了效率

*/

#一、创建语法
/*
create procedure 存储过程名（参数列表）
begin
	存储过程体（一组合法的 sql 语句）
end


注意
1、参数列表包含三部分
参数模式 参数名 参数类型
举例：
in stuname varchar(20)

参数模式
in：该参数可以作为输入，也就是该参数需要调用方传入值
out：该参数可以作为输出，也就是该参数可以作为返回值
inout：该参数既可以作为输入又可以作为输出，也就是该参数即需要传入值，又可以返回值

2、如果存储过程体仅仅只有一句话，begin end 可以省略
存储过程体中的每天 SQL 语句的结尾要求必须加上分号。
存储过程的结尾可以使用 delimiter 重新设置
语法
delimiter 结束标记

delimiter $
*/


#二、调用语法
# call 存储过程(实参列表);


#1、空参列表
#案例：插入到 admin 表中五条记录
SELECT * FROM admin;

DESC admin;

DELIMITER $
CREATE PROCEDURE myp1()
BEGIN
	INNER INTO admin(username, `password`)
	VALUES('john1', '0000'), 
	('lily', '0000'),
	('rose', '0000'),
	('tom', '0000');
END $

#调用
CALL myp1()$

#2、创建带 in 模式参数的存储过程

#案例1：创建存储过程实现，根据女神名，查询对应的男神信息

CREATE PROCEDURE myp2(IN beautyName VARCHAR(20))
BEGIN
	SELECT bo.*
	FROM boys bo
	RIGHT JOIN beauty b ON bo.id = b.boyfriend_id
	WHERE b.name=beautyName;
END $

#调用
CALL myp2('小昭')$


#案例2：创建存储过程实现，用户是否登录成功
CREATE PROCEDURE myp3(IN username VARCHAR(20), IN PASSWORD VARCHAR(20))
BEGIN
	DECLARE result VARCHAR(20) DEFAULT ''; #声明并初始化
	
	SELECT COUNT(*) INTO result #赋值
	FROM admin a
	WHERE a.username = username
	AND a.password = PASSWORD;
	
	SELECT result;#使用
END $

#调用
CALL myp3('张飞','8888') $


#3、创建带 out 模式的存储过程

#案例1：根据女神名，返回对应的男神名
CREATE PROCEDURE myp5(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20))
BEGIN
	SELECT bo.boyName INTO boyName
	FROM boys bo
	INNER JOIN beauty b ON bo.id = b.boyfriend_id
	WHERE b.name=beautyName;
END $

#调用
CALL myp5('小昭', @bName)$

SELECT @bName$

#案例2：根据女神名，返回对应的男神名和男神魅力值

CREATE PROCEDURE myp6(IN beautyName VARCHAR(20), OUT boyName VARCHAR(20), OUT userCp INT)
BEGIN
	SELECT bo.boyName, bo.userCp INTO boyName, userCp
	FROM boys bo
	INNER JOIN beauty b
	ON bo.id = b.boyfriend_id
	WHERE b.name=beautyName;
END $

#调用
CALL myp6('小昭', @bName, @usercp)$
SELECT @bName, @usercp$


#4、创建带 inout 模式参数的存储过程
#案例1：传入 a 和 b 两个值，最终 a 和 b 都翻倍并返回
CREATE PROCEDURE myp8(INOUT a INT, INOUT b INT)
BEGIN
	SET a = a * 2;
	SET b = b * 2;
END $

#调用
SET @m = 10$
SET @n = 20$

CALL myp8(@m, @n)$
SELECT @m, @n$

#二、删除存储过程
DROP PROCEDURE myp8;


#三、查看存储过程的信息
SHOW CREATE PROCEDURE myp3;