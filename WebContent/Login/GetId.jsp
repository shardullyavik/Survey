<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>  
    <%@ page import="db.DbConnection" %>  
    <%
Object o=session.getAttribute("AdminLogin");
String st=(String)o;
%>
<!DOCTYPE html>
<html>
<head>
    <title>Show Surveys</title>
    <style>
.div1{
  align-items: center;
  background-image: url("select.jpeg");
  display: flex;
  font-family: "Open Sans", sans-serif;
  font-size: 20px;
  height: 100vh;
  justify-content: center;
  margin: 0;


}
.table{
border-radius: 25px;
  background: #73AD21;
  padding: 20px; 
  

}
    </style>
</head>
<body >
<%
out.println("<div align=right>LOGINUSER ID:"+ st+"</div><br>");
out.println("<div align=right><a href = http://localhost:8080/Survey/Login/index1.html>SIGN OUT"+ st+"</a></div><br>");
%>
<div class="div1">
    <%
    String q1=request.getParameter("optionvalue");
    try
    {
    	Connection con= DbConnection.initializeDatabase();
    	PreparedStatement pst1=con.prepareStatement("select survey_id from survey_registration where q1=?");
    	pst1.setString(1, q1);
    	ResultSet rs1= pst1.executeQuery();
    	if(rs1.next())
    	{
    		int survey_id=rs1.getInt(1);
    		session.setAttribute("survey_id", survey_id);
    		session.setAttribute("survey_name", q1);
     		response.sendRedirect("ShowResult.jsp");
    	}
    	pst1.close();
    	   }
    catch(Exception e)
    {
    	e.printStackTrace();
    	}
    
    %>