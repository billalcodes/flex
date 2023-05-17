-- Create the flex database
CREATE DATABASE flex;
USE flex;

-- Create the USERS table
CREATE TABLE USERS (
  UserId INT PRIMARY KEY,
  UserName VARCHAR(255),
  Password VARCHAR(255),
  UserType VARCHAR(50)
);

-- Create the COURSES table
CREATE TABLE COURSES (
  CourseId INT PRIMARY KEY,
  CourseCode VARCHAR(50),
  CourseTitle VARCHAR(255),
  CreditHours INT,
  NumberOfStudents INT
);

-- Create the PREREQUISITES table
CREATE TABLE PREREQUISITES (
  CourseId INT,
  PrerequisiteCourseId INT,
  PRIMARY KEY (CourseId, PrerequisiteCourseId),
  FOREIGN KEY (CourseId) REFERENCES COURSES(CourseId),
  FOREIGN KEY (PrerequisiteCourseId) REFERENCES COURSES(CourseId)
);

-- Create the STUDENTS table
CREATE TABLE STUDENTS (
  StudentId INT PRIMARY KEY,
  UserId INT,
  FullName VARCHAR(255),
  CGPA DECIMAL(3, 2),
  FOREIGN KEY (UserId) REFERENCES USERS(UserId)
);


-- Create the FACULTY table
CREATE TABLE FACULTY (
  FacultyId INT PRIMARY KEY,
  UserId INT,
  FullName VARCHAR(255),
  Courses_Alloted INT,
  FOREIGN KEY (UserId) REFERENCES USERS(UserId)
);

-- Create the ACADEMIC_OFFICE table
CREATE TABLE ACADEMIC_OFFICE (
  OfficeId INT PRIMARY KEY,
  UserId INT,
  FullName VARCHAR(255),
  FOREIGN KEY (UserId) REFERENCES USERS(UserId)
);

-- Create the SECTIONS table
CREATE TABLE SECTIONS (
  SectionId INT PRIMARY KEY,
  CourseId INT,
  FacultyId INT,
  StudentCount INT,
  Sec_name varchar(50),
  FOREIGN KEY (CourseId) REFERENCES COURSES(CourseId),
  FOREIGN KEY (FacultyId) REFERENCES FACULTY(FacultyId)
);

-- Create the ENROLLMENTS table
CREATE TABLE ENROLLMENTS (
  EnrollmentId INT PRIMARY KEY,
  StudentId INT,
  CourseId INT,
  Semester VARCHAR(50),
  Sections varchar(50),
  FOREIGN KEY (StudentId) REFERENCES STUDENTS(StudentId),
  FOREIGN KEY (CourseId) REFERENCES COURSES(CourseId),
);

-- Create the ATTENDANCES table
CREATE TABLE ATTENDANCES (
  AttendanceId INT PRIMARY KEY,
  EnrollmentId INT,
  Date DATE,
  Status VARCHAR(50),
  FOREIGN KEY (EnrollmentId) REFERENCES ENROLLMENTS(EnrollmentId)
);

-- Create the EVALUATIONS table
CREATE TABLE EVALUATIONS (
  EvaluationId INT PRIMARY KEY,
  EnrollmentId INT,
  EvaluationType VARCHAR(50),
  Marks DECIMAL(5, 2),
  weightage int,
  FOREIGN KEY (EnrollmentId) REFERENCES ENROLLMENTS(EnrollmentId)
);

--CREATE the course history table
CREATE TABLE COURSE_HISTORY (
  HistoryId INT PRIMARY KEY,
  StudentId INT,
  CourseId INT,
  Semester VARCHAR(50),
  Grade VARCHAR(10),
  FOREIGN KEY (StudentId) REFERENCES STUDENTS(StudentId),
  FOREIGN KEY (CourseId) REFERENCES COURSES(CourseId)
);

-- Create the MARKS table
CREATE TABLE MARKS (
  MarkId INT PRIMARY KEY,
  EvaluationId INT,
  ObtainedMarks DECIMAL(5, 2),
  FOREIGN KEY (EvaluationId) REFERENCES EVALUATIONS(EvaluationId)
);
delete from EVALUATION
-- Create the FEEDBACK table
CREATE TABLE FEEDBACK (
  FeedbackId INT PRIMARY KEY,
  EnrollmentId INT,
  TeacherId INT,
  Date DATE,
  Subject VARCHAR(100),
  NameOfTeacher VARCHAR(100),
  Q1Rating INT,
  Q2Rating INT,
  Q3Rating INT,
  Q4Rating INT,
  Q5Rating INT,
  Q6Rating INT,
  Q7Rating INT,
  Q8Rating INT,
  Q9Rating INT,
  Q10Rating INT,
  Q11Rating INT,
  Q12Rating INT,
  Q13Rating INT,
  Q14Rating INT,
  Q15Rating INT,		
  Q16Rating INT,
  Q17Rating INT,
  Q18Rating INT,
  Q19Rating INT,
  Q20Rating INT,
  Comments VARCHAR(MAX),
  FOREIGN KEY (EnrollmentId) REFERENCES ENROLLMENTS (EnrollmentId),
  FOREIGN KEY (TeacherId) REFERENCES FACULTY (FacultyId)
);
delete from SECTIONS



SELECT * FROM STUDENTS





BULK INSERT USERS
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\Users.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT COURSES
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\Courses.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT PREREQUISITES
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\prerequisite.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT STUDENTS
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\students.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT FACULTY
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\Faculty.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT ACADEMIC_OFFICE
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\acadamic.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);

BULK INSERT ENROLLMENTS
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\enrollment.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT ATTENDANCES
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\attendance.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT EVALUATIONS
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\evaluation.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT MARKS
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\marks.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT FEEDBACK
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\feedback.csv'
WITH (
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
);
BULK INSERT COURSE_HISTORY
FROM 'C:\Users\bilal\Documents\FAST\SEMESTER 5\db course\Project\CourseHistory.csv'
WITH (
    FIELDTERMINATOR = ',',
	ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- if the first row in the CSV contains headers
)
Select * from ENROLLMENTS
select * from COURSE_HISTORY
select * from FACULTY

DELETE FROM SECTIONS
WHERE  SectionId >= 61 and SectionId <=71 ;
