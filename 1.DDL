                                                    EXP 1.1: DDL COMMANDS
                                                    *********************



a) DDL COMMANDS-CREATE
1.      Create a table EMPLOYEE have the following fields (emp_id, name,city,dob,adhar_no)

INPUT

MYSQL>CREATE TABLE EMPLOYEE(emp_id int primary key,Name varchar(30),city varchar(30),dob date,aadhar_no int);

OUTPUT

Query OK, 0 rows affected (0.37 sec)

mysql> DESC EMPLOYEE;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_id    | int(11)     | NO   | PRI | NULL    |       |
| Name      | varchar(30) | YES  |     | NULL    |       |
| city      | varchar(30) | YES  |     | NULL    |       |
| dob       | date        | YES  |     | NULL    |       |
| aadhar_no | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

2.Create a table STUDENT have the fields(roll_no, name, age, address, gender)and add following constraints on it.

               Roll_no – Primary key
               Name – does not allow null values
               Age- must be in between (0-99), does not allow null values
               Gender- default value is ‘m’

INPUT 

MYSQL>create table STUDENTS(Roll_No int primary key,Name varchar(30) not null,age int not null check (age<=99),Address varchar(50),Gender varchar(2) default "m ");

OUTPUT

Query OK, 0 rows affected (0.35 sec)

desc STUDENT;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Roll_No | int(11)     | NO   | PRI | NULL    |       |
| Name    | varchar(30) | NO   |     | NULL    |       |
| age     | int(11)     | NO   |     | NULL    |       |
| Address | varchar(50) | YES  |     | NULL    |       |
| Gender  | varchar(2)  | YES  |     | m       |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

3.Create a temporary table STUDENT1 of STUDENT relation.

INPUT

CREATE TEMPORARY TABLE  STUDENT1 AS SELECT * FROM STUDENT;

OUTPUT

Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

DESC STUDENT1;
+---------+-------------+------+-----+---------+-------+
| Field   | Type        | Null | Key | Default | Extra |
+---------+-------------+------+-----+---------+-------+
| Roll_No | int(11)     | NO   |     | NULL    |       |
| Name    | varchar(30) | NO   |     | NULL    |       |
| age     | int(11)     | NO   |     | NULL    |       |
| Address | varchar(50) | YES  |     | NULL    |       |
| Gender  | varchar(2)  | YES  |     | m       |       |
+---------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

 4.Create a duplicate table of EMPLOYEE.

INPUT 

CREATE TABLE  EMPLOYEE1 AS SELECT * FROM EMPLOYEE;

OUTPUT

