<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>  
  <%@ page import="db.DbConnection" %>

<%
Object obj=session.getAttribute("survey_id");
int n=(Integer)obj;
Object obj2=session.getAttribute("survey_date");
String d=(String)obj2;
Object obj3=session.getAttribute("user_name");
String user_name=(String)obj3;
Object obj4=session.getAttribute("user_email");
String user_email=(String)obj4;
Object obj5=session.getAttribute("user_city");
String user_city=(String)obj5;
Object obj6=session.getAttribute("user_contact");
String contact=(String)obj6;
String a1= request.getParameter("r1");
String a2= request.getParameter("r2");
String a3= request.getParameter("r3");
String a4= request.getParameter("r4");
String a5= request.getParameter("r5");
String a6= request.getParameter("r6");
Connection con1= DbConnection.initializeDatabase();
PreparedStatement pst1=con1.prepareStatement("insert into user_registration values(?,?,?,?,?,?,?,?,?,?,?,?)");
pst1.setInt(1,n);
pst1.setString(2,d);
pst1.setString(3,user_name);
pst1.setString(4,user_email);
pst1.setString(5,user_city);
pst1.setString(6,contact);
pst1.setString(7, a1);
pst1.setString(8, a2);
pst1.setString(9, a3);
pst1.setString(10, a4);
pst1.setString(11, a5);
pst1.setString(12, a6);
pst1.execute();
pst1.close();
response.sendRedirect("userresponsesuccess.jsp");
%>