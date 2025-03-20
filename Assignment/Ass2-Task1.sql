TASK 1

CREATE DATABASE SISDB;
USE SISDB;
CREATE TABLE Students
(student_id INT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
date_of_birth DATE,
email VARCHAR(30),
phone_number VARCHAR(15)
);

CREATE TABLE Courses
(course_id INT PRIMARY KEY,
course_name VARCHAR(30),
credits INT,
teacher_id INT,
FOREIGN KEY(teacher_id) references Teacher(teacher_id)
);

CREATE TABLE Teacher
(teacher_id INT PRIMARY KEY,
first_name VARCHAR(30),
last_name VARCHAR(30),
email VARCHAR(30)
);

CREATE TABLE Enrollments
(enrollment_id INT PRIMARY KEY,
student_id INT,
course_id INT,
enrollement_date DATE,
FOREIGN KEY (student_id) references Students(student_id),
FOREIGN KEY(course_id) references Courses(course_id),
);

CREATE TABLE Payments 
(payment_id INT PRIMARY KEY,
student_id INT,
amount DECIMAL(10,2),
payment_date DATE,
FOREIGN KEY(student_id) references Students(student_id)
)

INSERT INTO Students VALUES
(1,'Reshhma','Ramesh','2002-05-10','nxyz@gmail.com','9895771886'),
(2,'Arjun','Sheddy','2001-08-15','aabca@gmail.com','9876543219'),
(3,'Kavya','Nair','2003-06-25','123@gmail.com','9876543213'),
(4,'Rahul','Patel','2002-04-14','879@gmail.com','9876543218'),
(5,'Priya','Rohan','2000-12-05','987@gmail.com','9876543215'),
(6,'rani','Prasad','2000-12-15','454@gmail.com','8954721684'),
(7,'Anagha','Kumar','2001-09-03','777@gmail.com','4786375915'),
(8,'Rohan','Varma','2001-05-06','463@gmail.com','7864591249'),
(9,'Omna','Reddy','2002-01-02','87897@gmail.com','9871642538'),
(10,'abc','R','2003-02-19','765@gmail.com','8791463259');

INSERT INTO Teacher VALUES
(2,'Jai','K','sJai03@gmail.com'),
(4,'Ramesh','Babu','rameshbabu@gmail.com'),
(6,'Swetha','D','swetha14@gmail.com'),
(8,'Sendanam','Ganesh','sandhanam@gmail.com'),
(10,'Arun','Prasad','arun@gmail.com');

INSERT INTO Courses VALUES
(3,'Maths',4,2),
(6,'Chemistry',5,4),
(9,'Physics',4,6),
(12,'English',3,8),
(15,'Computer Science',4,10);*/

INSERT INTO Enrollments VALUES
(5,1,3,'2025-01-10'),
(10,2,6,'2025-01-11'),
(15,3,9,'2025-01-12'),
(20,4,12,'2025-01-13'),
(25,5,15,'2025-01-14'),
(30,6,3,'2025-01-15'),
(35,7,6,'2025-01-16'),
(40,8,9,'2025-01-17'),
(45,9,12,'2025-01-18'),
(50,10,15,'2025-01-19');

INSERT INTO Payments VALUES
(4,1,5000.00,'2025-02-01'),
(8, 2, 4500.00, '2025-02-02'),
(12, 3, 4800.00, '2025-02-03'),
(16, 4, 5100.00, '2025-02-04'),
(20, 5, 4700.00, '2025-02-05'),
(24, 6, 5000.00, '2025-02-06'),
(28, 7, 4900.00, '2025-02-07'),
(32, 8, 4600.00, '2025-02-08'),
(36, 9, 5200.00, '2025-02-09'),
(40, 10, 5300.00, '2025-02-10');

TASK-2

1. INSERT INTO Students VALUES
(11,'John','Doe','1995-08-15','john.doe@example.com',1234567890);

2. INSERT INTO Enrollments VALUES (55,1,3,'2025-03-21');

3. update Teacher set email='arunprasad@gmail.com' where teacher_id=10;

4. delete from Enrollments where student_id=5 and course_id=15;

5. update Courses set teacher_id=2 where course_id=3;

6. DELETE FROM Enrollments WHERE student_id = 5;
DELETE FROM Payments WHERE student_id = 5;
DELETE FROM Students WHERE student_id = 5;

7. update Payments set amount=6000.00 where payment_id=24;
