--CREATE DATABASE CareerHub;
USE CareerHub;
CREATE TABLE  Companies (
CompanyID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyName NVARCHAR(255) NOT NULL,
    Location NVARCHAR(255) NOT NULL
);


CREATE TABLE Jobs (
    JobID INT IDENTITY(1,1) PRIMARY KEY,
    CompanyID INT,
    JobTitle NVARCHAR(255) NOT NULL,
    JobDescription NVARCHAR(MAX),
    JobLocation NVARCHAR(255) NOT NULL,
    Salary DECIMAL(10, 2),
    JobType NVARCHAR(50),
    PostedDate DATETIME,
    FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);


CREATE TABLE Applicants (
    ApplicantID INT IDENTITY(1,1) PRIMARY KEY,
    FirstName NVARCHAR(255) NOT NULL,
    LastName NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL UNIQUE,
    Phone NVARCHAR(15),
    Resume NVARCHAR(MAX)
);


CREATE TABLE Applications (
    ApplicationID INT IDENTITY(1,1) PRIMARY KEY,
    JobID INT,
    ApplicantID INT,
    ApplicationDate DATETIME,
    CoverLetter NVARCHAR(MAX),
    FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
    FOREIGN KEY (ApplicantID) REFERENCES Applicants(ApplicantID)
);

--q5
SELECT 
    J.JobTitle, 
    COUNT(A.ApplicationID) AS ApplicationCount
FROM 
    Jobs J
LEFT JOIN 
    Applications A ON J.JobID = A.JobID
GROUP BY 
    J.JobID, J.JobTitle;
	SELECT 
    J.JobTitle, 
    C.CompanyName, 
    J.JobLocation, 
    J.Salary
FROM 
    Jobs J
JOIN 
    Companies C ON J.CompanyID = C.CompanyID
WHERE 
    J.Salary BETWEEN 60000 AND 80000; 
	SELECT 
    J.JobTitle, 
    C.CompanyName, 
    A.ApplicationDate
FROM 
    Applications A
JOIN 
    Jobs J ON A.JobID = J.JobID
JOIN 
    Companies C ON J.CompanyID = C.CompanyID
WHERE 
    A.ApplicantID = 1; 
	SELECT 
    AVG(Salary) AS AverageSalary
FROM 
    Jobs
WHERE 
    Salary > 0;
	SELECT TOP 1
    C.CompanyName, 
    COUNT(J.JobID) AS JobCount
FROM 
    Companies C
JOIN 
    Jobs J ON C.CompanyID = J.CompanyID
GROUP BY 
    C.CompanyID, C.CompanyName
ORDER BY 
    JobCount DESC;
	SELECT 
    AP.FirstName, 
    AP.LastName
FROM 
    Applicants AP
JOIN 
    Applications APP ON AP.ApplicantID = APP.ApplicantID
JOIN 
    Jobs J ON APP.JobID = J.JobID
JOIN 
    Companies C ON J.CompanyID = C.CompanyID
WHERE 
    C.Location = 'CityX'
    AND AP.Resume LIKE '%3 years%'; 
	SELECT DISTINCT 
    JobTitle
FROM 
    Jobs
WHERE 
    Salary BETWEEN 60000 AND 80000;
	SELECT 
    J.JobTitle
FROM 
    Jobs J
LEFT JOIN 
    Applications A ON J.JobID = A.JobID
WHERE 
    A.ApplicationID IS NULL;
	SELECT 
    AP.FirstName, 
    AP.LastName, 
    C.CompanyName, 
    J.JobTitle
FROM 
    Applicants AP
JOIN 
    Applications APP ON AP.ApplicantID = APP.ApplicantID
JOIN 
    Jobs J ON APP.JobID = J.JobID
JOIN 
    Companies C ON J.CompanyID = C.CompanyID;
	SELECT 
    C.CompanyName, 
    COUNT(J.JobID) AS JobCount
FROM 
    Companies C
LEFT JOIN 
    Jobs J ON C.CompanyID = J.CompanyID
GROUP BY 
    C.CompanyID, C.CompanyName;
	SELECT 
    AP.FirstName, 
    AP.LastName, 
    C.CompanyName, 
    J.JobTitle
FROM 
    Applicants AP
LEFT JOIN 
    Applications APP ON AP.ApplicantID = APP.ApplicantID
LEFT JOIN 
    Jobs J ON APP.JobID = J.JobID
LEFT JOIN 
    Companies C ON J.CompanyID = C.CompanyID;
	
	ALTER TABLE Applicants
ADD Location NVARCHAR(255);
SELECT 
    FirstName, 
    LastName, 
    CONCAT(Location, ', ', 'State') AS CityState -- Replace 'State' with actual state column if available
FROM 
    Applicants;
	SELECT 
    JobTitle
FROM 
    Jobs
WHERE 
    JobTitle LIKE '%Developer%' OR JobTitle LIKE '%Engineer%';
	SELECT 
    AP.FirstName, 
    AP.LastName, 
    J.JobTitle
	FROM 
    Applicants AP
FULL OUTER JOIN 
    Applications APP ON AP.ApplicantID = APP.ApplicantID
FULL OUTER JOIN 
    Jobs J ON APP.JobID = J.JobID;
	SELECT 
    AP.FirstName, 
    AP.LastName, 
    C.CompanyName
FROM 
    Applicants AP
JOIN 
    Applications APP ON AP.ApplicantID = APP.ApplicantID
JOIN 
    Jobs J ON APP.JobID = J.JobID
JOIN 
    Companies C ON J.CompanyID = C.CompanyID
WHERE 
    AP.Location = 'Chennai' 
    AND AP.Resume LIKE '%2 years%';