Query OK, 0 rows affected (0.34 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC EMPLOYEE1;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| emp_id    | int(11)     | NO   |     | NULL    |       |
| Name      | varchar(30) | YES  |     | NULL    |       |
| city      | varchar(30) | YES  |     | NULL    |       |
| dob       | date        | YES  |     | NULL    |       |
| aadhar_no | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

5.Create an INVOICE database and having following tables.

                      Customer(id, name, address, city, ph_no)
                      Product(pid,  pname, price (default 0))
                      Invoice_master(inv_id, cust_id(FK), inv_date)
                      Invoice_item(inv_id (FK),  pid(FK), quantity)
INPUT

1-CREATE TABLE CUSTOMER(ID INT PRIMARY KEY,NAME VARCHAR(15),ADDRESS VARCHAR(50),PH_NO INT,CITY VARCHAR(15);
Query OK, 0 rows affected (0.34 sec)

OUTPUT
 
mysql> DESC PRODUCT;
+--------+-------------+------+-----+---------+-------+
| Field  | Type        | Null | Key | Default | Extra |
+--------+-------------+------+-----+---------+-------+
| P_ID   | int(11)     | NO   | PRI | NULL    |       |
| P_NAME | varchar(20) | YES  |     | NULL    |       |
| PRICE  | int(11)     | YES  |     | 0       |       |
+--------+-------------+------+-----+---------+-------+


INPUT

2-CREATE TABLE PRODUCT(P_ID INT PRIMARY KEY,P_NAME VARCHAR(20),PRICE INT DEFAULT 0);

OUTPUT 

Query OK, 0 rows affected (0.35 sec)

mysql> DESC INVOICE_MASTER;
+--------+---------+------+-----+---------+-------+
| Field  | Type    | Null | Key | Default | Extra |
+--------+---------+------+-----+---------+-------+
| INV_ID | int(11) | NO   | PRI | NULL    |       |
| ID     | int(11) | YES  | MUL | NULL    |       |
+--------+---------+------+-----+---------+-------+

INPUT

3-CREATE TABLE INVOICE_MASTER(INV_ID INT PRIMARY KEY,ID INT,CONSTRAINT FK_ID FOREIGN KEY(ID) REFERENCES CUSTOMER(ID),INV_DATE DATE);

OUTPUT 

Query OK, 0 rows affected (0.39 sec)

mysql> DESC INVOICE_MASTER;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| INV_ID   | int(11) | NO   | PRI | NULL    |       |
| ID       | int(11) | YES  | MUL | NULL    |       |
| INV_DATE | date    | YES  |     | NULL    |       |
+----------+---------+------+-----+---------+-------+



4-CREATE TABLE INVOICE_ITEM(INV_ID INT,P_ID INT,QUANTITY INT,CONSTRAINT FK_PID FOREIGN KEY(INV_ID) REFERENCES INVOICE_MASTER(INV_ID),CONSTRAINT FK_PD FOREIGN KEY(P_ID) REFERENCES PRODUCT(P_ID));

Query OK, 0 rows affected (0.57 sec)

mysql> DESC INVOICE_ITEM;
+----------+---------+------+-----+---------+-------+
| Field    | Type    | Null | Key | Default | Extra |
+----------+---------+------+-----+---------+-------+
| INV_ID   | int(11) | YES  | MUL | NULL    |       |
| P_ID     | int(11) | YES  | MUL | NULL    |       |
| QUANTITY | int(11) | YES  |     | NULL    |       |
+----------+---------+------+-----+---------+-------+
3 rows in set (0.00 sec)


-------------------------------------------------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------------------------------------------------


b) DDL COMMANDS- ALTER & DROP

1. Add a column ‘SSN’ at the first position in the table EMPLOYEE

INPUT

ALTER TABLE EMPLOYEE ADD SSN INT FIRST;

OUTPUT

Query OK, 0 rows affected (0.63 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC EMPLOYEE;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| SSN       | int(11)     | YES  |     | NULL    |       |
| emp_id    | int(11)     | NO   | PRI | NULL    |       |
| Name      | varchar(30) | YES  |     | NULL    |       |
| city      | varchar(30) | YES  |     | NULL    |       |
| dob       | date        | YES  |     | NULL    |       |
| aadhar_no | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

2. Change the data type of the column ‘DOB’  in year the table EMPLOYEE

INPUT

ALTER TABLE EMPLOYEE MODIFY COLUMN dob year;

OUTPUT

Query OK, 0 rows affected (1.06 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC EMPLOYEE;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| SSN       | int(11)     | YES  |     | NULL    |       |
| emp_id    | int(11)     | NO   | PRI | NULL    |       |
| Name      | varchar(30) | YES  |     | NULL    |       |
| city      | varchar(30) | YES  |     | NULL    |       |
| dob       | year(4)     | YES  |     | NULL    |       |
| aadhar_no | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
6 rows in set (0.00 sec)

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

3. Delete the column ‘emp_id’ the table EMPLOYEE.

INPUT
ALTER TABLE EMPLOYEE DROP emp_id;

OUTPUT 

Query OK, 0 rows affected (0.87 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC EMPLOYEE;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| SSN       | int(11)     | YES  |     | NULL    |       |
| Name      | varchar(30) | YES  |     | NULL    |       |
| city      | varchar(30) | YES  |     | NULL    |       |
| dob       | year(4)     | YES  |     | NULL    |       |
| aadhar_no | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)

mysql> 

-------------------------------------------------------------------------------------------------------------------------------------------------------------------

4. Add  the constraint unique for columns ‘SSN, ‘adhar_no’ the table EMPLOYEE

INPUT

ALTER TABLE EMPLOYEE ADD constraint unique(SSN,aadhar_no);

OUTPUT 

Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC EMPLOYEE;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| SSN       | int(11)     | YES  | MUL | NULL    |       |
| Name      | varchar(30) | YES  |     | NULL    |       |
| city      | varchar(30) | YES  |     | NULL    |       |
| dob       | year(4)     | YES  |     | NULL    |       |
| aadhar_no | int(11)     | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
5 rows in set (0.00 sec)




//ADD MYSQL> BEFORE EACH QUERY

































   



