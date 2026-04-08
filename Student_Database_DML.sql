--Students and Enrollment Reports

--How many students are enrolled in each course
SELECT c.CourseName, COUNT(e.StudentID) AS TotalStudentsEnrolled
FROM Courses c
LEFT JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseName
ORDER BY TotalStudentsEnrolled DESC;

--Which students are enrolled in more than two courses
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastNAME,
    COUNT(e.CourseID) AS TotalCourses
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
GROUP BY s.StudentID, s.FirstName, s.LastNAME
HAVING COUNT(e.CourseID) > 2
ORDER BY TotalCourses DESC;

--list all students who are not enrolled in any course
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastNAME,
    s.Gender,
    s.Date_Of_Birth
FROM Students s
LEFT JOIN Enrollments e
    ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;

--which course has the highest number of of enrollments
SELECT TOP 1
    c.CourseName,
    COUNT(e.StudentID) AS TotalEnrollments
FROM Courses c
JOIN Enrollments e
    ON c.CourseID = e.CourseID
GROUP BY c.CourseName
ORDER BY TotalEnrollments DESC;

--what is the total number of credits students are taking
SELECT 
    SUM(c.Credits) AS TotalCreditsTaken
FROM Enrollments e
JOIN Courses c
    ON e.CourseID = c.CourseID;

--what is the gender distribution of students 
SELECT  Gender, COUNT(*) AS TotalStudents
FROM Students
GROUP BY Gender;

--who are the students enrolled in a specific course(=Mathematics)
SELECT 
    s.StudentID,
    s.FirstName,
    s.LastNAME,
    c.CourseName
FROM Students s
JOIN Enrollments e
    ON s.StudentID = e.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID
WHERE c.CourseName = 'Mathematics'
ORDER BY s.LastNAME, s.FirstName;

--which instructor teaches the most enrolled students
SELECT 
    i.InstructorID,
    i.Title,
    i.FirstNAME,
    i.LastNAME,
    COUNT(e.StudentID) AS TotalStudentsTaught
FROM Instructors i
JOIN Enrollments e
    ON i.InstructorID = e.InstructorID
GROUP BY i.InstructorID, i.Title, i.FirstNAME, i.LastNAME
ORDER BY TotalStudentsTaught DESC;

--how many students are enrolled in each department 
SELECT 
    d.DepartmentName,
    COUNT(e.StudentID) AS TotalStudents
FROM Departments d
LEFT JOIN Enrollments e
    ON d.DepartmentID = e.DepartmentID
GROUP BY d.DepartmentName
ORDER BY TotalStudents DESC;


--checking the whole database structure
SELECT 
    e.EnrollmentID,
    s.StudentID,
    s.FirstName,
    s.LastNAME,
    s.Gender,
    c.CourseName,
    i.Title + ' ' + i.FirstNAME + ' ' + i.LastNAME AS InstructorName,
    d.DepartmentName,
    e.EnrollmentDate
FROM Enrollments e
JOIN Students s
    ON e.StudentID = s.StudentID
JOIN Courses c
    ON e.CourseID = c.CourseID
JOIN Instructors i
    ON e.InstructorID = i.InstructorID
JOIN Departments d
    ON e.DepartmentID = d.DepartmentID
ORDER BY e.EnrollmentDate;
