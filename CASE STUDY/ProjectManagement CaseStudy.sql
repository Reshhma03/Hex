-- First create the database and use it
CREATE DATABASE ProjectManage;
USE ProjectManage;

-- Create Project Table
CREATE TABLE Project
(Id INT Primary Key,
ProjectName VARCHAR(50) NOT NULL,
Description TEXT,
Start_date DATE,
Status VARCHAR(50) NOT NULL,
CHECK (Status IN('started','dev','build','test','deployed')));

-- Create Employee Table
CREATE TABLE Employee
(id INT Primary Key,
name VARCHAR(50) NOT NULL,
Designation VARCHAR(50),
Gender VARCHAR(50),
Salary DECIMAL(10,2),
Project_id INT,
FOREIGN KEY(Project_id) REFERENCES Project(Id) ON DELETE SET NULL);

-- Create Task Table
CREATE TABLE Task
(task_id INT Primary Key,
task_name VARCHAR(50) NOT NULL,
project_id INT,
employee_id INT,
Status VARCHAR(50) NOT NULL,
CHECK (Status IN('Assigned','Started','Completed')),
FOREIGN KEY(project_id) REFERENCES Project(Id) ON DELETE CASCADE,
FOREIGN KEY(employee_id) REFERENCES Employee(id) ON DELETE SET NULL);

-- Insert Project Table Values
INSERT INTO Project VALUES
(1,'E-Commerce Website','Build an online shopping platform','2025-02-20','started'),
(2,'Conversational Chatbot','Build an AI based troubleshooting bot','2025-02-10','build'),
(3,'Task Manager','Basic task management tool','2025-01-10','dev'),
(4,'Weather App','Display live weather updates','2025-01-01','test'),
(5,'Event Planner','Plan and manage events','2025-02-01','deployed'),
(6,'Library Management','Manage users and library books','2024-11-11','test'),
(7,'Attendnece Tracker','Manage students attendence','2024-12-05','deployed'),
(8,'Hospital Management System','Plan and manage patients','2024-12-20','started');

-- Insert Employee Table values
INSERT INTO Employee VALUES
(2,'Rahul','Software Developer','Male',55000.00,1),
(4,'Meera','QA Tester','Female',48000.00,2),
(6,'Karan','Project Manager','Male',60000.00,3),
(8,'Pooja','Support Engineer','Female',42000.00,4),
(10,'Sneha','System Administrator','Female',55000.00,5),
(12,'Rohan','UI/UX Designer','Male',45000.00,6),
(14,'Arjun','Data Analyst','Male',60000.00,7),
(16,'Pradeep','Database Administrator','Male',65000.00,8);

-- Insert Task Table values
INSERT INTO Task VALUES
(5,'Set up product listings',1,2,'Assigned'),
(10,'Develop chatbot UI',2,4,'Started'),
(15,'Implement task filters',3,6,'Completed'),
(20,'Fetch live weather data',4,8,'Assigned'),
(25,'Enable event reminders',5,10,'Started'),
(30,'Add book search feature',6,12,'Assigned'),
(35,'Generate attendence reports',7,14,'Completed'),
(40,'Optimize database for patient records',8,16,'Started');

-- Now you can query the Task table
SELECT * FROM Task;
