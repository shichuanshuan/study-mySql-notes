-- 1. 外键约束
概念：外键用来让两张表的数据之间建立连接，从而保证数据的一致性和完整性。

-- 2. 准备数据
部门表
create table dept(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '部门名称'
) comment '部门表';

insert into dept(id, name) values(1, '研发部'), (2, '市场部'), (3, '财务部'), (4, '销售部'), (5, '总经办');



员工表
create table emp(
    id int auto_increment comment 'ID' primary key,
    name varchar(50) not null comment '姓名',
    age int comment '年龄',
    job varchar(20) comment '职位',
    salary int comment '薪资',
    entrydate date comment '入职时间',
    managerid int comment '直属领导ID',
    dept_id int comment '部门ID'
) comment '员工表';

insert into emp(id, name, age, job, salary, entrydate, managerid, dept_id) values 
(1, '金庸', 66, '总裁', 20000, '2000-01-01', null, 5), (2, '张无忌', 20, '项目经理', 12000, '2005-12-05', 1, 1),
(3, '杨逍', 33, '开发', 8400, '2000-11-03', 2, 1), (4, '韦一笑', 48, '开发', 11000, '2002-02-05', 2, 1),
(5, '常遇春', 43, '开发', 10500, '2004-09-07', 3, 1), (6, '小昭', 19, '程序员鼓励师', 6000, '2004-10-12', 2, 1);


-- 3. 语法
添加外键
create table 表名(
    字段名 数据类型,
    ...
    [consiraint] [外键名称] foreign key(外键字段名) references 主表(主表列名)
);

alter table 表名 add constraint 外键名称 foreign key(外键字段名) references 主表(主表列名);

示例：
添加外键
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id);


-- 4. 删除外键
alter table 表名 drop foreign key 外键名称;

alter table emp drop foreign key fk_emp_dept_id;
