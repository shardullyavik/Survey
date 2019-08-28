<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
<%@ page import="db.DbConnection" %>  

<%
Object o=session.getAttribute("Adminlogin");
String email=(String)o;
%>
    

 
 
<html>
<head>
  <title>Admin Survey Creation</title> 
  <style>
{
    margin: 0;
    padding: 0;
}



body{
	
	
    background-size: cover;
    background-image: url("uiimage.jpeg");
}
h1{

	    font-family: "Comic Sans MS", cursive, sans-serif;
	border-radius:25px;
    text-align: center;
    color: white;
    background: rgba(0, 0, 0, 0.5);
    padding: 10px;

}
.registration{

	border-radius:20px;
    margin: auto;
    width: 45%;
    height: 100%;
    text-align: center;
    color: white;
    background: rgba(0, 0, 0, 0.5);
    border: 2px solid;
    padding: 15px;
}

#ph{

    border-radius:25px;
    font-size: 18px;
    background: rgb(144, 196, 187);
}
#name{

    width: 80%;
    padding: 5px;
    border-radius: 5px;
    border: 1px solid;
    font-family: "Comic Sans MS", cursive, sans-serif;
    font-size: 18px;
    background: rgb(144, 196, 187);
    outline: 0;
}
#name:hover { 
  background-color: #138D75  ;
}


#bak{

 width: 150px;
    padding: 5px;
    font-family: sans-serif;
    font-size: 18px;
    border: 0;
    outline: 0;
    border-radius: 10px;
    background-color: #F39C12  ;
    margin:5%; 

}

.sub{
	float:left;
    width: 150px;
    padding: 5px;
    font-family: sans-serif;
    font-size: 18px;
    border: 0;
    outline: 0;
    border-radius: 10px;
    background-color: #F39C12  ;
    margin:5%; 
}

.bak{

    float:right;
    width: 150px;
    padding: 5px;
    font-family: sans-serif;
    font-size: 18px;
    border: 0;
    outline: 0;
    border-radius: 10px;
    background-color: #F39C12  ;
    margin:5%; 
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
</style>
</head>
<body>
<%
out.println("<div class='sessiondiv' align=right>LOGINUSER ID:- "+ email+" <br><br>");
out.println("<a href = http://localhost:8080/Survey/Login/index.html>SIGN OUT</a></div><br><br>");
%>


<div class="registration">
    <div>
    <form action="register.jsp" method="post">
        <h1><i>SURVEY REGISTRATION<i></h1><br>
        Survey Id:<input type="number" placeholder="Your ID" name="id" id="name" pattern="[1-9]{3}" required><br><br>
        Survey Name:<input type="text"placeholder="Enter Survey Name"   name="q1"  id="name"  required ><br><br>
        Ques 1:<input type="text" placeholder="Ques.No. 1" name="q2" id="name"  required><br><br>
        Ques 2:<input type="text" placeholder="Ques.No. 2" name="q3" id="name"  required><br><br>
        Ques 3:<input type="text" placeholder="Ques.No. 3" name="q4" id="name"  required><br><br>
        Ques 4:<input type="text" placeholder="Ques.No. 4" name="q5" id="name"  required><br><br>
        Ques 5:<input type="text" placeholder="Ques.No. 5" name="q6" id="name"   required><br><br>
        Ques 6: <input type="text" placeholder="Ques.No. 6" name="q7" id="name"  required><br>
         <div class="inputButton">
            <center><input type="submit" class="sub "value="CreateSurvey"></center>
             <center><a href="selection.jsp"><input type="button" class="bak"value="Go Back"></a></center>
            </div>
        </div>
        
        </form>
    </body>
</html>
