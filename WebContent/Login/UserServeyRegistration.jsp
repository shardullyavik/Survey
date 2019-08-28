<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="db.DbConnection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>UserSurveyRegistration</title>

<style type="text/css">

body{
background: url("uiimage.jpeg");

}
.box {
		font-family: "Comic Sans MS", cursive, sans-serif;
        
    
	background:#fff;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -40%);
	width: 450px;
	max-width: 600px;
	padding: 20px;
	height: 600px;
	box-sizing: border-box;
	<!--background: rgba(0, 0, 0, .2);-->
	box-shadow: 0 15px 25px rgba(0, 0, 0, .8);
	border-radius: 20px;
	box-sizing: border-box;
}

.box h2 {
	margin: 0 0 20px;
	padding: 0;
	color: #ggg;
	text-align: center;
}

.box .inputBox {
	
	position: relative;
}

.box .inputBox input {
	width: 100%;
	padding: 8px 0;
	font-size: 18px;
	color: black;
	letter-spacing: 1px;
	border-radius: 10px;
	margin-bottom: 30px;
	border: none;
	border: 2px solid black;
	outline: none;
	background: transparent;
	border-radius: 10px;
}

.box .inputBox label {  
	position: absolute;
	top: 0;
	left: 0;
	left: 4px;
	letter-spacing: 1px;
	padding: 8px 0;
	font-size: 16px;
	color: #444;
	pointer-events: none;
	transition: .5s;
}

.box .inputBox input:focus ~ label, .box .inputBox input:focus ~ valid {
	top: -22px;
	left: 0;
	color: #444;
	font-size: 12px;
}

.box input[type="submit"] {
float:right;
	background: transparent;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 15px;
	border: none;
	outline: none;
	color: #fff;
	background: #03a9f4;
	padding: 10px 30px;
	align: center;
	cursor: pointer;
	border-radius: 8px;
}

.box input[type="button"] {
	background: transparent;
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 15px;
	border: none;
	outline: none;
	color: #fff;
	background: #03a9f4;
	padding: 10px 30px;
	align: center;
	cursor: pointer;
	border-radius: 8px;
}

.box .inputBoxGender {
	margin-bottom: 20px;
}

.box .inputBoxGender label {
	color: #444;
}
.inputButton input:hover{
background-color:red;
}
.inputLink a{
color:green;
	letter-spacing: 3px;
	font-size: 18px;
	padding:3px;
	margin:10px;
}

</style>
</head>
<body onload="document.register.name.focus()">
	<form action="SurveyAnswer.jsp"  method="post">
		<div class="box">
			<%
				try {
					String q1 = request.getParameter("optionvalue");
					Connection con = DbConnection.initializeDatabase();
					DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
					Date date = new Date();
					String str = df.format(date);
					PreparedStatement pst = con.prepareStatement("select survey_id from survey_registration where q1=?");
					pst.setString(1, q1);
					ResultSet rs = pst.executeQuery();
					while (rs.next()) {
						int survey_id = rs.getInt(1);
			%>
			<h2>User Survey Registration Form</h2>
			<hr>
			<br> Survey Id:<b><%=survey_id%></b><br>
			<br>
			<%
				session.setAttribute("survey_id", survey_id);
						session.setAttribute("survey_date",str);
			%>
			Survey Date:<b><%=str%></b><br><br>
			<br>

			<div class="inputBox">
				<input type="text" name="user_name"
					placeholder="Enter username here" required>
			</div>
			<div class="inputBox">
				<input type="email" name="user_email" placeholder="Enter email here" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" title="format=abc@gmail.com"required>
			</div>
			<div class="inputBox">
				<input type="text" name="user_city" placeholder="Enter city here"  required>
			</div>
			<div class="inputBox">
				<input type="text" name="contact"
					placeholder="Enter contact number here" pattern="[789][0-9]{9}" required>
			</div>
			<div class="inputButton">
			<input type="submit" value="submit" />
			<a href="userlogin.jsp"><input type="button" value="Go Back" /></a>
			</div>
			</div>
	</form>
</body>
</html>
<%
	}
	} catch (Exception e) {
		out.println("wrong entry" + e);
	}
%>