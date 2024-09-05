-- 标量子查询
子查询返回的结果是单个值（数字、字符串、日期等），最简单的形式，这种子查询成为标量子查询。
常用的操作符：= <> > >= < <=


示例：
1. 查询“销售部”的所有员工信息
a. 查询“销售部” 部门ID
select id from dept where name = '销售部';


b. 根据销售部部门
select * from emp where dept_id = 4;


合并
select * from emp where dept_id = (select id from dept where name = '销售部');




2. 查询在“方东百”入职之后的员工信息
a. 查询 方东百 的入职日期
select entrydate from emp where name = '方东百';


b. 查询指定入职日期之后入职的员工信息
select * from emp where entrydate > '2009-02-12';


合并
select * from emp where entrydate > (select entrydate from emp where name = '方东百');
