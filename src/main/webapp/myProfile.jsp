<%@ page import="com.ems.model.Employee" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>

<%

Employee e =
(Employee)request.getAttribute("employee");

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

<title>My Profile</title>

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
    padding:25px;
    color:white;
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
    max-width:700px;
    margin:auto;

    padding:28px;

    border-radius:24px;

    background:rgba(255,255,255,0.12);
    backdrop-filter:blur(12px);

    box-shadow:0 10px 30px rgba(0,0,0,0.22);
}

/* HEADING */

h1{
    text-align:center;

    margin-bottom:24px;

    font-size:38px;
    font-weight:700;

    color:white;
}

/* PROFILE BOX */

.profile-box{
    background:white;

    color:#1e3c72;

    padding:16px 20px;

    border-radius:18px;

    margin-bottom:14px;

    font-size:16px;
    font-weight:600;

    line-height:1.5;

    box-shadow:0 4px 12px rgba(0,0,0,0.10);

    transition:0.3s;
}

.profile-box:hover{
    transform:translateY(-2px);
}

/* LABEL */

.label{
    font-weight:700;
}

/* RESPONSIVE */

@media(max-width:900px){

    .container{
        padding:22px;
    }

    h1{
        font-size:32px;
    }

    .profile-box{
        font-size:15px;
        padding:14px 16px;
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

<div class="container">

<h1>My Profile</h1>

<!-- PROFILE DETAILS -->

<div class="profile-box">

<span class="label">Name :</span>
<%= e.getName() %>

</div>

<div class="profile-box">

<span class="label">Email :</span>
<%= e.getEmail() %>

</div>

<div class="profile-box">

<span class="label">Department :</span>
<%= e.getDepartment() %>

</div>

<%
// Custom independent function to format numbers into Lakhs / Crores without relying on Java's flaky locale support
long salaryAmt = (long) e.getSalary(); 
String salaryStr = String.valueOf(salaryAmt);

String indianSalary = "";
if (salaryStr.length() <= 3) {
    indianSalary = salaryStr;
} else {
    // Isolate the hundreds/tens/ones place
    String lastThree = salaryStr.substring(salaryStr.length() - 3);
    String remaining = salaryStr.substring(0, salaryStr.length() - 3);
    
    // Group the preceding digits into pairs of two
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

<div class="profile-box">

<span class="label">Salary :</span>
Rs <%= indianSalary %>

</div>
<div class="profile-box">

<span class="label">Phone :</span>
<%= e.getPhone() %>

</div>

<div class="profile-box">

<span class="label">Address :</span>
<%= e.getAddress() %>

</div>

<div class="profile-box">

<span class="label">State :</span>
<%= e.getState() %>

</div>

</div>

</body>

</html>