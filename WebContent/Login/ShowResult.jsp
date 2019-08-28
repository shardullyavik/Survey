
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="db.DbConnection"%>
<%@ page import="java.sql.*"%>
<%
Object o=session.getAttribute("Adminlogin");
String st=(String)o;
%><!DOCTYPE html>
<html>
<head>
    <title>Show Surveys</title>
    <style>
    
    
   html{
    background: url("uiimage.jpeg") no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;

    
    }
    
     h1{ 
            
            font-family: "Comic Sans MS", cursive, sans-serif;
            font-size: 50px;
        	align:center;
            
        
        }
		
		.w3-table-all {
	border-collapse: collapse;
	border-spacing: 0;
	width: 100%;
	display: table;
	color:black;
	font-family: Trebuchet MS, Arial, Helvetica,
		sans-serif;
}

.w3-table-all {
	border: 1px solid #ccc
	font-family: "Comic Sans MS", cursive, sans-serif;
}

.w3-bordered tr, .w3-table-all tr {
	border-bottom: 1px solid #ddd
	
}

.w3-striped tbody tr:nth-child(even) {
	background-color: #f1f1f1
}

.w3-table-all tr:nth-child(odd) {
	background-color: #fff
}

.w3-table-all tr:nth-child(even) {
	background-color: #f1f1f1
}

.w3-hoverable tbody tr:hover, .w3-ul.w3-hoverable li:hover {
	background-color: #ccc
}

.w3-centered tr th, .w3-centered tr td {
	text-align: center
}

.w3-table td, .w3-table th, .w3-table-all td, .w3-table-all th {
	padding: 8px 8px;
	display: table-cell;
	text-align: left;
	vertical-align: top
}

.w3-table th:first-child, .w3-table td:first-child, .w3-table-all th:first-child,
	.w3-table-all td:first-child {
	padding-left: 16px
}
.w3-red, .w3-hover-red:hover {
	color: #fff !important;
	background-color: #f44336 !important
}
  
    input[type="button"] {
	letter-spacing: 2px;
	font-size: 20px;
	border: groove;
	outline: none;
	color: #fff;
	background: #03a9f4;
	padding: 10px 30px;
	float: left;
	cursor: pointer;
	border-radius: 8px;
}
.sessiondiv{
padding-top:3px;
float: right;
width:20%;
border-radius: 25px;
background: #fff;
text-align: center;
font-family: "Comic Sans MS", cursive, sans-serif;

}

    </style>
</head>
<body >
	<%
out.println("<div class='sessiondiv' align=right>LOGINUSER ID:- "+ st+" <br><br>");
out.println("<a href = http://localhost:8080/Survey/Login/index.html>SIGN OUT</a></div><br>");
%>
	<center><a href="selection.jsp"><input type="button" value="Go Back"></a></center>
	<center><h1>SUBMITTED SURVEY'S RESPONSES</h1></center>
	
	<div class="div1">
	<%
	Object obj= session.getAttribute("survey_id");
	int survey_id=(Integer)obj;
    try
    {	
    	Object obj1=session.getAttribute("survey_name");
    	String survey_name=(String)obj1;
    	String survey_name1=survey_name+ " RESULT";
    	Connection con= DbConnection.initializeDatabase();
    	PreparedStatement pst=con.prepareStatement("select * from user_registration where survey_id=?");
    	pst.setInt(1, survey_id);
    	ResultSet rs=pst.executeQuery();
    %>
		 <table class="w3-table-all" border=1 align=center style="text-align:center" >
			<thead>
				<tr class="tab">				
					<th colspan="12"><h2><%= survey_name1 %></h2></th>
				</tr>
				<tr>
					<th>Survey ID</th>
					<th>Survey Date</th>
					<th>User Name</th>
					<th>User Email</th>
					<th>User City</th>
					<th>User Contact</th>
					<th>Answer-1</th>
					<th>Answer-2</th>
					<th>Answer-3</th>
					<th>Answer-4</th>
					<th>Answer-5</th>
					<th>Answer-6</th>
				</tr>
			</thead>
			<tbody>
			
	     <% while(rs.next())
        {%>
				<tr>
					<td><%=rs.getString(1) %></td>
					<td><%=rs.getString(2) %></td>
					<td><%=rs.getString(3) %></td>
					<td><%=rs.getString(4) %></td>
					<td><%=rs.getString(5) %></td>
					<td><%=rs.getString(6) %></td>
					<td><%=rs.getString(7) %></td>
					<td><%=rs.getString(8) %></td>
					<td><%=rs.getString(9) %></td>
					<td><%=rs.getString(10) %></td>
					<td><%=rs.getString(11) %></td>
					<td><%=rs.getString(12) %></td>
				</tr>
				<%}%>
			</tbody>
		</table>
		<br>
		<%}
    catch(Exception e){
        out.print(e.getMessage());
    }
        %>
		<br>
	</div>
	</body>
</html>

