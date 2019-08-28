package db;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out= response.getWriter();
    int survey_id= Integer.parseInt(request.getParameter("id"));
		String q1= request.getParameter("q1");
		String q2=request.getParameter("q2");
		String q3=request.getParameter("q3");
		String q4=request.getParameter("q4");
		String q5=request.getParameter("q5");
		String q6=request.getParameter("q6");
	 
		try { 
			System.out.println("hhello");
            Connection con = DbConnection.initializeDatabase(); 
            PreparedStatement pst = con.prepareStatement("insert into survey_registration values(?,?,?,?,?,?,?)"); 
            pst.setInt(1, survey_id); 
            pst.setString(2, q1); 
            pst.setString(3, q2); 
            pst.setString(4, q3); 
            pst.setString(5, q4); 
            pst.setString(6, q5); 
            pst.setString(7, q6); 
  
            pst.execute(); 
            pst.close(); 
            con.close(); 
  
           
        } 
        catch (Exception e) { 
           e.getMessage();
        } 
		
		
	}

}
