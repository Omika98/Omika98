/*Creating Primary and foriegn key in udemy database*/

Create database Project_Udemy;
Use Project_udemy;
create table  Udemy(
course_id int NOT NULL,
course_name varchar(60),
course_status varchar(40),
number_of_enro int ,
primary key(course_id));

insert into  Udemy values(01 , 'FSDA','active',100),
(02 , 'FSDs','not-active',101),
(03 , 'FSDA','active',102),
(04 , 'FSDA','active',103),
(05 , 'FSDs','active',104);
select * from  Udemy;

create table students_Udemy(
student_id int ,
course_name varchar(60),
student_mail varchar(60),
student_status varchar(40),
course_id1 int,
foreign key(course_id1) references  Udemy(course_id));

insert into students_Udemy values(101,'FSDA', 'FSDA@GMAIL.COM','active', 01),
(101 , 'fsda','test@gmail.com','active',02),
(101 , 'fsda','test@gmail.com','active',03),
(101 , 'fsda','test@gmail.com','active',03);

select * from students_ Udemy;

create table payment(
course_name varchar(60),
course_id int ,
course_live_status varchar(60),
course_launch_date varchar(60),
foreign key(course_id) references  Udemy(course_id));

insert into payment values ('fsda',01,'active','7th aug'),
('fsda',03,'active','7th aug'),
('fsda',05,'active','7th aug'),
('fsda',02,'not-active','8th aug'),
('fsda',04,'not-active','7th aug');


create table student_test(
id int not null ,
 `name` varchar(60),
email_id varchar(60),
mobile_no varchar(9),
address varchar(50),
Marks int,
foreign key (id) references udemy (Course_id));


Insert into student_test values 
(01, 'Omika', 'abc@gmail.com', '123', 'Dehradun', 100),
(02, 'Monika', 'cdf@gmail.com', '124', 'Delhi', 100),
(03, 'Richa', 'xyz@gmail.com', '918', 'Surat', 76),
(04, 'Shaurya', 'gjd@gmail.com', '875', 'Patna', 76),
(05, 'Praveen', 'aup@gmail.com', '978', 'roorkee', 89);

ALTER TABLE Udemy
DROP COLUMN number_of_enro ;

/*left join*/
Select su.student_id, su.student_mail,su.course_name,su.student_status, su.course_id1,st.`name`,st.id
 from students_Udemy su left join  student_test st on su.course_id1 = st.id;
 
 /*find those student id that are active with their email id,course name and mobile Number */
 select su.student_id,su.course_name,st.email_id,st.mobile_no,st.id, su.course_id1,su.student_status
 from students_udemy su left join  student_test st 
 on su.course_id1 = st.id where su.student_status = 'active' ;
 
 /*check if marks are more than 90 then 'very intelligent, 70_80 then intelligent, 70-60 then Good'*/
 
 
 
 
 
 /* Getting faster results through indexing*/
 create table if not exists course2 (
course_id int ,
course_name varchar(50),
course_desc varchar(60),
course_tag varchar(50),
index(course_id,course_name,Course_tag)
);

insert into course2 values(101 , 'fsda' , 'full stack data analytics' , 'Analytics'),
(102 , 'fsds' , 'full stack data analytics' , 'Analytics'),
(103 , 'fsds' , 'full stack data science' , 'DS'),
(104 , 'big data' , 'full stack big data' , 'BD'),
(105 , 'mern' , 'web dev' , 'mern'),
(106 , 'blockchain' , 'full stack blockchain' , 'BC'),
(101 , 'java' , 'full stack java' , 'java'),
(102 , 'testing' , 'full testing ' , 'testing '),
(105 , 'cybersecurity' , 'full stack cybersecurity' , 'cybersecurity'),
(109 , 'c' , 'c language' , 'c'),
(108 , 'c++' , 'C++ language' , 'language');
 
select * from course1 where  course_id = 106;
show index from course2;

 


 
 
