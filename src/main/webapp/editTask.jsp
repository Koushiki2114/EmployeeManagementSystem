<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Edit Task</title>

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
}

.container{
width:550px;
padding:40px;
border-radius:25px;
background:rgba(255,255,255,0.12);
backdrop-filter:blur(12px);
box-shadow:0 10px 35px rgba(0,0,0,0.25);
}

.container h1{
color:white;
text-align:center;
margin-bottom:30px;
font-size:38px;
}

input,
textarea,
select{
width:100%;
padding:15px;
border:none;
outline:none;
border-radius:12px;
font-size:15px;
margin-bottom:20px;
background:rgba(255,255,255,0.9);
}

textarea{
height:120px;
resize:none;
}

button{
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

button:hover{
background:#c1121f;
}

.back-btn{
position:absolute;
top:25px;
left:25px;

width:auto;
padding:12px 24px;

border:none;
border-radius:30px;

background:rgba(255,255,255,0.2);
backdrop-filter:blur(10px);

color:white;
font-weight:600;
font-size:15px;

cursor:pointer;
border:1px solid rgba(255,255,255,0.2);
}

.back-btn:hover{
background:white;
color:#1e3c72;
}

</style>

</head>

<body>

<button class="back-btn"
onclick="window.location.href='ManageTaskServlet'">

  BACK HOME

</button>

<div class="container">

<h1>Update Task</h1>

<form action="UpdateTaskServlet" method="post">

<input type="hidden"
name="taskId"
value="<%= request.getParameter("taskId") %>">

<input type="text"
name="employeeName"
value="<%= request.getParameter("employeeName") %>"
readonly>

<input type="text"
name="taskTitle"
value="<%= request.getParameter("taskTitle") %>"
required>

<textarea
name="taskDescription"
required><%= request.getParameter("taskDescription") %></textarea>

<input type="date"
name="deadline"
value="<%= request.getParameter("deadline") %>"
required>

<select name="status">

<option value="Pending">

Pending

</option>

<option value="Completed">

Completed

</option>

</select>

<button type="submit">

Update Task

</button>

</form>

</div>

</body>

</html>