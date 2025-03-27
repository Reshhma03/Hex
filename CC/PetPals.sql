--Create database Petpals

Use   PetPals

CREATE TABLE Pets (
    PetID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NOT NULL,
    Breed VARCHAR(50),
    Type VARCHAR(50) NOT NULL,
    AvailableForAdoption BIT NOT NULL
);

CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY,
    DonorName VARCHAR(50) NOT NULL,
    DonationType VARCHAR(50) NOT NULL,
    DonationAmount DECIMAL(10, 2),
    DonationItem VARCHAR(50),
    DonationDate DATETIME NOT NULL
);

CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    EventDate DATETIME NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY,
    ParticipantName VARCHAR(255) NOT NULL,
    ParticipantType VARCHAR(50) NOT NULL,
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID)
);

INSERT INTO Pets (PetID, Name, Age, Breed, Type, AvailableForAdoption) 
VALUES(1, 'Sher', 3, 'Labrador', 'Dog', 1),
(2, 'Muthu', 2, 'Persian', 'Cat', 1),
(3, 'Kanna', 5, 'German Shepherd', 'Dog', 0),
(4, 'subramani', 1, 'Siamese', 'Cat', 1),
(5, 'Tommy', 4, 'Beagle', 'Dog', 1),
(6, 'Charlie', 2, 'Bengal', 'Cat', 1),
(7, 'Rocky', 3, 'Pug', 'Dog', 0),
(8, 'Mimi', 6, 'Maine Coon', 'Cat', 1),
(9, 'damu', 4, 'Dachshund', 'Dog', 1),
(10, 'Laddu', 2, 'Sphynx', 'Cat', 1);

select * from Pets;

INSERT INTO Shelters (ShelterID, Name, Location) 
VALUES(1, 'Ramya Animal Care Center', 'Mettur'),
(2, 'Lakshaya Pet Rescue Shelter', 'Avinashi'),
(3, 'Madhu Furry Friends Foundation', 'Kinathukaduvu'),
(4, 'Nithish Compassionate Paws Trust', 'salem'),
(5, 'Ranya Happy Tails Shelter', 'Salem'),
(6, 'Madhavi Pet Haven', 'Tirunelveli'),
(7, 'Ravi Rescue Center', 'Erode'),
(8, 'Lakshmiya Animal Sanctuary', 'Vellore'),
(9,'Nithya Paws and Claws Shelter','Tirupur'),
(10,'Ramani Animal Welfare Society','Kanyakumari');

select * from Shelters;

INSERT INTO Donations (DonationID, DonorName, DonationType, DonationAmount, DonationItem, DonationDate) 
VALUES
(1, 'Arjun', 'Cash', 5000.00, NULL, '2025-03-01 10:00:00'),
(2, 'Janaane Iyer', 'Item', NULL, 'Dog Food Bags', '2025-03-02 11:30:00'),
(3, 'Suresh', 'Cash', 2000.00, NULL, '2025-03-03 14:15:00'),
(4, 'Aditiya', 'Item', NULL, 'Cat Toys', '2025-03-04 09:45:00'),
(5, 'Muthu', 'Cash', 10000.00, NULL, '2025-03-05 16:20:00'),
(6, 'deepak', 'Item', NULL, 'Leashes and Collars', '2025-03-06 12:10:00'), 
(7, 'Kani', 'Cash', 3000.00, NULL, '2025-03-07 08:30:00'), 
(8, 'Kir', 'Item', NULL, 'Blankets for Pets', '2025-03-08 17:55:00'), 
(9, 'Karthik Subramanian', 'Cash', 1500.00, NULL, '2025-03-09 13:05:00'),
(10, 'kali', 'Item', NULL, 'Cat Litter Boxes', '2025-03-10 15:40:00'); 

select * from Donations;

