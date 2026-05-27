<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Task" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Manage Tasks</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
    font-family:'Segoe UI',sans-serif;
}

body{
    background:linear-gradient(135deg,#1e3c72,#2a5298);
    padding:25px;
    min-height:100vh;
}

/* BACK BUTTON */

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

/* MAIN CONTAINER */

.container{
    max-width:1300px;

    margin:70px auto 0;

    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(12px);

    padding:32px;

    border-radius:26px;

    box-shadow:0 10px 35px rgba(0,0,0,0.25);
}

/* HEADING */

h1{
    color:white;

    margin-bottom:28px;

    font-size:40px;
    font-weight:700;

    text-align:center;
}

/* TABLE */

table{
    width:100%;

    border-collapse:collapse;

    background:white;

    border-radius:18px;

    overflow:hidden;
}

/* TABLE HEADER */

th{
    background:#1e3c72;

    color:white;

    padding:16px;

    font-size:16px;
}

/* TABLE DATA */

td{
    padding:15px;

    text-align:center;

    border-bottom:1px solid #e5e7eb;

    font-size:15px;

    color:#1e293b;

    transition:0.3s;
}

/* ROW HOVER */

tr{
    transition:0.3s;
}

tr:hover{
    background:#f5f7ff;

    transform:scale(1.002);
}

/* EDIT BUTTON */

.edit-btn{
    padding:10px 18px;

    background:#e63946;

    color:white;

    border:none;

    border-radius:10px;

    cursor:pointer;

    font-weight:700;

    transition:0.3s;
}

.edit-btn:hover{
    background:#c1121f;

    transform:translateY(-2px);
}

/* RESPONSIVE */

@media(max-width:1000px){

    .container{
        padding:22px;
    }

    h1{
        font-size:32px;
    }

    th,
    td{
        font-size:14px;
        padding:12px;
    }

    .back-btn{
        padding:12px 24px;
        font-size:14px;
    }
}

</style>

</head>

<body>

<button class="back-btn"
onclick="window.location.href='adminDashboard.jsp'">

 BACK HOME

</button>

<div class="container">

<h1>Manage Tasks</h1>

<table>

<tr>

<th>ID</th>
<th>Employee</th>
<th>Task Title</th>
<th>Description</th>
<th>Deadline</th>
<th>Status</th>
<th>Edit</th>

</tr>

<%

Object obj =
request.getAttribute("taskList");

List<Task> list =
new ArrayList<Task>();

if(obj instanceof List<?>){

    for(Object o : (List<?>)obj){

        if(o instanceof Task){

            list.add((Task)o);
        }
    }
}

for(Task t : list){

%>

<tr>

<td><%= t.getTaskId() %></td>

<td><%= t.getEmployeeName() %></td>

<td><%= t.getTaskTitle() %></td>

<td><%= t.getTaskDescription() %></td>

<td><%= t.getDeadline() %></td>

<td><%= t.getStatus() %></td>

<td>

<form action="editTask.jsp" method="post">

<input type="hidden"
name="taskId"
value="<%= t.getTaskId() %>">

<input type="hidden"
name="employeeName"
value="<%= t.getEmployeeName() %>">

<input type="hidden"
name="taskTitle"
value="<%= t.getTaskTitle() %>">

<input type="hidden"
name="taskDescription"
value="<%= t.getTaskDescription() %>">

<input type="hidden"
name="deadline"
value="<%= t.getDeadline() %>">

<input type="hidden"
name="status"
value="<%= t.getStatus() %>">

<button class="edit-btn">

Edit

</button>

</form>

</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>