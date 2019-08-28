<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>  
  <%@ page import="db.DbConnection" %>

<%
Object o=session.getAttribute("AdminLogin");
String st=(String)o;
%>
<%
Object obj=session.getAttribute("survey_id");
int n=(Integer)obj;
Object obj2=session.getAttribute("survey_date");
String d=(String)obj2;
Connection con1= DbConnection.initializeDatabase();
String user_name=request.getParameter("user_name");
String user_email=request.getParameter("user_email");
String user_city=request.getParameter("user_city");
String user_contact=request.getParameter("contact");
session.setAttribute("user_name", user_name);
session.setAttribute("user_email", user_email);
session.setAttribute("user_city", user_city);
session.setAttribute("user_contact", user_contact);
%>
<%

	try {
		Connection con= DbConnection.initializeDatabase();
		PreparedStatement pst=con.prepareStatement("select * from survey_registration where survey_id=?");
		pst.setInt(1,n);
		ResultSet rs=pst.executeQuery();
		response.setContentType("text/html");
		while(rs.next()){
			%>
<html>
<head>
  <title>UserSurveyResponse</title> 
  <style>
 /**{
    margin: 0;
    padding: 0;
}
*/
body{
    background-size: cover;
    background-image:url("uiimage.jpeg") ;
}
h1{
	font-family: "Comic Sans MS", cursive, sans-serif;
	border-radius:35px;
    text-align: center;
    color: white;
    background: rgba(0, 0, 0, 0.5);
    padding: 15px;

}
h2{
font-family: "Comic Sans MS", cursive, sans-serif;


}
.registration{

	border-radius:35px;
    margin: auto;
    width: 50%;
    height: auto;
    text-align: center;
    color: white;
    background: rgba(0, 0, 0, 0.5);
    border: 2px solid;
    padding: 15px;
}
#ph{
    border-radius:10px;
    font-size: 18px;
    background: rgb(144, 196, 187);
}
#name{
    width: 50%;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid;
    font-family: sans-serif;
    font-size: 18px;
    background: rgb(144, 196, 187);
    outline: 0;
}
#sub{
    width: 150px;
    padding: 5px;
    font-family: sans-serif;
    font-size: 18px;
    border: 0;
    outline: 0;
    border-radius: 10px;
   background: #03a9f4;
    margin:5%; 
}

#bak{
    width: 150px;
    padding: 5px;
    font-family: sans-serif;
    font-size: 18px;
    border: 0;
    outline: 0;
    border-radius: 10px;
     background: #03a9f4;;
    margin:5%; 
}
  
  </style>

</head>

<body>
<div class="registration">
    <div class="header">
   
	
    <form action="InsertAnswer.jsp" method="get">
        <h1>Survey Responses</h1>
        <h2>Survey ID: <%=rs.getInt(1)%></h2>
        <h2>Survey Name: <%=rs.getString(2)%></h2>
        <h2><%=rs.getString(3)%></h2>
        Poor<input type="radio" name="r1" value="Poor" required>
        Good<input type="radio" name="r1" value="Good" required>
        Excellent<input type="radio" name="r1" value="Excellent" required>
        
       <h2><%=rs.getString(4)%></h2>
        Poor<input type="radio" name="r2" value="Poor" required>
        Good<input type="radio" name="r2" value="Good">
        Excellent<input type="radio" name="r2" value="Excellent">
        
        <h2><%=rs.getString(5)%></h2>
        Poor<input type="radio" name="r3" value="Poor"required>
        Good<input type="radio" name="r3" value="Good" required>
        Excellent<input type="radio" name="r3" value="Excellent" required>
        
        <h2><%=rs.getString(6)%></h2>
        Poor<input type="radio" name="r4" value="Poor"required>
        Good<input type="radio" name="r4" value="Good"required>
        Excellent<input type="radio" name="r4" value="Excellent"required>
        
        <h2><%=rs.getString(7)%></h2>
        Poor<input type="radio" name="r5" value="Poor" required>
        Good<input type="radio" name="r5" value="Good" required>
        Excellent<input type="radio" name="r5" value="Excellent" required>

        <h2><%=rs.getString(8)%></h2>
        Poor<input type="radio" name="r6" value="Poor" required>
        Good<input type="radio" name="r6" value="Good" required>
        Excellent<input type="radio" name="r6" value="Excellent" required>
        <br>
         <center><input type="submit" id="sub" value="UPDATE"></center>
         <center><a href="userlogin.jsp"><input type="button" id="bak"value="Go back"></a></center>
         
    </form>
</div>
</div>
</body>
</html>
		<%}
   } 
   catch (Exception e) { 
      out.println(e);
}
%>