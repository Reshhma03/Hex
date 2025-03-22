--TASK 01--
CREATE TABLE Member (
    member_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    age INT CHECK(age >10)
);

INSERT INTO Member VALUES
(1, 'Lakshaya', 'Kerala', 22),
(2, 'Madhu', 'Tamil Nadu', 28),
(3, 'Reshhma', 'Kerala', 25);

UPDATE Member
SET city = 'Hyderabad'
WHERE member_id = 2;

SELECT * FROM Members;

--TASK 02--
CREATE TABLE children (
    id VARCHAR(50),
    name VARCHAR(50),
    grade VARCHAR(50),
    marks INT
);

INSERT INTO children VALUES
(607, 'Gayathri', 'Grade 6', 97),
(702, 'Cherran', 'Grade 7', 88);

SELECT * FROM children;


UPDATE TOP (1) children
SET id = 12 
WHERE name = 'cherran';

SELECT * FROM children;

--TASK 03--

CREATE TABLE workers (
    id VARCHAR(20),
    name VARCHAR(20) NOT NULL, 
    salary MONEY
);

ALTER TABLE workers
ADD CONSTRAINT chk_salary CHECK (salary > 25000);