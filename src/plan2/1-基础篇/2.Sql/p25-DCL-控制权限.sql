-- 控制权限
权限                    说明
ALL,ALL PRIVILEGES      所有权限
SELECT                  查询数据
INSERT                  插入数据
UPDATE                  修改数据
DELETE                  删除数据
ALTER                   修改表
DROP                    删除数据库/表/视图
CREATE                  创建数据库/表


-- 1. 查询权限
show grants for '用户名'@'主机名';


-- 2. 授予权限
grant 权限列表 on 数据名.表名 to '用户名'@'主机名';


-- 3. 策略权限
revoke 权限列表 on 数据库名.表名 from '用户名'@'主机名';


注意：
多个权限之间，使用逗号分隔
授权时，数据库名和表名可以使用 * 进行通配，代表所有。


-- 查询权限
show grants for 'heima'@'%';


-- 授予权限
grant all on itcast.* to 'heima'@'%';


-- 撤销权限
revoke all on itcast.* from 'heima'@'%';