<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Task" %>

<%

String role =
(String)session.getAttribute("role");

String dashboard = "";

if(role.equals("admin")){

    dashboard = "adminDashboard.jsp";

}else{

    dashboard = "employeeDashboard.jsp";
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Assigned Tasks</title>

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

    margin-bottom:24px;

    font-size:38px;
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

th{
    background:#1e3c72;

    color:white;

    padding:14px;

    font-size:16px;
}

td{
    padding:14px;

    text-align:center;

    border-bottom:1px solid #ddd;

    font-size:15px;

    color:#1e293b;
}

tr:hover{
    background:#f5f7ff;
}

/* STATUS */

.pending{
    color:#ff9800;
    font-weight:bold;
}

.completed{
    color:green;
    font-weight:bold;
}

/* RESPONSIVE */

@media(max-width:900px){

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
        padding:12px 22px;
        font-size:14px;
    }
}

</style>

</head>

<body>

<!-- BACK BUTTON -->

<button class="back-btn"
onclick="window.location.href='<%= dashboard %>'">

BACK HOME

</button>

<!-- MAIN CONTAINER -->

<div class="container"
style="margin-top:75px;">

<h1>Assigned Tasks</h1>

<table>

<tr>

<th>Task ID</th>
<th>Task Title</th>
<th>Description</th>
<th>Deadline</th>
<th>Status</th>

</tr>

<%

Object obj = request.getAttribute("taskList");

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

<td><%= t.getTaskTitle() %></td>

<td><%= t.getTaskDescription() %></td>

<td><%= t.getDeadline() %></td>

<td>

<span class="<%= t.getStatus().equalsIgnoreCase("Completed")
? "completed" : "pending" %>">

<%= t.getStatus() %>

</span>

</td>

</tr>

<%
}
%>

</table>

</div>

</body>

</html>