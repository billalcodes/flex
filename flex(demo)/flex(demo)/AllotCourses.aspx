<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllotCourses.aspx.cs" Inherits="AllotCourses" %>

<!DOCTYPE html>

<html>
<head>
	<title>Alot Sections to Instructors</title>
	<link rel="stylesheet" href="StyleSheet.css">
</head>
<body>
	<nav>
		<ul>
            <li><a href="Home.aspx">Home</a></li>
            <li><a href="OfferCourses.aspx">Offer Courses</a></li>
            <li><a href="RegisterStudents.aspx">Register Students</a></li>
            <li><a href="AllotCourses.aspx">Allot Courses</a></li>
            <li><a href="MakeSections.aspx">Make Sections</a></li>
            <li><a href="Reports.aspx">Reports</a></li>
        
        </ul>
        <ul>
            <li><a href="login.aspx">Sign In</a></li>
            <li><a href="signup.aspx">Sign Up</a></li>
        </ul>
    </nav>
	<div class="container">
		<div class="form-container">
			<h1>Alot Sections to Instructors</h1>
			<form method="post" action="">
				<div class="form-group">
					<label for="instructorId">Instructor ID:</label>
					<input type="text" id="instructorId" name="instructorId" required>
				</div>
				<div class="form-group">
					<label for="instructorName">Instructor Name:</label>
					<input type="text" id="instructorName" name="instructorName" required>
				</div>
			<div class="form-group">
                    <label for="discipline">Discipline:</label>
                    <select id="discipline" name="discipline" required>
                        <option value="">Select Discipline</option>
                        <option value="CS">Computer Science</option>
                        <option value="AI">Artificial Intelligence</option>
                        <option value="DS">Data Science</option>
                        <option value="SE">Software Engineering</option>
                        <option value="BBA">Business Administration</option>
                        <option value="EE">Electrical Engineering</option>
                    </select>
                </div>
				<div class="form-group">
					<label for="post">Post:</label>
					<input type="text" id="post" name="post" required>
				</div>
				<div class="form-group">
					<label for="field">Field:</label>
					<input type="text" id="field" name="field" required>
				</div>
				<input type="submit" value="Allot Sections">
			</form>
		</div>
	</div>
</body>
</html>


