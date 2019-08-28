<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="db.DbConnection" %> 
    <%
Object o=session.getAttribute("Adminlogin");
String email=(String)o;
%>
<html>
    <head>
        <title>AdminDeleteSurvey</title>
        <style>
        
        h1{ 
            
            font-family: "Comic Sans MS", cursive, sans-serif;
             font-size: 50px;
        	float:center; 
        	margin-top: 8px;
            margin-left: 17%;
            
        
        
        }
        body{
            
           
            background-image:url("uiimage.jpeg");
            margin: 0;
            padding: 0;
           
        }
        .box{
            position: absolute;
            top: 50%;
            left: 50%;
            transform:translate(-50%,-50%);
        }
        .box select{
        	
            background: none;
            padding: 10px;
            width: 600px;
            height: 50px;
            border-radius: 12px;
            border:2px solid #808080;
            font-size: 20px;
            box-shadow: 0px 10px 50px rgba(68, 64, 64, 0.5);
            -webkit-appearance: button;
            outline:none;
        }
        .box:before{
        	
        	border-radius:12px;
            content: '';
            position: absolute;
            top: 0;
            right:0;
            width: 50px;
            height:50px;
            background:transparent;
            font-family: "Font awesome 5 free";
            line-height: 50px;
            color:#fff;
            font-size: 30px;
            pointer-events: none;
        }
 
            .box:hover::before{
            background: #1C2833;
        }
        
    .box .inputButton input[type="submit"] {
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
.box .inputButton input[type="button"] {
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
.sessiondiv{
margin-top:5px;
padding-top:3px;
float: right;
width:20%;
border-radius: 25px;
background: #fff;
text-align: center;
font-family: "Comic Sans MS", cursive, sans-serif;

}

.box .inputButton input:hover{
background-color:#1C2833;
}
        </style>
        <link rel="stylesheet" href="https://use.fontawesome.com/release/v5.0.13/css/all.css" 
        integrity="sha-384DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtV1RW3tvkXWZh58N9jp" 
        crossorigin="anonymous">
        
        
    </head>
    <body>
    
<%
out.println("<div class='sessiondiv' align=right>LOGINUSER ID:- "+ email+" <br><br>");
out.println("<a href = http://localhost:8080/Survey/Login/index.html>SIGN OUT</a></div><br><br>");
%>
	<center><h1>SURVEY DELETION</h1></center>
    <form action="deleteradiodb.jsp" method="post">
        <div class="box">
 <%
try { 
    Connection con = DbConnection.initializeDatabase(); 
    PreparedStatement pst = con.prepareStatement("select * from survey_registration ");
    ResultSet rs=pst.executeQuery();
    out.print("<select name=\"optionvalue\">");
     while(rs.next()){
            
                out.println("<option>"+rs.getString("q1")+"</option>");
       }
        out.println("</select>");
        out.println("<br>");
     }

        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }

%><br><br>
         <div class="inputButton">
            <center><input type="submit"  value="Delete"></center><br>
            <br>
             <center><a href="selection.jsp"><input type="button" value="Go Back"></a></center>
            </div>
        </div>
        
        </form>
    </body>
</html>