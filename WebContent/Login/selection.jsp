<%@page import="java.sql.*" %>
<%@page import="db.DbConnection" %>
<%
Object o=session.getAttribute("Adminlogin");
String email=(String)o;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>AdminManipulations in OnlineSurveyer</title>
<style type="text/css">

input[type=submit] {

	font-family:Verdana;
    padding:7px 18px; 
    background: #4D98EF; 
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 9px;
    border-radius: 7px; 
    
}
input[type=button] {

	font-family:Verdana;
    padding:7px 18px; 
    background: #4D98EF; 
    border:0 none;
    cursor:pointer;
    -webkit-border-radius: 9px;
    border-radius: 7px; 
    
}
body {

  align-items:center;
  background-image: url("uiimage.jpeg");
  color: #545556;
  display: flex;
  font-family: "Open Sans", sans-serif;
  font-size: 20px;
  height: 100vh;
  justify-content: center;
  margin: 0;
}
.containerOuter {

  font-family:Verdana;
  border-style: "groove";
  border-color: "black";
  background: white;
  color: white;
  border-radius: 25px;
  box-shadow: 2px 6px 20px 2px rgba(10,10,120,0.15);
}
.container {
  position: relative;
  margin: 20px;
  overflow: hidden;
  width: 390px;
  background: white;
}

.entry-label {
  color: #1C2833  ;
  cursor: pointer;
  margin-top: -3px;
  padding-left: 40px;
  user-select: none;
  -moz-user-select: none;
}
.highlight {
  background: #4D98EF;
  border-radius: 50%;
  height: 12px;
  left: 117px;
  pointer-events: none;
  position: absolute;
  top: 16px;
  transition: transform 400ms cubic-bezier(0.175, 0.885, 0.32, 1.2);
  transform: translateY(-50px);
  width: 12px;
}
.overlay {

  background: #fff;
  mask: url(#holes);
  -webkit-mask-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAACMCAYAAAAOc+uVAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAAOxAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUAd3d3Lmlua3NjYXBlLm9yZ5vuPBoAAAItSURBVHic7ZnNjhJBFIVPA0txr0Iyw+tIdOXWaDRufZWZeYbZuMKOUV9Gg+HHGN/BHBcNcSBT1KVOEVycb0mq635UVd9U5zQkif+Y3rkFclhQxYIqFlQZiM8vALQAPgP4AWC1+X0E4ALAFMBzAOPiCixjRfIdyX5g/h7JFyTnJYVKBGckHxQsxJBke2rBK5LF55bdal6fSnCmyO1JhlcyKrhkwbYekBySXNcUfF1L7o7k20jhhsxetxYAJk3T/Kks2EfXmkaHxkXO1MfacgCwmbPNjYsIftV1knzJDYgIfqsgkuJ7bkBE8FcFkRTr3IBzXxay9SOCjyuIFM8dEZxUECmeOyL4tIJIimluQKRRLwFcnqBRDwDMUaFRjwG8quC0zxtk5ACEL6wrksNaZiQfkvwZKRxtM08AfGDgBh2Q6wG4BfAo+sAxXB/xp+6VI3lzTMGSK3/Lgu1mt62fji1W+tH0m+R7dm9iZNVeMnjm9om0mUOs8O+zc47dz84Juh76DJG3NYEqeHLOfVnIYkEVC6pYUMWCKhZUsaCKBVUsqGJBFQuqWFDFgipO3OnEfRcn7qWCTtxTOHFP4cS9Ek7cVZy4qzhxL4ZO3AXoxF2QoxP3DifuW5y4q1hQxYIqFlSxoIoFVSyoYkEVC6pYUMWCKhZUsaCKE3c6cd/FiXupoBP3FE7cUzhxr4QTdxUn7ipO3IuhE3cBOnEX5OjEvcOJ+xYn7ioWVLGgigVV/gKEL4RSyM8Z8wAAAABJRU5ErkJggg==);
  height: 250px;
  pointer-events: none;
  transition: background 300ms;
  width: 40px;
}
.showOverlay {
  bottom: 0;
  display: flex;
  font-size: 16px;
  left: calc(50% - 55px);
  margin-bottom: 7px;
  position: absolute;
}
.check {
  bottom: 0;
  display: flex;
  left: calc(50% + 40px);
  margin-bottom: 10px;
  position: absolute;
}
.circle {
  border: 2px solid #545556;
  border-radius: 50%;
  cursor: pointer;
  height: 20px;
  position: absolute;
  transition: border-color 300ms;
  width: 20px;
}
.hidden:nth-child(1):checked ~ .highlight {
  transform: translateY(0);
}
.hidden:nth-child(3):checked ~ .highlight {
  transform: translateY(50px);
}
.hidden:nth-child(5):checked ~ .highlight {
  transform: translateY(100px);
}
.hidden:nth-child(7):checked ~ .highlight {
  transform: translateY(150px);
}
.hidden:nth-child(9):checked ~ .highlight {
  transform: translateY(200px);
}
.hidden:nth-child(1):checked + .entry .circle {
  border-color: #4D98EF;
}
.hidden:nth-child(3):checked + .entry .circle {
  border-color: #4D98EF;
}
.hidden:nth-child(5):checked + .entry .circle {
  border-color: #4D98EF;
}
.hidden:nth-child(7):checked + .entry .circle {
  border-color: #4D98EF;
}
.hidden:nth-child(9):checked + .entry .circle {
  border-color: #4D98EF;
}
.check:checked ~ .containerOuter .overlay {
  background: #ecf0f4;
}
.hidden {
  display: none;
}
.entry {
  height: 50px;
  position: absolute;
 
}
.entry:nth-child(2) {
  left: 111px;
  top: 8px;
}
.entry:nth-child(4) {
  left: 111px;
  top: 58px;
}
.entry:nth-child(6) {
  left: 111px;
  top: 108px;
}
.entry:nth-child(8) {
  left: 111px;
  top: 158px;
}
.entry:nth-child(10) {
  left: 111px;
  top: 208px;
}



