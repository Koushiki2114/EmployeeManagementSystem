<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Employees</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
height:100vh;
display:flex;
justify-content:center;
align-items:center;
background:linear-gradient(135deg,#1e3c72,#2a5298);
position:relative;
overflow:hidden;
}

.top-bar{
position:absolute;
top:20px;
left:20px;
z-index:1000;
}

.back-home-btn{
padding:12px 22px;
border:none;
border-radius:30px;
background:rgba(255,255,255,0.2);
backdrop-filter:blur(10px);
color:white;
font-size:15px;
font-weight:600;
cursor:pointer;
transition:0.3s;
border:1px solid rgba(255,255,255,0.2);
}

.back-home-btn:hover{
background:white;
color:#1e3c72;
}

.container{
width:500px;
padding:40px;
border-radius:22px;
background:rgba(255,255,255,0.12);
backdrop-filter:blur(12px);
box-shadow:0 10px 35px rgba(0,0,0,0.25);

position:relative;
z-index:1;
}

.container h2{
text-align:center;
color:white;
margin-bottom:30px;
font-size:36px;
}

.input-box{
margin-bottom:18px;
}

.input-box input{
width:100%;
padding:15px;
border:none;
border-radius:12px;
outline:none;
font-size:15px;
background:rgba(255,255,255,0.9);
}

.submit-btn{
width:100%;
padding:15px;
border:none;
border-radius:12px;
background:#e63946;
color:white;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:0.3s;
}

.submit-btn:hover{
background:#c1121f;
transform:translateY(-2px);
}

.error-msg,
.success-msg{

position:fixed;

top:30px;
left:50%;

transform:translateX(-50%);

padding:15px 28px;

font-size:15px;
font-weight:600;

color:white;

border-radius:12px;

box-shadow:0 6px 18px rgba(0,0,0,0.3);

z-index:999999;

animation:fadeOut 4s forwards;

}

.error-msg{
background:#e63946;
}

.success-msg{
background:#4CAF50;
}

@keyframes fadeOut{

0%{
opacity:1;
}

80%{
opacity:1;
}

100%{
opacity:0;
}

}

</style>

</head>

<body>

<%

String errorMessage =
(String)session.getAttribute(
        "errorMessage");

if(errorMessage != null){

%>

<div class="error-msg">

<%= errorMessage %>

</div>

<%

session.removeAttribute(
        "errorMessage");

}

String successMessage =
(String)session.getAttribute(
        "successMessage");

if(successMessage != null){

%>

<div class="success-msg">

<%= successMessage %>

</div>

<%

session.removeAttribute(
        "successMessage");

}

%>

<div class="top-bar">

<button class="back-home-btn"
onclick="window.location.href='adminDashboard.jsp'">

BACK HOME

</button>

</div>

<div class="container">

<h2>Add Employee</h2>

<form action="AddEmployeeServlet"
method="post">

<div class="input-box">

<input type="text"
name="name"
placeholder="Enter Name"
required>

</div>

<div class="input-box">

<input type="email"
name="email"
placeholder="Enter Email"
required>

</div>

<div class="input-box">

<input type="text"
name="department"
placeholder="Enter Department"
required>

</div>

<div class="input-box">

<input type="number"
name="salary"
placeholder="Enter Salary"
required>

</div>

<div class="input-box">

<input type="text"
name="phone"
placeholder="Enter Phone Number"
required>

</div>

<div class="input-box">

<input type="text"
name="address"
placeholder="Enter Address"
required>

</div>

<div class="input-box">

<input type="text"
name="state"
placeholder="Enter State"
required>

</div>

<button type="submit"
class="submit-btn">

Add Employee

</button>

</form>

</div>

</body>

</html>