-- DML 修改数据
/*
update 表名 set 字段名1 = 值1, 字段名2=值2,... where 条件;
注意：修改语句的条件可以有，也可以没有，如果没有条件，则会修改整张表的所有数据.


示例:
修改 id 为 1 的数据，将 name 修改为 itheima
update employee set name = 'itheima';


将所有的员工入职日期修改为 2008-01-01
update employee set entrydate = '2008-01-01';
*/


-- 删除数据
/*
delete from 表名 where 条件;
delete 语句的条件可以有，也可以没有，如果没有条件，则会删除整张表的所有数据。
delete 语句不能删除某一个字段的值（可以使用 update）


示例：
删除 gender 为女的信息
delete from employee where gender = '女';


删除所有信息
delete from employee;

*/