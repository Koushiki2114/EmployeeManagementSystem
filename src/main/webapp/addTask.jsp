<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Assign Tasks</title>

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

.input-box{
margin-bottom:20px;
}

.input-box input,
.input-box textarea,
.input-box select{

width:100%;
padding:15px;
border:none;
outline:none;
border-radius:12px;
font-size:15px;
background:rgba(255,255,255,0.9);
}

textarea{
resize:none;
height:120px;
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

button:hover{
background:#dfe9ff;
transform:translateY(-2px);
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
transition:0.3s;

border:1px solid rgba(255,255,255,0.2);
}

.back-btn:hover{
background:white;
color:#1e3c72;
transform:translateY(-2px);
}

</style>

</head>

<body>

<button class="back-btn"
onclick="window.location.href='adminDashboard.jsp'">

 BACK HOME

</button>

<div class="container">

<h1>Assign Tasks</h1>

<form action="AddTaskServlet" method="post">

<div class="input-box">

<input type="text"
name="employee_name"
placeholder="Enter Employee Username"
required>

</div>

<div class="input-box">

<input type="text"
name="task_title"
placeholder="Enter Task Title"
required>

</div>

<div class="input-box">

<textarea
name="task_description"
placeholder="Enter Task Description"
required></textarea>

</div>

<div class="input-box">

<label style="
color:white;
font-size:15px;
font-weight:600;
margin-bottom:8px;
display:block;
">

Deadline

</label>

<input type="date"
name="deadline"
required>

</div>

<div class="input-box">

<select name="status">

<option value="Pending">

Pending

</option>

<option value="Completed">

Completed

</option>

</select>

</div>

<button type="submit"
class="submit-btn">

Assign Task

</button>

</form>

</div>

</body>

</html>