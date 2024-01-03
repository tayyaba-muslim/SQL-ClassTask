create database SoftwareHouse;

use SoftwareHouse;

-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Salary DECIMAL(10, 2)
	foreign key (DepartmentID) references Departments(DepartmentID)
);



INSERT INTO Employees (EmployeeID, FirstName, LastName, DepartmentID, Salary)
VALUES
    (1, 'John', 'Doe', 1, 60000.00),
    (2, 'Jane', 'Smith', 2, 55000.00),
    (3, 'Mike', 'Johnson', 1, 65000.00),
    (4, 'Emily', 'Williams', 3, 70000.00),
    (5, 'David', 'Brown', 2, 50000.00),
    (6, 'Sarah', 'Miller', 1, 62000.00),
    (7, 'Chris', 'Wilson', 3, 75000.00),
    (8, 'Anna', 'Jones', 2, 53000.00),
    (9, 'Brian', 'Taylor', 1, 58000.00),
    (10, 'Laura', 'Anderson', 3, 72000.00);


	select * from Employees;

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT not null unique identity,
    DepartmentName VARCHAR(50)

);



INSERT INTO Departments (DepartmentName)
VALUES
    ( 'HR'),
    ( 'IT'),
    ( 'Finance');
	
	select * from  Departments;

	--1. Create a new table named Project.
	CREATE TABLE Projects (
    ProjectID INT not null unique identity,
    ProjectName VARCHAR(50),
	EmployeesID int,
	StartDate int
	foreign key (EmployeesID) references Employees(EmployeeID)

);

INSERT INTO Projects (ProjectName ,EmployeesID , StartDate)
VALUES
    ( 'Database' , 3, 12-12-2023),
    ( 'Web Designing', 2 , 14-12-2023),
    ( 'Destop Application',1, 17-12-2023),
	( 'Database' , 4, 20-12-2023),
    ( 'Web Designing', 5 , 19-12-2023),
    ( 'Destop Application',6, 15-12-2023),
	( 'Database' , 7, 16-12-2023),
    ( 'Web Designing', 8 , 10-12-2023),
    ( 'Destop Application',9, 18-12-2023);

-- 2. Retrieve the details of employees whose salary is above 50000.
	select * from Employees as Emp Join Departments as Dept on Emp.DepartmentID = Dept.DepartmentID join Projects as pro on Emp.EmployeeID = Pro.EmployeesID where Emp.Salary > 50000;

-- 3. Fetch a list of all employees along with the department they belong to.
	select * from Employees as Emp Join Departments as Dept on Emp.DepartmentID = Dept.DepartmentID;

-- 4. Retrieve the employees whose last name starts with 'S'.
	select * from Employees as Emp where emp.LastName like 'S%';

-- 5. Retrieve the projects with names containing the word 'Database'.
	select * from Projects Where ProjectName = 'Database';

-- 6. Calculate the total salary of all employees.
	select sum(salary) from Employees ;

-- 7.Find the department with the highest average salary.
	SELECT DepartmentID , AVG(Salary) AS AverageSalary FROM Employees GROUP BY DepartmentID ORDER BY AverageSalary ASC;

	--	Another schema	--
	-- Students Table

CREATE TABLE Students (
    StudentID INT not null unique identity,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
	CourseID int ,
    Age INT,
    GPA DECIMAL(3, 2)
	foreign key (CourseID) references Courses(CourseID)
	);
	


INSERT INTO Students (FirstName, LastName,CourseID, Age, GPA)
VALUES
    ('Alice', 'Johnson', 2,20, 3.75),
    ('Bob', 'Smith', 2, 22, 3.50),
    ('Charlie', 'Davis',3, 21, 3.80),
    ('Diana', 'Brown', 4,23, 3.90),
    ('Eva', 'Miller', 6,20, 3.65),
    ('Frank', 'Jones', 8,22, 3.70),
    ('Grace', 'Wilson', 9,21, 3.85),
    ('Henry', 'Anderson', 10,23, 3.95),
    ('Ivy', 'Taylor',2, 20, 3.60),
    ('Jack', 'Clark',2, 22, 3.75);

	select * from Students;
-- Courses Table
CREATE TABLE Courses (
    CourseID INT  not null unique identity,
    CourseName VARCHAR(50)
	);

-- Inserting 10 sample records into Courses table
INSERT INTO Courses (CourseName)
VALUES
    ('Introduction to Programming'),
    ('Web Development Basics'),
    ('Database Management'),
    ('Data Structures and Algorithms'),
    ('JavaScript Fundamentals'),
    ('Mobile App Development'),
    ('Software Engineering Principles'),
    ('Networking Essentials'),
    ('Artificial Intelligence Basics'),
    ('Cybersecurity Fundamentals');
	select * from Courses;
	--1.Retrieve a list of all students and the courses they are enrolled in, including those who are not enrolled in any course.
	select * from Students as Stu join Courses as Cour on Stu.CourseID = Cour.CourseID;

	--2.Display the details of students who are enrolled in the course 'Web Development Basics'.
    select * from Students as Stu join Courses as Cour on Stu.CourseID = Cour.CourseID where cour.CourseName = 'Web Development Basics';

	
    --3.Find out which courses have no enrolled students.
    select CourseID, CourseName FROM Courses WHERE CourseID NOT IN (SELECT DISTINCT CourseID FROM Students);

	--4. List the students who are enrolled in any course, along with the course names.
   select stu.StudentID, stu.FirstName, stu.CourseID, cour.CourseName FROM Students as stu JOIN Courses cour ON stu.CourseID = cour.CourseID;

   
   --5. Retrieve a list of all courses along with the number of students enrolled in each course, even if the count is zero.
   select cour.CourseID, cour.CourseName, COUNT(stu.StudentID) AS EnrolledStudents FROM Courses cour LEFT JOIN Students as stu ON cour.CourseID = stu.CourseID GROUP BY cour.CourseID, cour.CourseName;

