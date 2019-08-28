<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>  
    <%@ page import="db.DbConnection" %> 
    
    <%
Object o=session.getAttribute("Adminlogin");
String email=(String)o;
%>
 
<!DOCTYPE html>
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
    padding-top:3px;
	float: left;
	border-radius: 25px;
	background: #fff;
	text-align: center;
	font-family: "Comic Sans MS", cursive, sans-serif;
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
	border-radius: 12px;
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
out.println("<div class='sessiondiv' align=right>LOGINUSER ID:- "+ email+" <br><br>");
out.println("<a href = http://localhost:8080/Survey/Login/index.html>SIGN OUT</a></div><br>");
%>

<center><a href="selection.jsp"><input type="button" value="Go Back"></a></center>
<center><h1>CREATED SURVEY'S LIST</h1></center>
<div class="div1">
    <%
    try
    {	
    	Connection con = DbConnection.initializeDatabase(); 
    	 PreparedStatement pst = con.prepareStatement("select * from survey_registration ");
    	    ResultSet rs=pst.executeQuery();
    %>   
    <table class="w3-table-all" border=1 align=center bgcolor= green style="text-align:center" >
      <thead>
          <tr>
             <th>Survey Id</th>
             <th>Survey_name</th>
             <th>Ques 1</th>
             <th>Ques 2</th>
             <th>Ques 3</th>
             <th>Ques 4</th>
             <th>Ques 5</th>
             <th>Ques 6</th>
          </tr>
      </thead>
      <tbody>
        <%while(rs.next())
        {
         %>
            <tr>
                <td><%=rs.getString(1) %></td>
                <td><%=rs.getString(2) %></td>
                <td><%=rs.getString(3) %></td>
                <td><%=rs.getString(4) %></td>
                <td><%=rs.getString(5) %></td>
                <td><%=rs.getString(6) %></td>
                <td><%=rs.getString(7) %></td>
                <td><%=rs.getString(8) %></td>
            </tr>
            <%}%>
           </tbody>
        </table><br>
    <%}
    catch(Exception e){
        out.print(e.getMessage());
        %>
        <br>
   <%}%>
   </div>
</body>
</html>