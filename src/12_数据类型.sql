#常见的数据类型
/*
数值型：
	整型
	小数：
		定点数
		浮点数
字符型：
	较短的文本：char、varchar
	较长的文本：text、blob（较长的二进制数据）
	
日期型：


*/

#一、整型
/*
分类：
tinyint smallint mediumint int/interger bigint
1	2	 3	   4		8

特点：
1.如果不设置无符号还是有符号，如果想设置无符号，需要添加 unsigned 关键字
2.如果插入的数值超出了整型的范围，会报 out of range 异常，并且插入临界值
3.如果不设置长度、会有默认的长度
长度代表了显示的最大宽度，如果不够会用 0 在左边填充，但必须搭配 zerofill 使用
*/

#1.如何设置无符号和有符号


DROP TABLE IF EXISTS tab_date;

CREATE TABLE tab_int(
	t1 INT,
	t2 INT UNSIGNED
);


CREATE TABLE tab_int(
	t1 INT(7) ZEROFILL,
	t2 INT(7) ZEROFILL
);

INSERT INTO tab_int VALUES(-123456);
INSERT INTO tab_int VALUES(-123456, -123456)
INSERT INTO tab_int VALUES(2147483648, 4294967296);

SELECT * FROM tab_int;

#二、小数
/*
分类：
1.浮点型
float (M,D)
double(M,D)

2.定点型
dec(M,D)
decimai(M,D)

特点：
1. 
M：整数部位 + 小数部位
D：小数部位
如果超过范围，则插入临界值

2.
M 和 D 都可以省略
如果是 decimal，则 M 默认为 10，D 默认为 0
如果是 float 和 double，则会根据插入的数值的精度来决定精度

3.定点型的精确度较高，如果要求插入的数值的精度较高如货币运算等则考虑使用
*/

DROP TABLE tab_float;

CREATE TABLE tab_float(
	f1 FLOAT(5,2),
	f2 DOUBLE(5,2),
	f3 DECIMAL(5,2)
);

SELECT * FROM tab_float;

INSERT INTO tab_float VALUES(123.45,123.45,123.45);
INSERT INTO tab_float VALUES(223.456,123.456,123.456);
INSERT INTO tab_float VALUES(323.4,123.4,123.4);

CREATE TABLE tab_float(
	f1 FLOAT,
	f2 DOUBLE,
	f3 DECIMAL
);

INSERT INTO tab_float VALUES(123,4523,123,4523,123,4523);
INSERT INTO tab_float VALUES(123,45,123,45,123,45);
INSERT INTO tab_float VALUES(123,456,123,456,123,456);

#原则
/*
所选择的类型越简单越好，能保存数值的类型越小越好

*/


#三、字符型
/*
较短的文本：
char
varchar

其他：

binary 和 varbinary 用于保存较短的二进制
enum 用于保存枚举
set 用于保存集合

较长的文本：
text
blob(较大的二进制)

特点：

	写法		M 的意思	特点		空间的耗费	效率
char	char(M)		最大的字符数	固定长度的字符	比较耗费	高

varchar	varchar(M)	最大的字符数	可变长度的字符	比较节省	低

*/


DROP TABLE tab_char;

SELECT * FROM tab_char;

CREATE TABLE tab_char(
	c1 ENUM('a', 'b', 'c')
);


INSERT INTO tab_char VALUES('a');
INSERT INTO tab_char VALUES('b');
INSERT INTO tab_char VALUES('c');
INSERT INTO tab_char VALUES('m');
INSERT INTO tab_char VALUES('A');


CREATE TABLE tab_set(
	s1 SET('a', 'b', 'c', 'd')
);

SELECT * FROM tab_set;
DROP TABLE tab_set;

INSERT INTO tab_set VALUES('a');
INSERT INTO tab_set VALUES('A,B');
INSERT INTO tab_set VALUES('a,b,c');


#四、日期型

/*
分类：
date 只保存日期
time 只保存时间
year 只保存年

datetime 保存日期 + 时间
timestamp 保存日期 + 时间

特点：

		字节	范围		时区等的影响
datetime	8	1000-9999	不受
timestamp	4	1970-2038	受

*/


CREATE TABLE tab_date(
	t1 DATETIME,
	t2 TIMESTAMP
);


INSERT INTO tab_date VALUES(NOW(), NOW());

SELECT * FROM tab_date;

SHOW VARIABLES LIKE 'time_zone';

SET time_zone='+9:00';


