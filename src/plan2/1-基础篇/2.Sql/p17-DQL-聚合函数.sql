-- 1. 介绍
将一列数据作为一个整体，进行纵向计算


-- 2. 常见聚合函数
函数            功能
count       统计数量
max         最大值
min         最小值
avg         平均值
sum         求和


-- 3. 语法
select 聚合函数(字段列表) from 表名;
注意:null 值不参与所有聚合函数运算。


-- 练习
-- 1. 统计该企业员工数量
select count(*) from emp;


-- 2. 统计该企业员工的平均年龄
select avg(age) from emp;


-- 3. 统计该企业员工的最大年龄
select max(age) from emp;


-- 4. 统计该企业员工的最小年龄
select min(age) from emp;


-- 5. 统计先地区员工的年龄之和
select sum(age) from emp where workaddress = '西安';