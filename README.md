
# MYSQL

## 二级

### 三级

#### 用户

> root:  
> Jack_ss:  

----

#### 1.修改密码  

    ALTER USER 'jeffrey'@'localhost' IDENTIFIED BY 'password'  
    PASSWORD EXPIRE NEVER; //记得修改自己的账户，永不过期
    flush privileges; //修改成功后刷新权限
    quit; //最后退出

----

#### 2.创建账户

- 允许本地 IP访问localhost的Mysql数据库  

        create user 'Jack_ss'@'localhost' identified by '502373';
        flush privileges;  

    账户名：Jack_ss  
    密码：502373  

- 允许外网IP访问数据库editest，本命令包含上面的命令，是所有的IP都可以访问该数据库  

        mysql> create user 'Jack_ss'@'%' identified by '502373';
        flush privileges;

----

#### 3.启动

    cd c:/mysql/bin
    mysqld --console

----

#### 4.关闭

    cd c:/mysql/bin
    mysqladmin -uroot shutdown

----

#### 11.创建数据库

    create database kkkk

----

#### 5.使用数据库

    use sqlname;

----

#### 6.列出 MySQL 数据库管理系统的数据库列表

    show databases;

----

#### 7.显示指定数据库的所有表，使用该命令前需要使用 use 命令来选择要操作的数据库

    show tables;

----

#### 8.显示数据表的属性，属性类型，主键信息 ，是否为 NULL，默认值等其他信息

    show columns from tablename;
    or
    describe tablename;

----

#### 9.显示数据表的详细索引信息，包括PRIMARY KEY（主键）

    show index from tablename;

----

#### 10.该命令将输出Mysql数据库管理系统的性能及统计信息

    show table status [from sql_name] [link 'pattern'] \G;
    
    mysql> show table status from mysql;   # 显示数据库 RUNOOB 中所有表的信息

----

#### 12.插入数据到数据表

    INSERT INTO pet
    VALUES ('Puffball','Diane','hamster','f','1999-03-30',NULL);

----

#### 13.查找数据表

    select * from pet

"**条件查找**"

- 按名字  

        SELECT * FROM pet WHERE name = 'Puffball';

- 按生日

        SELECT * FROM pet WHERE birth >= '1998-1-1';

- 混合查找

        SELECT * FROM pet WHERE species = 'dog' AND sex = 'f';
        SELECT * FROM pet WHERE (species = 'cat' AND sex = 'm') OR (species = 'dog' AND sex = 'f');

"**部分查找**"

- 包含重复

        SELECT owner FROM pet;

- 删除重复

        SELECT DISTINCT owner FROM pet;
        SELECT name, species, birth FROM pet WHERE species = 'dog' OR species = 'cat';

- 上升排序

        SELECT name, birth FROM pet ORDER BY birth;

- 下降排序

        SELECT name, birth FROM pet ORDER BY birth DESC;

- 一列升序，一列降序

        SELECT name, species, birth FROM pet ORDER BY species, birth DESC;

- 添加年龄

        SELECT name, birth, CURDATE(), TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age FROM pet;

     _时间差函数_

        TIMESTAMPDIFF([day, hour, minute, second, year] [old time] [now time])

- 添加年龄按name排序

        SELECT name, birth, CURDATE(), TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age FROM pet ORDER BY name;

- 添加年龄按age排序

        SELECT name, birth, CURDATE(), TIMESTAMPDIFF(YEAR,birth,CURDATE()) AS age FROM pet ORDER BY age;

- 添加年龄while循环

        SELECT name, birth, death, TIMESTAMPDIFF(YEAR,birth,death) AS age FROM pet WHERE death IS NOT NULL ORDER BY age;

- 添加生日月份

        SELECT name, birth, MONTH(birth) FROM pet;

- 指定生日月份

        SELECT name, birth FROM pet WHERE MONTH(birth) = 5;

- 首部包含部分字

        SELECT * FROM pet WHERE name LIKE 'b%';

- 尾部包含部分字

        SELECT * FROM pet WHERE name LIKE '%ry';

- 全部包含部分字

        SELECT * FROM pet WHERE name LIKE '%e%';

- 指定全字长

        SELECT * FROM pet WHERE name LIKE '_____';
    _还可以使用REGEXP_LIKE函数代替LINK：_

        SELECT * FROM pet WHERE REGEXP_LIKE(name, '^b');
        SELECT * FROM pet WHERE REGEXP_LIKE(name, 'fy$');
        SELECT * FROM pet WHERE REGEXP_LIKE(name, 'w');
        SELECT * FROM pet WHERE REGEXP_LIKE(name, '^.....$');
        SELECT * FROM pet WHERE REGEXP_LIKE(name, '^.{5}$');

- 统计

        SELECT COUNT(*) FROM pet;

- 按部分标字统计

        SELECT owner, COUNT(*) FROM pet GROUP BY owner;
        SELECT species, COUNT(*) FROM pet GROUP BY species;

- 多标字统计

        SELECT species, sex, COUNT(*) FROM pet GROUP BY species, sex;

- 混合

        SELECT species, sex, COUNT(*) FROM pet WHERE species = 'dog' OR species = 'cat' GROUP BY species, sex;
        SELECT species, sex, COUNT(*) FROM pet WHERE sex IS NOT NULL GROUP BY species, sex;

    使用count时，需要有group by，不然会报错或者错误的统计

- 多表查询

        SELECT pet.name,
        TIMESTAMPDIFF(YEAR,birth,date) AS age,
        remark
        FROM pet INNER JOIN event
        ON pet.name = event.name
        WHERE event.type = 'litter';
    这里的inner join是等值连接，后面需要限定on

----

#### 16.创建数据表  

    CREATE TABLE event (
            name VARCHAR(20), 
            date DATE,
            type VARCHAR(15), 
            remark VARCHAR(255));

----

#### 17.cmd给加载权限

    mysql --local-infile=1 -u 用户名 -p 密码

----

#### 18.从外部文件加载入数据表

    LOAD DATA LOCAL INFILE 'E:/mysql/event.txt' INTO TABLE event lines terminated by '\r\n';

> **注意：.txt格式 ：每行之间间隔用tab，换行默认；空位用\N代替**

----

#### 14.更新数据表

    UPDATE pet SET birth = '1989-08-31' WHERE name = 'Bowser';

----

#### 19.删除数据表

    drop table event
----

#### 15.查看警告

    SHOW WARNINGS;
