<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.DbConnection"%>
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
			Connection con= DbConnection.initializeDatabase(); 
            PreparedStatement pst = con.prepareStatement("insert into survey_registration values(?,?,?,?,?,?,?,?)"); 
            pst.setInt(1, survey_id);
            pst.setString(2, q1);
            pst.setString(3, q2); 
            pst.setString(4, q3); 
            pst.setString(5, q4); 
            pst.setString(6, q5); 
            pst.setString(7, q6); 
            pst.setString(8, q7); 
            pst.execute();
           response.sendRedirect("creationsuccess.jsp");
        } 
        catch (Exception e) { 
           out.println(e);

}
%>