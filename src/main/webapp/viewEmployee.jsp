<%@ page import="java.util.*" %>
<%@ page import="com.ems.model.Employee" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>View Employees</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:'Segoe UI',sans-serif;
}

body{
background:linear-gradient(135deg,#1e3c72,#2a5298);
min-height:100vh;
padding:40px;
}

.top-bar{
margin-bottom:20px;
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
border:1px solid rgba(255,255,255,0.2);
transition:0.3s;
}

.back-home-btn:hover{
background:white;
color:#1e3c72;
}

.container{
background:rgba(255,255,255,0.12);
backdrop-filter:blur(12px);
padding:35px;
border-radius:22px;
box-shadow:0 10px 35px rgba(0,0,0,0.25);
}

h2{
color:white;
margin-bottom:25px;
font-size:35px;
}

table{
width:100%;
border-collapse:collapse;
overflow:hidden;
border-radius:15px;
background:white;
}

th{
background:#1e3c72;
color:white;
padding:16px;
}

td{
padding:14px;
text-align:center;
border-bottom:1px solid #ddd;
}

tr:hover{
background:#f5f5f5;
}

.edit-btn{
background:#28a745;
}

.delete-btn{
background:#dc3545;
}

.action-btn{
padding:10px 16px;
border:none;
border-radius:8px;
color:white;
cursor:pointer;
font-weight:600;
}

.pagination{
margin-top:25px;
text-align:center;
}

.pagination a{
padding:10px 15px;
background:white;
color:#1e3c72;
text-decoration:none;
margin:5px;
border-radius:8px;
font-weight:600;
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

<h2>Employee Records</h2>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Email</th>
<th>Department</th>
<th>Salary (in Rs)</th>
<th>Phone</th>
<th>Address</th>
<th>State</th>
<th>Edit</th>
<th>Delete</th>

</tr>

<%

Object obj = request.getAttribute("employeeList");

List<Employee> list = new ArrayList<Employee>();

if(obj instanceof List<?>){

    for(Object o : (List<?>)obj){

        if(o instanceof Employee){

            list.add((Employee)o);
        }
    }
}

for(Employee e : list){
    
    // Formatting the current loop item's salary to Indian Standard
    long salaryAmt = (long) e.getSalary(); 
    String salaryStr = String.valueOf(salaryAmt);
    String indianSalary = "";
    
    if (salaryStr.length() <= 3) {
        indianSalary = salaryStr;
    } else {
        String lastThree = salaryStr.substring(salaryStr.length() - 3);
        String remaining = salaryStr.substring(0, salaryStr.length() - 3);
        
        StringBuilder structuredRemaining = new StringBuilder();
        int count = 0;
        for (int i = remaining.length() - 1; i >= 0; i--) {
            if (count == 2) {
                structuredRemaining.insert(0, ",");
                count = 0;
            }
            structuredRemaining.insert(0, remaining.charAt(i));
            count++;
        }
        indianSalary = structuredRemaining.toString() + "," + lastThree;
    }

%>

<tr>

<td><%= e.getEmpId() %></td>
<td><%= e.getName() %></td>
<td><%= e.getEmail() %></td>
<td><%= e.getDepartment() %></td>
<td><%= indianSalary %></td>
<td><%= e.getPhone() %></td>
<td><%= e.getAddress() %></td>
<td><%= e.getState() %></td>

<td>

<a href="EditEmployeeServlet?id=<%= e.getEmpId() %>">

<button class="action-btn edit-btn">

Edit

</button>

</a>

</td>

<td>

<a href="DeleteEmployeeServlet?id=<%= e.getEmpId() %>">

<button class="action-btn delete-btn">

Delete

</button>

</a>

</td>

</tr>

<%
}
%>

</table>

<div class="pagination">

<a href="ViewEmployeeServlet?page=1">1</a>
<a href="ViewEmployeeServlet?page=2">2</a>
<a href="ViewEmployeeServlet?page=3">3</a>

</div>

</div>

</body>

</html>