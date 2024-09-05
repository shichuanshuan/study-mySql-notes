-- 概念
SQL 语句中嵌套 select 语句，称为嵌套查询，又称为子查询

select * from t1 where column1 = (select column1 from t2);
子查询外部的语句可以是 insert / update / delete / select 的任何一个


根据子查询结果不同，分为：
标量子查询：    子查询结果为单个值
列子查询：      子查询结果为一列
行子查询：      子查询结果为一行
表子查询：      子查询结果为多行多列



根据子查询位置，分为：
where 之后
from 之后
select 之后