<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Employee Management System Login</title>

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
width:520px;
padding:55px 50px;
border-radius:22px;
background:rgba(255,255,255,0.12);
backdrop-filter:blur(12px);
box-shadow:0 10px 35px rgba(0,0,0,0.25);
border:1px solid rgba(255,255,255,0.15);
}

.container h1{
text-align:center;
color:white;
margin-bottom:10px;
font-size:42px;
}

.subtitle{
text-align:center;
color:#d1d5db;
margin-bottom:30px;
font-size:18px;
}

.input-box{
margin-bottom:20px;
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

<div class="container">

<h1>Welcome to Employee Management System</h1>

<p class="subtitle">

Sign in to EMS Portal

</p>

<form action="LoginServlet" method="post">

<div class="input-box">

<input type="text"
name="username"
placeholder="Enter Username"
required>

</div>

<div class="input-box">

<input type="password"
name="password"
placeholder="Enter Password"
required>

</div>

<button type="submit"
class="submit-btn">

Login

</button>

</form>

</div>

</body>

</html>