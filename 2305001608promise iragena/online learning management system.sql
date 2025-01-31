 Create database online_learning_managment_system;
 Use online_learning_managment_system;
 show databases;
CREATE TABLE Students (
    StudentID int AUTO_INCREMENT PRIMARY KEY,
    FullName varchar(100),
    Email varchar(100) ,
    Password varchar(100) 
);
-- Create Courses Table
CREATE TABLE Courses (
    CourseID int AUTO_INCREMENT PRIMARY KEY,
    CourseName varchar(100) ,
    InstructorID int,
    Description varchar(100),
    FOREIGN KEY (InstructorID) REFERENCES Students(StudentID)
);
alter table courses drop column Description;

-- Create Enrollments Table
CREATE TABLE Enrollments (
    EnrollmentID int  AUTO_INCREMENT PRIMARY KEY,
    StudentID int,
    CourseID int,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Assignments Table
CREATE TABLE Assignments (
    AssignmentID  int AUTO_INCREMENT PRIMARY KEY,
    CourseID int,
    Title varchar(100),
    DueDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- Create Results Table
CREATE TABLE Results (
    ResultID  int AUTO_INCREMENT PRIMARY KEY,
    StudentID int,
    CourseID int,
    Score INTEGER CHECK (Score BETWEEN 0 AND 100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
 -- insert into values
INSERT INTO Students VALUES (1, 'john_doe', 'Student','123'),
(2, 'jane_smith', 'Instructor','1234'),
 (3, 'alex_wong', 'Admin','12345'),
 (4, 'lisa_ray', 'Student','123456');
select * from Students;

select count(FullName) from Students;
select avg(StudentID) FROM Students;
select sum(StudentID) from students;

INSERT INTO Courses VALUES (101, 'Introduction to SQL', 2),
 (102, 'Web Development Basics', 2),
(103, 'Data Science 101', 2),
 (104, 'Python Programming', 2);
select * from Courses;
select count(CourseName)from Courses;
select avg(CourseID) FROM Courses;
select sum(CourseID) from Courses;
INSERT INTO Enrollments VALUES (201, 1, 101,'2024-01-10'),
(202, 4, 101, DATE '2024-01-11'),
 (203, 1, 104, DATE '2024-01-12'),
(204, 4, 103, DATE '2024-01-12');
select * from Enrollments;

select count(StudentID)from Enrollments;
select avg(CourseID) FROM Enrollments ;
select sum(CourseID) from Enrollments;
INSERT INTO Assignments VALUES (301, 101, 'SQL Basics Quiz','2024-02-01'),
(302, 101, 'ERD Design Task','2024-02-05'),
(303, 104, 'Python Functions Exercise','2024-02-03'),
(304, 103, 'Data Analysis Report','2024-02-10');
select * from Assignments;
select count(AssignmentsID)from Assignments;
select avg(CourseID) FROM Assignments;
select sum(CourseID) from Assignments;

INSERT INTO Results VALUES('1','102','87'),
('205','1','102','67'),
('204','2','103','90'),
('205','3','103','76');
select*from Results;

-- view creation
create view liststudent as select studentID,FullName from students;
select * from liststudent;

create view listcourse as select courseID,CourseName from courses;
select * from listcourse;

create view listEnrollment as select StudentID,EnrollmentID from Enrollments;
select*from Enrollments;

create view listwhodidAssignment as select Title, AssignmentID;
select *from Assignments;

create view liststudent as select email,FullName from students;
select * from liststudent;
+-/
create view listresult as select courseID, studentID from Results;
select * from listResults;

delimiter $$
create procedure insercourse(in coid int,in coname varchar(50),in inst int)
begin
insert into courses values(coid,coname,inst);
end $$
delimiter ;
call insercourse(105,'biology',4);

delimiter $$
create procedure inserstu(in stid int,in fname varchar(50),in ep varchar(100),in pass int)
begin
insert into students values(stid,fname,ep,pass);
end $$
delimiter ;
call inserstu(5,'joe','joe@example.com',1234567);

delimiter $$
create procedure inserEnr(in Enrid int,instid int,in Enrdate int)
begin
insert into Enrollments values(Enrid ,instid,coid,Enrdate);
end $$
delimiter ;
call inserEnrollments(205,'3',105,2024-01-13);-- create the database
create database st_mgt_stm;
-- create user and his/her password
create user 'promisse'@'127.0.0.1'
IDENTIFIED BY'promuisse';
/*grant the permission to the user on the created database*/
GRANT ALL PRIVILEGES ON  promisse*.*TO'@'127.0.0.1';
/*allow the permission*/
FLUSH PRIVILEGES;