# 显示数据库信息
SHOW DATABASES;


USE employees;

#查看表的结构
DESC employees;

#其中值为 null 和其他数拼接，结果也为 null
SELECT 
       IFNULL(commission_pct,0) AS 奖金率,
       commission_pct
FROM
       employees;

SELECT
       CONCAT(`first_name`, ',',`last_name`,',',IFNULL(commission_pct,0)) AS out_put
FROM
       employees;