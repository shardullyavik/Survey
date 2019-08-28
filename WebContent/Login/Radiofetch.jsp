<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String radio=request.getParameter("inputs");
if(radio.equals("create")){
	response.sendRedirect("Registerform.jsp");
}
if(radio.equals("modify")){
	response.sendRedirect("updateradio.jsp");
}
if(radio.equals("delete")){
	response.sendRedirect("deletetable.jsp");
}
if(radio.equals("show")){
	response.sendRedirect("showtable.jsp");
}
if(radio.equals("showresult")){
	response.sendRedirect("ShowSurveyName.jsp");
}
%>