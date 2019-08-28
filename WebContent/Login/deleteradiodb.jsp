<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
    <%@ page import="db.DbConnection" %>  
<%
String q1= request.getParameter("optionvalue");

try { 
    Connection con = DbConnection.initializeDatabase(); 
    PreparedStatement pst = con.prepareStatement("delete from survey_registration where q1=? ");
    pst.setString(1, q1); 
    pst.execute();
    response.sendRedirect("deletionsuccess.jsp");
    pst.close(); 
    con.close();  
} 
catch (Exception e) { 
  out.println(e);

}
%>
    