INSERT INTO AdoptionEvents (EventID, EventName, EventDate, Location) VALUES
(1,'Spring Adoption Fair!','2025-04-01 10:00:00','Marina Beach Park'),
(2,'Paw Pet Day','2025-04-15 12:00:00','Anna Nagar'),
(3,'Pet Friends Adoption Drive','2025-04-20 09:30:00','Madurai Mall Grounds'),
(4,'Summer Pet Festival','2025-05-05 11:00:00','Trichy City Hall'),
(5,'Fall in Love with Pets Event!','2025-09-10 14:00:00',' Bangalore'),
(6,'Charity Event for Pets','2025-06-01 09:30:00','Chennai Marina Beach'),
(7,'Adoption Drive at Coimbatore Fair','2025-07-15 10:30:00','Coimbatore Exhibition Center'),
(8,'Pet Awareness Campaign','2025-08-20 11:30:00','Vellore Fort Grounds'),
(9,'Festival of Pets Adoption!','2025-10-05 12:15:00','Salem'),
(10,'New Year Pet Adoption Gala!','2026-01-01 11:15:00','Chennai Convention Center');

select * from AdoptionEvents;

INSERT INTO Participants (ParticipantID, ParticipantName, ParticipantType, EventID) 
VALUES 
(1,'Ramya Animal Care Center','Shelter',1),
(2,'Lakshaya Pet Rescue Shelter','Shelter',2),
(3,'Madhu Furry Friends Foundation','Shelter',3),
(4,'Nithish Compassionate Paws Trust','Shelter',4),
(5,'Ranya Happy Tails Shelter ','Shelter ',5),
(6,'Arjun Kumar ','Adopter ',6),
(7,'Priya Iyer ','Adopter ',7),
(8,'Suresh Reddy ','Adopter ',8),
(9,'Anjali Verma ','Adopter ',9),
(10,'Deepak Nair ','Adopter ',10);

SELECT * FROM Participants;

SELECT Name, Age, Breed, Type 
FROM Pets 
WHERE AvailableForAdoption = 1;

SELECT p.ParticipantName,p.ParticipantType,e.EventName,e.EventDate
FROM Participants p
JOIN AdoptionEvents e ON p.EventID = e.EventID
WHERE p.EventID = e.EventID
ORDER BY p.ParticipantType, p.ParticipantName;

7

SELECT s.Name, SUM(d.DonationAmount) AS TotalDonations
FROM Shelters s
LEFT JOIN Donations d ON s.ShelterID = d.DonationID
GROUP BY s.Name;

SELECT Name, Age, Breed, Type 
FROM Pets 
WHERE AvailableForAdoption = 0;

SELECT FORMAT(DonationDate, 'MMMM yyyy') AS Month_year,SUM(DonationAmount) AS Total_Donations
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');


SELECT DISTINCT Breed 
FROM Pets 
WHERE (Age BETWEEN 1 AND 3) OR Age > 5;

SELECT p.Name AS PetName, s.Name AS ShelterName
FROM Pets p
JOIN Shelters s ON p.PetID = s.ShelterID
WHERE p.AvailableForAdoption = 1;

SELECT COUNT(*) AS ParticipantCount
FROM Participants p
JOIN Shelters s ON p.ParticipantID = s.ShelterID
WHERE s.Location = 'Chennai';

SELECT DISTINCT Breed
FROM Pets
WHERE Age BETWEEN 1 AND 5;

SELECT *
FROM Pets
WHERE AvailableForAdoption = 1;

16


SELECT Name AS AdoptedPet 
FROM Pets 
WHERE AvailableForAdoption = 0

SELECT S.Name, COUNT(P.PetID) AS AvailablePets
FROM Shelters S
LEFT JOIN Pets P ON S.ShelterID = P.PetID AND P.AvailableForAdoption = 1
GROUP BY S.Name;

SELECT p1.Name AS Pet1,p2.Name AS Pet2,p1.Breed,s.Name AS ShelterName
FROM Pets p1
JOIN Pets p2 ON p1.PetID = p2.PetID AND p1.Breed = p2.Breed AND p1.PetID < p2.PetID
JOIN Shelters s ON p1.PetID = s.ShelterID;

SELECT s.Name AS Shelter,e.EventName AS Event
FROM Shelters s cross JOIN AdoptionEvents e;

SELECT TOP 1 s.Name AS ShelterName, COUNT(p.PetID) AS AdoptedPetsCount
FROM Shelters s
JOIN Pets p ON s.ShelterID = p.PetID
WHERE p.AvailableForAdoption = 0
GROUP BY s.Name
ORDER BY AdoptedPetsCount DESC;