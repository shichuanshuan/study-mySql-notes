-- DQL 执行顺序

select 字段列表 from 表名列表 where 条件列表 group by 分组字段列表 having 分组后条件列表 order by 排序字段列表 limit 分页参数
4               1            2              3                                        5                    6


-- 1. 查询年龄大于 15 的员工姓名，年龄，并根据年龄进行升序排序
select name, age from emp where age > 15 order by age asc;

-- 2. 起别名
select name, age from emp e where e.age > 15 order by age asc;

-- 3. 字段列表也使用别名，因为顺序是 from 后，select，所以可以使用别名
select e.name, e.age from emp e where e.age > 15 order by age asc;