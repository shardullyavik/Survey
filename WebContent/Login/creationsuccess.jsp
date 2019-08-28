<html>
<head>
<title>Survey Modified</title>
<style>
body {
	margin: 0;
	padding: 0;
	background:url("uiimage.jpeg");
}

h1 {
	margin: 0;
	padding: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}

h1 span {
	color: #262626;
	background:#fff;
	border-radius:50%;
	font-size:70px;
	padding: 10px 20px;
	font-family: sans-serif;
	display: table-cell;
	box-shadow: inset 0 0 5px rgb(0, 0, 0, 0.3), 0, 5px, 0 #ccc;
	animation: animate .5s infinite;
}
@keyframes animate 
{
	0% 
	{
	transform :translateY(0px);
	box-shadow: inset 0 0 5px rgb(0, 0, 0, 0.3), 0, 5px, 0 #ccc , 0px , 15px , 5px rgba(0,0,0,0);
    }

	50%
	{
	transform:translateY(-20px);
	box-shadow: inset 0 0 5px rgb(0, 0, 0, 0.3), 0, 5px, 0 #ccc , 0px , 15px , 5px rgba(0,0,0,0);
	}

	100%
	{
	transform:translateY(0px);
	box-shadow: inset 0 0 5px rgb(0, 0, 0, 0.3), 0, 5px, 0 #ccc , 0px , 15px , 5px rgba(0,0,0,0);
	}
}
h1 span:nth-child(1) {
	animation-delay: .1s;
}

h1 span:nth-child(2) {
	animation-delay: .15s;
}

h1 span:nth-child(3) {
	animation-delay: .2s;
}

h1 span:nth-child(4) {
	animation-delay: .25s;
}

h1 span:nth-child(5) {
	animation-delay: .3s;
}

h1 span:nth-child(6) {
	animation-delay: .35s;
}

h1 span:nth-child(7) {
	animation-delay: .4s;
}
h1 span:nth-child(8) {
	animation-delay: .45s;
}
h1 span:nth-child(9) {
	animation-delay: .2s;
}

h1 span:nth-child(10) {
	animation-delay: .25s;
}

h1 span:nth-child(11) {
	animation-delay: .3s;
}

h1 span:nth-child(12) {
	animation-delay: .35s;
}

h1 span:nth-child(13) {
	animation-delay: .4s;
}
h1 span:nth-child(14) {
	animation-delay: .45s;
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
</style>
</head>
<body>
<form action="submit">
<h1>
<span><b>S</b></span>
<span><b>U</b></span>
<span><b>R</b></span>
<span><b>V</b></span>
<span><b>E</b></span>
<span><b>Y</b></span>
<br><br>
<span><b>C</b></span>
<span><b>R</b></span>
<span><b>E</b></span>
<span><b>A</b></span>
<span><b>T</b></span>
<span><b>E</b></span>
<span><b>D</b></span>
</h1>
<center><a href="selection.jsp"><input type="button" name=Submit value="Go Back" ></a></center>
</form>
</body>
</html>