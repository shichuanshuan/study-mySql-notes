-- DCL 数据控制语言，用来管理数据库用户、控制数据库的访问权限。

-- 1. 查询用户
use mysql;
select * from user;


-- 2. 创建用户
create user '用户名'@'主机名' identified by '密码';


-- 3. 修改用户密码
alter user '用户名'@'主机名' identified with mysql_native_password by '新密码';


-- 4. 删除用户
drop user '用户名'@'主机名';



-- 创建用户 itcast, 只能够在当前主机 localhost 访问，密码 123456
create user 'itcast'@'localhost' identified by '123456';


-- 创建用户 heima，可以在任意主机访问该数据库，密码 123456；
create user 'heima'@'%' identified by '123456';


-- 修改用户 heima 的访问密码 1234；
alter user 'heima'@'%' identified with mysql_native_password by '1234';


-- 删除 itcast@localhost 用户
drop user 'itcast'@'localhost';
