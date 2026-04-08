--reate Database
CREATE DATABASE Project_1;

--Use Database
USE Project_1;

--create Table - Students
CREATE TABLE Students (
	StudentID VARCHAR(30) PRIMARY KEY,
	FirstName NVARCHAR(30) NOT NULL,
	LastNAME NVARCHAR(30) NOT NULL,
	Gender VARCHAR(10) NOT NULL,
	Date_Of_Birth DATE NOT NULL
	);

--Create Table - Courses
CREATE TABLE Courses (
	CourseID VARCHAR(30) PRIMARY KEY,
	CourseName VARCHAR(100) NOT NULL);

--Create Table - Instructors
CREATE TABLE Instructors (
	InstructorID VARCHAR(30) PRIMARY KEY,
	Title VARCHAR(10) NOT NULL,
	FirstNAME NVARCHAR(30) NOT NULL,
	LastNAME NVARCHAR(30) NOT NULL,
	Gender VARCHAR(10) NOT NULL);

--Create Table - Departments
CREATE TABLE Departments (
	DepartmentID VARCHAR(30) PRIMARY KEY,
	DepartmentName VARCHAR(50) NOT NULL);

--Create Table - Enrollments
CREATE TABLE Enrollments (
	EnrollmentID VARCHAR(30) PRIMARY KEY,
	StudentID VARCHAR(30),
	CourseID VARCHAR(30),
	InstructorID VARCHAR(30),
	DepartmentID VARCHAR(30),
	EnrollmentDate DATE NOT NULL,
	FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
	FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
	FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID),
	FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID));

SELECT *
FROM Enrollments

--INSERTING DATA INTO STUDENTS TABLE
INSERT INTO Students (StudentID, FirstName, LastNAME, Gender, Date_Of_Birth)
VALUES
('ST001', 'John', 'Adeyemi', 'Male', '2002-03-15'),
('ST002', 'Mary', 'Okafor', 'Female', '2001-07-22'),
('ST003', 'David', 'Bello', 'Male', '2000-11-10'),
('ST004', 'Grace', 'Ibrahim', 'Female', '2002-01-18'),
('ST005', 'Samuel', 'Ojo', 'Male', '2001-09-05'),
('ST006', 'Esther', 'Adebayo', 'Female', '2003-04-12'),
('ST007', 'Daniel', 'Usman', 'Male', '2000-06-30'),
('ST008', 'Ruth', 'Eze', 'Female', '2002-08-14'),
('ST009', 'Michael', 'Balogun', 'Male', '2001-12-01'),
('ST010', 'Chioma', 'Nwosu', 'Female', '2003-02-25');


-- INSERTING DATA INTO COURSES TABLE
INSERT INTO Courses (CourseID, CourseName)
VALUES
('C001', 'Mathematics'),
('C002', 'English Language'),
('C003', 'Physics'),
('C004', 'Computer Science'),
('C005', 'Economics'),
('C006', 'Biology');


-- INSERTING DATA INTO INSTRUCTORS TABLE
INSERT INTO Instructors (InstructorID, Title, FirstNAME, LastNAME, Gender)
VALUES
('I001', 'Mr', 'James', 'Ogunleye', 'Male'),
('I002', 'Mrs', 'Patricia', 'Ekanem', 'Female'),
('I003', 'Dr', 'Ahmed', 'Musa', 'Male'),
('I004', 'Ms', 'Linda', 'Okoro', 'Female'),
('I005', 'Dr', 'Peter', 'Adesina', 'Male');


-- INSERTING DATA INTO DEPARTMENTS TABLE
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES
('D001', 'Science'),
('D002', 'Arts'),
('D003', 'Engineering'),
('D004', 'Social Sciences');


-- INSERTING DATA INTO ENROLLMENTS TABLE
INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, InstructorID, DepartmentID, EnrollmentDate)
VALUES
('E001', 'ST001', 'C001', 'I001', 'D001', '2024-01-15'),
('E002', 'ST001', 'C004', 'I004', 'D003', '2024-01-16'),
('E003', 'ST002', 'C002', 'I002', 'D002', '2024-01-15'),
('E004', 'ST002', 'C005', 'I005', 'D004', '2024-01-17'),
('E005', 'ST003', 'C003', 'I003', 'D001', '2024-01-18'),
('E006', 'ST003', 'C001', 'I001', 'D001', '2024-01-19'),
('E007', 'ST004', 'C006', 'I003', 'D001', '2024-01-20'),
('E008', 'ST004', 'C002', 'I002', 'D002', '2024-01-21'),
('E009', 'ST005', 'C004', 'I004', 'D003', '2024-01-22'),
('E010', 'ST005', 'C005', 'I005', 'D004', '2024-01-22'),
('E011', 'ST006', 'C001', 'I001', 'D001', '2024-01-23'),
('E012', 'ST006', 'C003', 'I003', 'D001', '2024-01-24'),
('E013', 'ST007', 'C004', 'I004', 'D003', '2024-01-25'),
('E014', 'ST007', 'C001', 'I001', 'D001', '2024-01-25'),
('E015', 'ST007', 'C005', 'I005', 'D004', '2024-01-26'),
('E016', 'ST008', 'C002', 'I002', 'D002', '2024-01-27'),
('E017', 'ST008', 'C006', 'I003', 'D001', '2024-01-28'),
('E018', 'ST009', 'C003', 'I003', 'D001', '2024-01-29'),
('E019', 'ST009', 'C004', 'I004', 'D003', '2024-01-30'),
('E020', 'ST010', 'C005', 'I005', 'D004', '2024-01-31'),
('E021', 'ST010', 'C002', 'I002', 'D002', '2024-02-01'),
('E022', 'ST010', 'C001', 'I001', 'D001', '2024-02-02');

--Alter Courses Table - Add Credits
ALTER TABLE COURSES
ADD Credits INT

--Update the data for Credits into the Course Table 
UPDATE Courses SET Credits = 3 WHERE CourseID = 'C001';
UPDATE Courses SET Credits = 2 WHERE CourseID = 'C002';
UPDATE Courses SET Credits = 4 WHERE CourseID = 'C003';
UPDATE Courses SET Credits = 3 WHERE CourseID = 'C004';
UPDATE Courses SET Credits = 2 WHERE CourseID = 'C005';
UPDATE Courses SET Credits = 3 WHERE CourseID = 'C006';
