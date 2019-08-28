<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<%
String email=request.getParameter("email");
String pass=request.getParameter("pass");
if(email.equals(pass)){
	response.sendRedirect("selection.jsp");
	HttpSession hs=request.getSession();
	hs.setAttribute("Adminlogin", email);	
}
%>