</style>

</head>
<body >

<form method="post" action="Radiofetch.jsp" name="login">
<%
out.println("<div align=right><i><b>LOGINUSER ID:<b></i>:<b><i>" +email+ "</i><b></div><br>");
out.println("<div align=right><a href = index.html><b><i>SIGN OUT</i></b></a></div><br>");
%>
<div class="containerOuter" style="color: #1C2833">
<h3><br></>SELECT OPTION FOR MANIPULATION</h3><hr>
<div class="container" style="color: green">

	<input type="radio" class="hidden" id="input1" name="inputs" value="create" required>
    <label class="entry" for="input1"><div class="circle"></div><div class="entry-label">Create Survey </div></label>
    <input type="radio" class="hidden" id="input2" name="inputs" value="modify">
    <label class="entry" for="input2"><div class="circle"></div><div class="entry-label">Modify Survey</div></label>
    <input type="radio" class="hidden" id="input3" name="inputs" value="delete">
    <label class="entry" for="input3"><div class="circle"></div><div class="entry-label">Delete Survey</div></label>
    <input type="radio" class="hidden" id="input4" name="inputs" value="show">
    <label class="entry" for="input4"><div class="circle"></div><div class="entry-label">Show-Table</div></label>
    <input type="radio" class="hidden" id="input5" name="inputs" value="showresult">
    <label class="entry" for="input5"><div class="circle"></div><div class="entry-label">Show-Result</div></label>
    
     <div class="highlight"></div>
    <div class="overlay"></div>
  </div>
   <center><input type="submit" value="Submit" onclick="return validateForm"></center><br>
</div><br>
<center><a href="index.html"><input type="button" value="Go Back"></a></center><br>
</form>
<svg width="0" height="0" viewBox="0 0 40 140">
  <defs>
    <mask id="holes">
      <rect x="0" y="0" width="100" height="140" fill="white" />
      <circle r="15" cx="20" cy="20" fill="black"/>
      <circle r="12" cx="20" cy="70" fill="black"/>
      <circle r="12" cx="20" cy="120" fill="black"/>
    </mask>
  </defs>
</svg>
</body>
</html>