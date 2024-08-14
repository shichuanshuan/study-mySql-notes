#进阶2：条件查询
/*

语法： 
       select 
              查询列表
       from
              表名
       where
              筛选条件
分类：
      一、按条件表达式筛选
      条件运算符：>  <  =  !=  <>  >=  <=
      
      二、按逻辑表达式筛选
      逻辑运算符:
                  &&  ||  !
                  and or  not
       
       三、模糊查询
               like
               between and
               in
               is null

*/
#一、按条件表达式筛选

#案例1：查询工资>12000的员工信息
SELECT
	*
FROM
	employees
WHERE
	salary>12000;
	
	
	
#案例2：查询部门编号不等于90号的员工名和部门编号
SELECT
	last_name,
	department_id
FROM
	employees
WHERE
	department_id<>90;

	
#二、按逻辑表达式筛选

#案例1：查询工资在10000到20000之间的员工名、工资以及奖金
SELECT
	last_name,
	salary,
	commission_pct
FROM
	employees
WHERE
	salary>=10000 AND salary<=20000;
	
	

#案例2：查询部门编号不是在90到110之间，或者工资高于15000的员工信息
SELECT
	last_name,
	salary,
	department_id
FROM
	employees
WHERE
	#department_id<90 or department_id>110 or salary>15000;
	NOT(department_id>=90 AND department_id<=110) OR salary>15000;
	
	

#三、模糊查询
/*

like
特点：
1.一般和通配符搭配使用
	通配符
	% 任意多个字符
	_任意单个字符
	
between and
in
is null | is not null

*/
#1.like

#案例1：查询员工名中包含字符a的员工信息
SELECT
	*
FROM
	employees
WHERE
	last_name LIKE '%a%';
	
	
#案例2：查询员工名中第三个字符为e，第五个字符为a的员工名和工资
SELECT
	last_name,
	salary
FROM
	employees
WHERE
	last_name LIKE '__n_l%';
	
	
	
#案例3：查询员工名中第二字符为_的员工名
SELECT
	last_name
FROM
	employees
WHERE
	last_name LIKE '_\_%';
	#last_name like '_$_%' escape '$';
	
	
#2.between and
/*
1.使用between and 可以提高语句的简洁度
2.包含临界值
3.两个临界值不要调换顺序

*/

#案例1：查询员工编号在100 到 120 之间的员工信息
SELECT
	*
FROM
	employees
WHERE
	employee_id >= 100 AND employee_id <= 120;
	
#-------------------
SELECT
	*
FROM
	employees
WHERE
	employee_id BETWEEN 100 AND 120;
	

#3.in
/*
含义：判断某字段的值是否属于 in 列表中的某一项
特点：
	1.使用 in 提高语句简洁度
	2.in 列表的值类型必须一致或兼容
*/
#案例：查询员工的工种编号是 IT_PROG、AD_VP、AD_PRES中的一个员工名和工种编号
SELECT
	last_name,
	job_id
FROM
	employees
WHERE
	job_id = 'IT_PROT' OR job_id = 'AD_VP' OR JOB_ID = 'AD_PRES';

	
#--------------------
SELECT
	last_name,
	job_id
FROM
	employees
WHERE
	job_id IN ('IT_PROT','AD_VP','AD_PRES');
	
	
	
#4.IS NULL
/*
= 或 <> 不能用于判断 null 值
is null 或 is not null 可以判断 null

*/
#案例1：查询没有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NULL; 
	
	
	
#案例2：查询有奖金的员工名和奖金率
SELECT
	last_name,
	commission_pct
FROM
	employees
WHERE
	commission_pct IS NOT NULL;
	
	