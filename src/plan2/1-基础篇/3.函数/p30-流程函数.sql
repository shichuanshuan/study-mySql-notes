-- if(value, t, t)
如果 value 为 true，则返回 t，否则返回 f

示例：
select if(true, 'ok', 'error');

select if(false, 'ok', 'error');



-- ifnull(value1, value2)
如果 value1 不为空，则返回 value1，否则返回 value2

示例：
select ifnull(null, 'default');



-- case when [val1] then[res1]... else[default] end
如果 val1 为 true，返回 res1，...否则返回 default 默认值

示例：
查询 emp 表的员工姓名和工作地址（北京/上海 -> 一线城市，其他 -> 二线城市）
select 
    name,
    (case workaddress when '北京' then '一线城市' when '上海' then '一线城市' else '二线城市' end) as '工作地址'
from emp;




-- case [expr] when [var1] then [res1] ...else[default] end
如果 expr 的值等于 val1，返回 res1，...否则返回 default 默认值

示例：
统计班级各个学员的成绩，展示的规则如下：
>= 85 展示优秀
>= 60 展示及格
否则，展示不及格

create table score(
    id int,
    name varchar(20),
    math int,
    english int,
    chinese int
);

insert into score(id, name, math, english, chinese) values(1, 'tom', 67, 88, 95), (2, 'rose', 23, 66, 90), (3, 'jack', 56, 98, 76);


select
    id,
    name,
    case when math >= 85 then '优秀' when math >= 60 then '及格' else '不及格' end,
    case when english >= 85 then '优秀' when english >= 60 then '及格' else '不及格' end,
    case when chinese >= 85 then '优秀' when chinese >= 60 then '及格' else '不及格' end
from score;