<html>
<head>
<title>Show Surveys</title>
<style>
    
     h1{ 
            
            font-family: "Comic Sans MS", cursive, sans-serif;
            font-size: 50px;
        	align:center;
            
        
        }
  
	    input[type="button"] {
		background: transparent;
		text-transform: uppercase;
		letter-spacing: 2px;
		font-size: 20px;
		border: groove;
		outline: none;
		color: #fff;
		background: #03a9f4;
		padding: 10px 30px;
		align: center;
		cursor: pointer;
		border-radius: 8px;
	    }

    </style>
</head>
<body >
	<div class="div1">
		<%
   			int poorcount=0,goodcount=0,excellentcount=0;
      	try {
      		Object obj1=session.getAttribute("survey_name");
        	String survey_name=(String)obj1;
        	String survey_name1=survey_name+ " RESULT";
      		Connection con = DbConnection.initializeDatabase();
      		PreparedStatement pst = con.prepareStatement("select * from user_registration where survey_id=?");
      		pst.setInt(1, survey_id);
      		ResultSet rs = pst.executeQuery();
      		%>
		<table class="w3-table-all" border=1 align=center bgcolor=skyblue
			style="text-align: center">
			<thead>
				<tr>
					<th colspan="11"><h2><%= survey_name1 %></h2></th>
				</tr>
				<tr>
					<th>Total Survey Count</th>
					<th>Total Poors Feedbacks</th>
					<th>Total Goods Feedbacks</th>
					<th>Total Excellent Feedbacks</th>
				</tr>
			</thead>
			<tbody>
				<%
      		ArrayList poor = new ArrayList();
      		ArrayList good = new ArrayList();
      		ArrayList excellent = new ArrayList();
      		Object obj2=session.getAttribute(survey_name);
      		String surveyname=(String)obj2;
      		while(rs.next())
      		{
      		    if(rs.getString(7).equals("Poor"))
      		    {
      		      poor.add("poor");	
      		    	
      		    }
      		  if(rs.getString(8).equals("Poor"))
    		    {
    		      poor.add("poor");	
    		    	
    		    }
      		 if(rs.getString(9).equals("Poor"))
   		    {
   		      poor.add("poor");	
   		    	
   		    }
      		 if(rs.getString(10).equals("Poor"))
   		    {
   		      poor.add("poor");	
   		    	
   		    }
      		 if(rs.getString(11).equals("Poor"))
   		    {
   		      poor.add("poor");	
   		    	
   		    }
      		 if(rs.getString(12).equals("Poor"))
   		    {
   		      poor.add("poor");	
   		    	
   		    }
      		 if(rs.getString(7).equals("Good"))
  		    {
  		      good.add("good");	
  		    	
  		    }
  		  if(rs.getString(8).equals("Good"))
		    {
		      good.add("good");	
		    	
		    }
  		 if(rs.getString(9).equals("Good"))
		    {
		      good.add("good");	
		    	
		    }
  		 if(rs.getString(10).equals("Good"))
		    {
		      good.add("good");	
		    	
		    }
  		 if(rs.getString(11).equals("Good"))
		    {
		      good.add("good");	
		    	
		    }
  		 if(rs.getString(12).equals("Good"))
		    {
		      good.add("good");	
		    	
		    }
  		if(rs.getString(7).equals("Excellent"))
		    {
  			excellent.add("excellent");	
		    	
		    }
		  if(rs.getString(8).equals("Excellent"))
	    {
			  excellent.add("excellent");	
	    	
	    }
		 if(rs.getString(9).equals("Excellent"))
	    {
			 excellent.add("excellent");	
	    	
	    }
		 if(rs.getString(10).equals("Excellent"))
	    {
			 excellent.add("excellent");	
	    	
	    }
		 if(rs.getString(11).equals("Excellent"))
	    {
			 excellent.add("excellent");	
			 
	    	
	    }
		 if(rs.getString(12).equals("Excellent"))
	    {
			 excellent.add("excellent");	
	    	
	    }			
      		}
      		System.out.println(poor.size());
      		
      		int p=poor.size();
      		int g=good.size();
      		int e=excellent.size();
     		PreparedStatement pst1=con.prepareStatement("select count(*) from user_registration where survey_id=?");
     		pst1.setInt(1, survey_id);
     		ResultSet rs1= pst1.executeQuery();
     		int id=0;
      		while(rs1.next())
      		{
      			 id=rs1.getInt(1);
      		}
      		PreparedStatement pst2=con.prepareStatement("insert into survey_result values(?,?,?,?,?)");
      		pst2.setInt(1, id);
      		pst2.setInt(2, p);
      		pst2.setInt(3, g);
      		pst2.setInt(4, e);
      		pst2.setString(5, surveyname);
      		System.out.println(surveyname);
      		pst2.execute();
      		System.out.println("submitted");
      	%>
				<tr>
					<td><%= id %></td>
					<td><%= p %></td>
					<td><%= g %></td>
					<td><%= e %></td>

				</tr>
				<% 	}
      catch (Exception e) {
      		System.out.println(e);
      	}
      %>
			
</body>
</html>