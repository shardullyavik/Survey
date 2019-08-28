<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
    <%@ page import="db.DbConnection" %>  
    
<%
Object o=session.getAttribute("Adminlogin");
String email=(String)o;
%>
    
    
<% 

		int survey_id= Integer.parseInt(request.getParameter("id"));
		String q1= request.getParameter("q1");
		String q2= request.getParameter("q2");
		String q3=request.getParameter("q3");
		String q4=request.getParameter("q4");
		String q5=request.getParameter("q5");
		String q6=request.getParameter("q6");
		String q7=request.getParameter("q7");
	 
		try { 
            Connection con = DbConnection.initializeDatabase(); 
            PreparedStatement pst = con.prepareStatement("update survey_registration set q1=?,q2=?,q3=?,q4=?,q5=?,q6=?,q7=? where survey_id=?");
             
            pst.setString(1, q1);
            pst.setString(2, q2); 
            pst.setString(3, q3); 
            pst.setString(4, q4); 
            pst.setString(5, q5); 
            pst.setString(6, q6); 
            pst.setString(7, q7); 
            pst.setInt(8, survey_id);
  
            pst.execute(); 
            response.sendRedirect("modificationsuccess.jsp");
            pst.close(); 
            con.close(); 
  
           
        } 
        catch (Exception e) { 
           e.getMessage();

}
%>