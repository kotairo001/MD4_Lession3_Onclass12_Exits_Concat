create database students_management_new;
use students_management_new;
create table class (
classID int					primary key auto_increment,
className varchar(255)		not null unique,
startDate date,
status bit
);
insert into class (classname, startDate, status) values 
("A1", '2008-12-20',1),
("A2", '2008-12-22',1),
("A3", current_date,0);
select * from class;

create table student (
studentID int				primary key auto_increment,
studentName varchar(255) 	not null,
address varchar(255)		not null,
phone varchar(20),
status bit,
classID int,
foreign key (classID) references class (classID)
);

insert into student (studentName, address, phone, status, classID) value 
("Hung", "Ha Noi", "0912113113", 1, 1),
("Hoa", "Hai Phong", "", 1, 1),
("Manh", "HCM", "0123123123", 0, 2);
select * from student;
select * from student where status=1;

create table subject (
subID int					primary key auto_increment,
subName varchar(20)			not null unique,
credit int					not null check (credit>0),
status bit
);
insert into subject (subName, credit, status) value
("CF",5,1),
("C",6,1),
("HDJ",5,1),
("RDBMS",10,1);
select * from subject where credit<10;

create table mark (
markID int					primary key auto_increment,
subID int,
studentID int,
mark int					not null check (mark>0),
examTimes int				not null check (examTimes>0),
foreign key (subID) references subject (subID),
foreign key (studentID) references student (studentID)
);

insert into mark (subID, studentID, mark, examTimes) value
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);
select * from mark;
select student.studentID, student.StudentName, class.className 
from student join class on student.classID = class.classID where class.className="A1";

select student.studentID, student.studentName, subject.subName, mark.mark from
student join mark on student.studentID = mark.studentID join subject on mark.subID= subject.subID where subject.subName ="CF";

select * from student where studentName like "h%";
select * from class where startDate like "%-12-%";
select * from subject where credit between 3 and 5;
update student set classID = 2 where studentName = "Hung";
select * from student;
select student.studentName, subject.subName, mark from mark 
join student on student.studentID = mark.studentID join subject on mark.subID= subject.subID order by mark desc, studentName asc;
update mark set mark = 12 where studentID = 2;
select * from mark;
