-- 1. 语法
select 字段列表 from 表名 [where 条件] group by 分组字段名 [having 分组后过滤条件];


-- 2. where 和 having 区别
执行时机不同: where 是分组之前进行过滤,不满足 where 条件,不参与分组; 而 having 是分组之后对结果进行过滤.
判断条件不同: where 不能对聚合函数进行判断,而 having 可以.


-- 示例
-- 1. 根据性别分组,统计男性员工和女性员工的数量
select gender count(*) from emp group by gender;


-- 2. 根据性别分组,统计男性员工和女性员工的平均年龄
select avg(age) from emp group by gender;
select gender, avg(age) from emp group by gender;

-- 3. 查询年龄小于 45 的员工,并根据工作地址分组,获取员工数量大于等于3的工作地址
select workaddress, count(*) from emp where age < 45 group by workaddress having count(*) >= 3;

别名
select workaddress, count(*) address_count from emp where age < 45 group by workaddress having address_count >= 3;


-- 注意
执行顺序:where > 聚合函数 > having (where 是在分组之前执行的,分组的时候执行聚合函数)
分组之后,查询的字段一般为聚合函数和分组字段,查询其他字段无任何意义;
