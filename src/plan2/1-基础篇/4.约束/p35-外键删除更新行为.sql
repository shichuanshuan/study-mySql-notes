-- 删除/更新行为
行为                    说明
NOT ACTION      当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有则不允许删除/更新 (与 RESTRICT 一致)
RESTRICT        当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有则不允许删除/更新 (与 NOT ACTION 一致)
CASCADE         当在父表中删除/更新对应记录时，首先检查该记录是否有对应外键，如果有，则也删除/更新外键在子表中的记录。
SET NULL        当在父表中删除对应记录时，首先检查该记录是否有对应外键，如果有，则设置子表中该外键值为 null（这就要求该外键允许取null）。
SET DEFAULT     父表有变更时，子表将外键列设置成一个默认的值（innodb不支持）

-- 语法
alter table 表名 add constraint 外键名称 foreign key(外键字段) references 主表名(主表字段名) on update cascade on delete cascade;

示例：
alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id) on update cascade on delete cascade;

alter table emp add constraint fk_emp_dept_id foreign key (dept_id) references dept(id) on update cascade on delete set null;