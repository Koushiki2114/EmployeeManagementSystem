<%

String user = (String)session.getAttribute("username");

if(user == null){

response.sendRedirect("login.jsp");
return;
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Admin Dashboard</title>

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
overflow:hidden;
}

.container{
width:800px;
padding:50px;
border-radius:25px;
background:rgba(255,255,255,0.12);
backdrop-filter:blur(12px);
box-shadow:0 10px 35px rgba(0,0,0,0.25);
text-align:center;
}

.container h1{
color:white;
font-size:42px;
margin-bottom:15px;
}

.container p{
color:#f1f1f1;
font-size:18px;
margin-bottom:35px;
}

.btn-group{
display:grid;
grid-template-columns:1fr 1fr;
gap:20px;
}

button{
padding:18px;
border:none;
border-radius:15px;
background:white;
color:#1e3c72;
font-size:16px;
font-weight:600;
cursor:pointer;
transition:0.3s;
}

button:hover{
background:#dfe9ff;
transform:translateY(-3px);
}

.full-width-btn{
grid-column:1 / span 2;
width:50%;
justify-self:center;
}

.logout-btn{
margin-top:25px;
width:100%;
background:#e63946;
color:white;
}

.logout-btn:hover{
background:#c1121f;
}

</style>

</head>

<body>

<div class="container">

<h1>Admin Dashboard</h1>

<p>

Welcome,
<%= user %>

</p>

<div class="btn-group">

<button onclick="window.location.href='addEmployee.jsp'">

Add Employee

</button>

<button onclick="window.location.href='ViewEmployeeServlet'">

Manage Employees

</button>

<button onclick="window.location.href='addTask.jsp'">

Assign Tasks

</button>

<button onclick="window.location.href='ManageTaskServlet'">

Manage Tasks

</button>

<button class="full-width-btn"
onclick="window.location.href='employeeStats.jsp'">

Employee Statistics

</button>

</div>

<button class="logout-btn"
onclick="window.location.href='LogoutServlet'">

Logout

</button>

</div>

</body>

</html>