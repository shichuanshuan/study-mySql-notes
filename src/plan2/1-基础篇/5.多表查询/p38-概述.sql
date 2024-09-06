-- 概述
指从多张表中查询数据

create table dept(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名'
);
insert into dept(id, name) values
(1, '研发部'),
(2, '市场部'),
(3, '财务部'),
(4, '销售部'),
(5, '总经办'),
(6, '人事部')

create table emp(
    id int auto_increment primary key comment '主键ID',
    name varchar(10) comment '姓名',
    age int comment '年龄',
    job varchar(10) comment '岗位',
    salary int comment '薪资',
    entrydate date comment '入职日期',
    managerid int comment '职位ID',
    dept_id int comment '用户ID',
    constraint fk_deptid foreign key (dept_id) references dept(id)
);
insert into emp(id, name, age, job, salary, entrydate, managerid, dept_id) values
(1, '金庸', 66, '总裁', 20000, '2000-01-01', null, 5),
(2, '张无忌', 20, '项目经理', 12500, '2005-12-01', 1, 1),
(3, '杨逍', 33, '开发', 8400, '2000-11-01', 2, 1),
(4, '韦一笑', 48, '开发', 11000, '2001-02-05', 2, 1),
(5, '常遇春', 43, '开发', 10500, '2004-09-07', 3, 1),
(6, '小昭', 19, '程序员鼓励师', 6600, '2006-03-21', 2, 1),
(7, '灭绝', 60, '财务总监', 8500, '1988-09-28', 1, 3),
(8, '周芷若', 19, '会计', 8000, '2000-08-18', 7, 3),
(9, '丁敏君', 23, '出纳', 5250, '2000-01-22', 7, 3),
(10, '赵敏', 20, '市场部总监', 12500, '2009-12-23', 1, 2),
(11, '鹿杖客', 56, '职员', 3750, '1985-12-6', 10, 2),
(12, '鹤笔翁', 19, '职员', 3750, '2007-03-3', 10, 2),
(13, '方东百', 19, '职员', 5500, '2008-12-13', 10, 2),
(14, '张三丰', 66, '销售总监', 14000, '1997-12-11', 1, 4),
(15, '俞莲舟', 88, '销售', 4600, '1993-02-21', 14, 4),
(16, '宋远桥', 40, '销售', 24600, '2000-03-06', 14, 4),
(17, '陈友谅', 42, null, 2000, '2001-03-03', 1, null);



-- 多表查询
select * from emp, dept; -- 笛卡尔积

select * from emp, dept where emp.dept_id = dept.id;