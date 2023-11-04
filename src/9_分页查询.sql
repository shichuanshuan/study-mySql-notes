#进阶九：分页查询 *
/*
应用场景：当要显示的数据，一页显示不全，需要分页提交 sql 请求
语法：
	select 查询列表
	from 表
	【join type join 表2
	on 连接条件
	where 筛选条件
	group by 分组字段
	having 分组后的筛选
	order by 排序的字段
	】
	limit offset, size;
	
	offset 要显示条目的起始索引（起始索引从 0 开始）
	size 要显示的条目个数
特点：	
	1.limit 语句放在查询语句的最后
	2.公式
	要显示的页数 page,每页的条目数 size
	
	select 查询列表
	from 表
	limit (page-1)*size, size
	
	size = 10
	page
	1	0
	2	10
	3	20
*/
#案例1：查询前五条员工信息

SELECT * FROM employees LIMIT 0, 5;
SELECT * FROM employees LIMIT 5;

#案例2：查询第11条-第25条
SELECT * FROM employees LIMIT 10,15;

#案例3：有奖金的员工信息，并且工资较高的前10名显示出来
SELECT * 
FROM employees 
WHERE commission_pct IS NOT NULL
ORDER BY salary DESC
LIMIT 10;


# 联合查询
/*
union 联合 合并：将多条查询语句的结果合并成一个结果

语法：
查询语句1
union
查询语句2
union
...

特点：
1、要求多条查询语句的查询列数是一致的
2、要求多条查询语句的查询的每一列的类型和顺序最好一致
3、union 关键字默认去重，如果使用 union all 可以包含重复项
*/

# 引入的案例：查询部门编号 >90 或邮箱包含 a 的员工信息
SELECT *FROM employees WHERE email LIKE '%a%' OR department_id > 90;

SELECT * FROM employees WHERE email LIKE '%a%'
UNION
SELECT * FROM employees WHERE department_id > 90;



















