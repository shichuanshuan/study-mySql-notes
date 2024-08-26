-- 根据需求，完成表结构的创建
字段名      字段含义        字段类型        约束条件                    约束关键字
id          ID唯一标识      int            主键，并且自动增长           PRIMARY KEY, AUTO_INCREMENT
name        姓名            varchar(20)    不为空，并且唯一            NOT NULL, UNIQUE
age         年龄            int            大于0，并且小于等于120       CHECK
status      状态            char(1)        如果没有指定该值，默认为1    DEFAULT
gender      性别            char(1)        无

-- 此版本 SQL 不支持 age int check (age > 0 && age <=120) comment '年龄',
create table user(
    id int primary key auto_increment comment '主键',
    name varchar(10) not null unique comment '姓名',
    age int comment '年龄',
    status char(1) default '1' comment '状态',
    gender  char(1) comment '性别'
)comment '用户表';


-- 验证主键，并且自动增长
insert into user(name, age, status, gender) values('tom1', 19, '1', '男'), ('tom2', 25, '0', '男');
insert into user(name, age, status, gender) values('tom3', 19, '1', '男');

-- 验证不为空，并且唯一
insert into user(name, age, status, gender) values(null, 19, '1', '男');

-- 验证大于0，并且小于等于 120