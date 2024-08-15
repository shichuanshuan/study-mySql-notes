-- 1. 语法
select 字段列表 from 表名 where 条件列表;


-- 2. 条件
比较运算符      功能
>
>=
<
<=
=
<> 或 !=
BETWEEN..AND.. 在某个范围之内(含最小、最大值)
IN(...)        在 in 之后的列表中的值，多选一
LIKE 占位符     模糊匹配(_匹配单个字符，%匹配任意个字符)
IS NULL        是 NULL


逻辑运算符       功能
AND 或 &&       并且(多个条件同时成立)
OR 或 ||        或者(多个条件任意一个成立)
NOT 或 !        非，不是



-- 1. 查询年龄等于 88 的员工
select * from emp where age = 18;


-- 2. 查询年龄小于 20 的员工信息
select * from emp where age <= 20;


-- 3. 查询年龄等于 20 的员工信息
select * from emp where age = 20;


-- 4. 查询没有身份证号的员工信息
select * from emp where idcard is null;


-- 5. 查询有身份证号的员工信息
select * from emp where idcard is not null;


-- 6. 查询年龄不等于 88 的员工信息
select * from emp where age != 88;
select * from emp where age <> 88;


-- 7. 查询年龄再 15岁到 20 岁之间的员工信息
select * from emp where age > 15 and age < 20;

select * from emp where age between 15 and 20;


-- 8. 查询性别为女且年龄小于 25 岁的员工信息
select * from emp where gender = '女' and age < 25;


-- 9. 查询年龄等于 18 或 20 或 40 的员工信息
select * from emp where age = 18 or age = 20 or age = 40;
select * from emp where age in(18, 20, 40);



-- 10. 查询姓名为两个字的员工信息
select * from emp where name like '__';


-- 11. 查询身份证最后一位是 X 员工信息
select * from emp where idcard like '%X';
select * from emp where idcard like '__________________X';