# university-managment-website
 A university management system with role based access.

 The system contains three views Academic Officer, Student, and Faculty. Following are the requirements met for each views:

 Academic Office Interface:
    The main role in this project will be of academic office because academic office will offer
    courses in every semester. Academic Office are users which authority to offer courses, manage
    students by assigning courses to the registered students and allocate the courses to the respective
    Course and Lab Instructors. The features in this interface will offer the courses and show them to the
    students (The students should see the offered courses on their interface). Keep in mind before
    registering the student to specific course check the Pre-Requisite of the course. Once the students
    registered to the specific courses the academic officers’ should start making sections. Here you have
    to check that a student can only take 6 courses in one semester not more than that and also check if
    the count of the registered students in the course is less than 10 than the course will not be offered.
    In each section the count of the student should not be greater than 50. In one section the students
    should be in range of 10 to 50 not more than that. After making sections the courses will be allocated
    to the Course and Lab Instructors. One course/lab instructor can only teach maximum 3 courses and
    minimum less than 3 courses with less workload in a semester.
There will be a proper report generation process too. The Academic Officers will generate following
reports:

-> Offered Courses Report: This report contains all the courses offered in a semester with the
course codes and credit hours.

-> Students Section Report: This report contains all the students’ names with registration
number in a specific section. Sort the report on the basis of the registration no in ascending
order.

-> Course Allocation Report: This report contains the information of the course allocated to
which course/lab instructor and as well as the coordinator of the course.

Faculty Interface:
    This interface is for the faculty members who are teaching the courses. Faculty members are
    users which authority to set marks distribution, manage attendance, manage evaluations, generate
    grades and reports. The faculty members can only see the courses assigned to them with section.

    The faculty can set marks distribution like the weightage of the assignments, quizzes, sessional and
    finals. Keep in mind that the total marks of course is 100 so the distribution should be in such a way
    that it is exactly equal to 100 not more than 100 and not less than 100.

    The faculty will mark the attendance of the students in each section and also they can add the marks
    of the evaluations. You have to make separate interface for the attendance and evaluation
    management in the faculty interface. When the marks get finalized at the end of the semester then
    the faculty will generate grades on the basis of the marks taken by the students. Keep in mind that the
    grading policy used will be absolute.

There will be a proper report generation process too. The Faculty will generate following reports:

-> Attendance Sheet Report: This report contains all the registered students registration
numbers, names and attendance of the semester with percentage of the attendance.

-> Evaluation Report: This report contains all the evaluation marks of the students with the
total marks at the end column.

-> Grade Report: This report contains all the grades of the student in specific course with
registration no and names.

-> Count of Grades Report: This report contains all the grades count in a specific section. 

-> Students Feedback Report: This report contains all the feedback given by the students to
the teacher.

Student Interface:
    This interface is for the students who registered themselves in the courses. You have to design
    this interface like your flex interface. Students are users who can see their information on the interface
    like their attendance, evaluation marks of each registered course, transcript, and previous semester
    CGPAs comparison graphs. The students can also give feedback to the teachers. For this you have
    to design the form. You have to make the same form same as given below:
    Link to the Form: https://www.jotform.com/build/231072139016446

    The feedback given to the teacher should be visible to the faculty on their interface with proper
    comments and find the percentage from the question values at the end and show percentage to the
    faculty member as well with comments.