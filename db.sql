use hms;
create table student(id int primary key auto_increment,name varchar(100),hall varchar(10));
create table employee(id int primary key auto_increment,name varchar(100),pos varchar(100));
create table hall(id int primary key auto_increment,name varchar(10));
insert into student (name,hall) values("student1","h1");
insert into student (name,hall) values("student2","h1");
insert into student (name,hall) values("student3","h2");
insert into employee (name,pos) values("emp1","hall manager");
insert into employee (name,pos) values("emp2","asst warden");
insert into hall (name) values("h1");
insert into hall (name) values("h2");
insert into hall (name) values("h3");