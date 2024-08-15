-- 1. 查询多个字段
select 字段1,字段2,.. from 表名;
select * from 表名;


-- 2. 设置别名
select 字段1 as 别名1,字段2 as 别名2,.. from 表名;

select workaddress as '工作地址' from emp;


-- 3. 去除重复记录
select distinct 字段列表 from 表名;

select distinct workaddress as '工作地址' from emp;

-- 4. 数据准备
create table emp(
    id          int                 comment '编号',
    workno      varchar(10)         comment '工号',
    name        varchar(10)         comment '姓名',
    gender      char(1)             comment '性别',
    age         tinyint unsigned    comment '年龄',
    idcard      char(18)            comment '身份证号',
    workaddress varchar(50)         comment '工作地址',
    entrydate   date                comment '入职时间'
) comment '员工表';

insert into emp (id, workno, name, gender, age, idcard, workaddress, entrydate)
values  (1, '1', '柳岩', '女', 20, '123456789012345678', '北京', '2000-01-01'),
        (2, '2', '张无忌', '男', 18, '123456789012345670', '北京', '2005-09-01'),
        (3, '3', '韦一笑', '男', 38, '123456789712345670', '上海', '2005-08-01'),
        (4, '4', '赵敏', '女', 18, '123456789743345670', '北京', '2009-12-01'),
        (5, '5', '小昭', '女', 16, '123459631012345678', '北京', '2007-07-01'),
        (6, '6', '杨逍', '男', 28, '12345678901234567X', '北京', '2006-01-01'),
        (7, '7', '范瑶', '男', 40, '132456789012345678', '北京', '2005-05-01'),
        (8, '8', '黛绮丝', '女', 38, '145556789012345678', '天津', '2015-05-01'),
        (9, '9', '范凉凉', '女', 45, '123478789012345678', '北京', '2010-04-01'),
        (10, '10', '陈友谅', '男', 53, '123456789122345678', '上海', '2011-01-01'),
        (11, '11', '张士诚', '男', 55, '123456789332345678', '江苏', '2015-05-01'),
        (12, '12', '常遇春', '男', 32, '123456789992345678', '北京', '2004-02-01'),
        (13, '13', '张三丰', '男', 88, '123456789782345678', '江苏', '2020-11-01'),
        (14, '14', '灭绝', '女', 65, '123456789015645678', '西安', '2019-05-01'),
        (15, '15', '胡青牛', '男', 70, '12345678903234567X', '西安', '2018-04-01'),
        (16, '16', '周芷若', '女', 18, null, '北京', '2000-01-01');