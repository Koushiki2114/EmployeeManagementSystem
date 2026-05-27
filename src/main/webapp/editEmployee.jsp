<%@ page import="com.ems.model.Employee" %>

<%

Employee e = (Employee)request.getAttribute("employee");

if(e == null){

response.sendRedirect("ViewEmployeeServlet");
return;
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Employee</title>

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
}

.top-bar{
position:absolute;
top:20px;
left:20px;
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

</style>

</head>

<body>

<div class="top-bar">

<button class="back-home-btn"
onclick="window.location.href='adminDashboard.jsp'">

 BACK HOME

</button>

</div>

<div class="container">

<h2>Edit Employee</h2>

<form action="UpdateEmployeeServlet" method="post">

<input type="hidden"
name="id"
value="<%= e.getEmpId() %>">

<div class="input-box">

<input type="text"
name="name"
value="<%= e.getName() %>"
required>

</div>

<div class="input-box">

<input type="email"
name="email"
value="<%= e.getEmail() %>"
required>

</div>

<div class="input-box">

<input type="text"
name="department"
value="<%= e.getDepartment() %>"
required>

</div>

<div class="input-box">

<input type="number"
name="salary"
value="<%= e.getSalary() %>"
required>

</div>

<div class="input-box">

<input type="text"
name="phone"
value="<%= e.getPhone() %>"
required>

</div>

<div class="input-box">

<input type="text"
name="address"
value="<%= e.getAddress() %>"
required>

</div>

<div class="input-box">

<input type="text"
name="state"
value="<%= e.getState() %>"
required>

</div>

<button type="submit"
class="submit-btn">

Update Employee

</button>

</form>

</div>

</body>

</html>