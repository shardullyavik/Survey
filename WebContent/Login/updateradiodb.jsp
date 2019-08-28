<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  
    <%@ page import="db.DbConnection" %>  
      <%
Object o=session.getAttribute("AdminLogin");
String email=(String)o;
%>

 <style>
{
    margin: 0;
    padding: 0;
}



 html{
    background: url("uiimage.jpeg") no-repeat center center fixed; 
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;

    
    }
h1{

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
    height: auto;
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
#sub{

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
out.println("<div class='sessiondiv'>LOGINUSER ID:"+ email+"<br>");
out.println("<a href = index.html>SIGN OUT</a></div><br>");
%>

<div class="registration">
    <div>
    <form action="modify.jsp" method="post">
    <%
String q1= request.getParameter("optionvalue");

try { 
	int c=0;
    Connection con = DbConnection.initializeDatabase(); 
    PreparedStatement pst = con.prepareStatement("select * from survey_registration where q1=? ");
    pst.setString(1, q1); 
    ResultSet rs=pst.executeQuery();
    c++;
	System.out.print(c);
    while(rs.next()){  
    	
    %>
    
        <h1><i>SURVEY UPDATION FORM<i></h1><br>
        Survey Id:<input type="text" placeholder="Your ID" name="id" id="name"  value="<%=rs.getString(1)%>" size="40"readonly><br><br>
        Survey Name:<input type="text"placeholder="Enter Survey Name"   name="q1"  id="name" value="<%= rs.getString(2)%>" readonly><br><br>
        Ques 1:<input type="text" placeholder="Ques.No. 1" name="q2" id="name"  value="<%=rs.getString(3)%>"><br><br>
        Ques 2:<input type="text" placeholder="Ques.No. 2" name="q3" id="name"  value="<%=rs.getString(4)%>"><br><br>
        Ques 3:<input type="text" placeholder="Ques.No. 3" name="q4" id="name"  value="<%=rs.getString(5)%>"><br><br>
        Ques 4:<input type="text" placeholder="Ques.No. 4" name="q5" id="name" " value="<%=rs.getString(6)%>"><br><br>
        Ques 5:<input type="text" placeholder="Ques.No. 5" name="q6" id="name"  value="<%=rs.getString(7)%>"><br><br>
        Ques 6: <input type="text" placeholder="Ques.No. 6" name="q7" id="name"  value="<%=rs.getString(8)%>"><br><br>
        <input type="submit" id="sub" value="Update">
        <a href="selection.jsp"><input type="button" value="Go Back"id="bak">
    </form>
</div>
</div>
<%}
    pst.close(); 
    con.close();    
} 
catch (Exception e) { 
  out.println(e);

}
%>

</body>
</html>
    	
    