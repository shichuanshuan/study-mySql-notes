-- curdate()
返回当前日期


示例：
select curdate();



-- curtime()
返回当前时间


-- Now()
返回当前日期和时间


-- YEAR(date)
获取指定 date 的年份


-- MONTH(date)
获取指定 date 的月份


-- DAY(date)
获取指定 date 的日期


-- DATE_ADD(date, INTERVAL expr type)
返回一个日期/时间值加上一个时间间隔 expr 后的时间值

示例：七十天以后的日期
select DATE_ADD(now(), INTERVAL 70 DAY);


-- DATEDIFF(date1, date2)
返回起始时间date1 和 结束时间 date2 之间的天数

示例：
select datediff('2021-10-01', '2021-12-01');


综合案例：
查询所有员工的入职天数，并根据入职天数倒序排序
select name, datediff(curdate(), entrydate) as 'entrydays' from emp order by entrydays desc;