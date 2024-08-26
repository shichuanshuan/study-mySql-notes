-- CONCAT(s1, s2,...sn)
字符串拼接，将 s1, s2,...sn拼接成一个字符串

示例：
select concat('hello', ' Mysql');



-- LOWER(str)
将字符串 str 全部转为小写

示例：
select lower('Hello');



-- UPPER(str)
将字符串 str 全部转为大写

示例：
select upper('hello');



-- LPAD(str,n,pad)
左填充，用字符串 pad 对 str 的左边进行填充，达到 n 个字符串长度

示例：
select lpad('01', 5, '-');



-- RPAD(str,n,pad)
右填充，用字符串 pad 对 str 的右边进行填充，达到 n 个字符串长度

示例：
select rpad('01', 5, '-');



-- TRIM(str)
去掉字符串头部和尾部的空格

示例：
select trim(' hello mysql ');



-- SUBSTRING(str, start, len)
返回从字符串 str 从 start 位置起的 len 个长度的字符串

示例：
select substring('hello mysql', 1, 5);



综合示例：
由于业务需求变更，企业员工的工号，统一为 5 位数，目前不足 5 位数的全部在前面补0
update emp set workno = lpad(workno, 5, '0');