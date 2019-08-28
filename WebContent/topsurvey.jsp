<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="db.DbConnection"%>
    <%@ page import="java.sql.*"%>
    <%
    Connection con=null; 
    int its=0;
    int bmw=0;
    int arise=0;
    int redmi =0;
    %>
<%
try{
con=DbConnection.initializeDatabase();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select totalexcellents from survey_result where surveyname='ITS COLLEGE SURVEY'");
while(rs.next()){
	 its=rs.getInt(1);
	}
}catch(Exception ex){
	out.println(ex);
}
%>
<%
try{
con=DbConnection.initializeDatabase();
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select totalexcellents from survey_result where surveyname='Redmi 7s Mobile Survey'");
while(rs.next()){
	 its=rs.getInt(1);
	}
}catch(Exception ex){
	out.println(ex);
}
%>
<%
try{
con=DbConnection.initializeDatabase();
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select totalexcellents from survey_result where surveyname='Bmw Automobile Survey'");
while(rs1.next()){
	bmw=rs1.getInt(1);
}
}catch(Exception ex){
	out.println(ex);
}
%>

<%
if(its>bmw && its>arise){
	out.println("<html><body>");
	out.println("<center><h1>No. of Excellents Count(ITS COLLEGE SURVEY):</h1><h1>"+its+"</h1></center>");
	out.println("</body></html");
}else if(bmw>its && bmw>arise){
	out.println("<html><body>");
	out.println("<center><h1>No. of Excellents Count(Bmw Automobile Survey):</h1><h1>"+bmw+"</h1></center>");
	out.println("</body></html");
}else{
	out.println("<html><body>");
	out.println("<center><h1>No. of Excellents Count(Redmi 7s Mobile Survey):</h1><h1>"+redmi+"</h1></center>");
	out.println("</body></html");
}
%>