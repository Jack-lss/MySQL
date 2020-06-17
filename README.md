
# MYSQL

<style>table {margin: auto;}</style>

## 用户

> root:  
> Jack_ss:  

----

## 1.修改密码  

    ALTER USER 'jeffrey'@'localhost' IDENTIFIED BY 'password'  
    PASSWORD EXPIRE NEVER; //记得修改自己的账户，永不过期
    flush privileges; //修改成功后刷新权限
    quit; //最后退出

----

## 2.创建账户

- 允许本地 IP访问localhost的Mysql数据库  

        create user 'Jack_ss'@'localhost' identified by '502373';
        flush privileges;  

    账户名：Jack_ss  
    密码：502373  

- 允许外网IP访问数据库editest，本命令包含上面的命令，是所有的IP都可以访问该数据库  

        mysql> create user 'Jack_ss'@'%' identified by '502373';
        flush privileges;

----

## 3.启动

    cd c:/mysql/bin
    mysqld --console

----

## 4.关闭

    cd c:/mysql/bin
    mysqladmin -uroot shutdown

----

## 11.创建数据库

    create database kkkk

----

## 5.使用数据库

    use sqlname;

----

## 16.创建数据表  

    CREATE TABLE event (
            name VARCHAR(20), 
            date DATE,
            type VARCHAR(15), 
            remark VARCHAR(255));

----

## 17.cmd给加载权限

    mysql --local-infile=1 -u 用户名 -p 密码

----

## 18.从外部文件加载入数据表

    LOAD DATA LOCAL INFILE 'E:/mysql/event.txt' INTO TABLE event lines terminated by '\r\n';

> **注意：.txt格式 ：每行之间间隔用tab，换行默认；空位用\N代替**

----

## 14.更新数据表

    UPDATE pet SET birth = '1989-08-31' WHERE name = 'Bowser';

----

## 19.删除数据表

    drop table event
----

## 15.查看警告

    SHOW WARNINGS;

----

## 16.正则表达式

----

### **字符类**

----

|类|说明
|:-:|:-:
|[:alnum:]| 任意字母和数字（同[a-zA-Z0-9]）
|[:alpha:]| 任意字符（同[a-zA-Z]）
|[:blank:]| 空格和制表（同[\\t]）
|[:cntrl:]| ASCII控制字符（ASCII 0到31和127）
|[:digit:]| 任意数字（同[0-9]）
|[:graph:]| 与[:print:]相同，但不包括空格
|[:lower:]| 任意小写字母（同[a-z]）
|[:print:]| 任意可打印字符
|[:punct:]| 既不在[:alnum:]又不在[:cntrl:]中的任意字符
|[:space:]| 包括空格在内的任意空白字符（同[\\f\\n\\r\\t\\v]）
|[:upper:]| 任意大写字母（同[A-Z]）
|[:xdigit:]| 任意十六进制数字（同[a-fA-F0-9]）

----

### **重复元数组**

----

|元字符|说明|
|:-:|:-:|
|* | 0个或多个匹配
|+ | 1个或多个匹配（等于{1,}）
|? | 0个或1个匹配（等于{0,1}）
|{n} | 指定数目的匹配
|{n,} | 不少于指定数目的匹配
|{n,m} | 匹配数目的范围（m不超过255）

----

### **定位元字符**

----

|元字符|说明|
|:-:|:-:|
|^| 文本的开始
|$| 文本的结尾
|[[:<:]]| 词的开始
|[[:>:]]| 词的结尾

----

### **MYSQL算数操作符**

----

|操作符|说明|
|:-:|:-:|
|+| 加
|-| 减
|*| 乘
|/| 除

----

### ****

----

## 一些有效的函数

----

### **常用的文本处理函数**

----

|函 数| 说 明|
|-|-|
Left()| 返回串左边的字符
Length()| 返回串的长度
Locate()| 找出串的一个子串
Lower()| 将串转换为小写
LTrim()| 去掉串左边的空格
Right()| 返回串右边的字符
RTrim()| 去掉串右边的空格
Soundex()| 返回串的SOUNDEX值（转换匹配语音）
SubString()| 返回子串的字符
Upper()| 将串转换为大写

----

### **常用日期和时间处理函数**

----

函 数|说 明
-|-
AddDate()| 增加一个日期（天、周等）
AddTime()| 增加一个时间（时、分等）
CurDate()| 返回当前日期
CurTime()| 返回当前时间
Date()| 返回日期时间的日期部分
DateDiff()| 计算两个日期之差
Date_Add()| 高度灵活的日期运算函数
Date_Format()| 返回一个格式化的日期或时间串
Day()| 返回一个日期的天数部分
DayOfWeek()| 对于一个日期，返回对应的星期几
Hour()| 返回一个时间的小时部分
Minute()| 返回一个时间的分钟部分
Month()| 返回一个日期的月份部分
Now()| 返回当前日期和时间
Second()| 返回一个时间的秒部分
Time()| 返回一个日期时间的时间部分
Year()| 返回一个日期的年份部分

----

### **数值处理函数**

----

函 数|说 明
-|-
Abs()| 返回一个数的绝对值
Cos()| 返回一个角度的余弦
Exp()| 返回一个数的指数值
Mod()| 返回除操作的余数
Pi()| 返回圆周率
Rand()| 返回一个随机数
Sin()| 返回一个角度的正弦
Sqrt()| 返回一个数的平方根
Tan()| 返回一个角度的正切

----
