<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ems.util.DBConnection" %>

<%

int totalEmployees = 0;

Map<String,Integer> departmentStats =
new LinkedHashMap<String,Integer>();

Map<String,Integer> stateStats =
new LinkedHashMap<String,Integer>();

try{

    Connection con = DBConnection.getConnection();

    PreparedStatement ps1 =
    con.prepareStatement(
    "SELECT COUNT(*) FROM employees"
    );

    ResultSet rs1 = ps1.executeQuery();

    if(rs1.next()){

        totalEmployees = rs1.getInt(1);
    }

    PreparedStatement ps2 =
    con.prepareStatement(
    "SELECT department, COUNT(*) total FROM employees GROUP BY department"
    );

    ResultSet rs2 = ps2.executeQuery();

    while(rs2.next()){

        departmentStats.put(
        rs2.getString("department"),
        rs2.getInt("total")
        );
    }

    PreparedStatement ps3 =
    con.prepareStatement(
    "SELECT state, COUNT(*) total FROM employees GROUP BY state"
    );

    ResultSet rs3 = ps3.executeQuery();

    while(rs3.next()){

        stateStats.put(
        rs3.getString("state"),
        rs3.getInt("total")
        );
    }

}catch(Exception e){

    e.printStackTrace();
}

%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Employee Statistics</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
    color:white;
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

    margin:55px auto 0;

    background:rgba(255,255,255,0.10);
    backdrop-filter:blur(12px);

    padding:30px;

    border-radius:26px;

    box-shadow:0 10px 35px rgba(0,0,0,0.25);
}

/* PAGE HEADING */

h1{
    text-align:center;

    margin-bottom:24px;

    font-size:38px;
    font-weight:700;

    color:white;
}

/* TOTAL CARD */

.total-card{
    background:white;

    color:#1e3c72;

    padding:22px;

    border-radius:22px;

    margin-bottom:26px;

    text-align:center;

    box-shadow:0 4px 14px rgba(0,0,0,0.10);
}

.total-card h2{
    margin-bottom:10px;

    font-size:24px;

    font-weight:700;
}

.total-number{
    font-size:52px;

    font-weight:700;

    line-height:1;
}

/* CHART SECTION */

.chart-container{
    display:grid;

    grid-template-columns:1fr 1fr;

    gap:24px;
}

/* CHART CARDS */

.chart-card{
    background:white;

    padding:24px;

    border-radius:22px;

    box-shadow:0 4px 14px rgba(0,0,0,0.10);

    min-height:420px;
}

.chart-card h2{
    text-align:center;

    color:#1e3c72;

    margin-bottom:18px;

    font-size:24px;

    font-weight:700;
}

/* CHART SIZE */

canvas{
    width:100% !important;

    height:300px !important;
}

/* RESPONSIVE */

@media(max-width:1000px){

    .chart-container{
        grid-template-columns:1fr;
    }

    .container{
        padding:22px;
    }

    h1{
        font-size:32px;
    }

    .chart-card{
        min-height:auto;
    }

    .chart-card h2{
        font-size:22px;
    }

    .total-card h2{
        font-size:22px;
    }

    .total-number{
        font-size:44px;
    }

    canvas{
        height:280px !important;
    }

    .back-btn{
        padding:12px 24px;
        font-size:14px;
    }
}

</style>

</head>

<body>

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

<!-- BACK BUTTON -->

<button class="back-btn"
onclick="window.location.href='<%= dashboard %>'">

BACK HOME

</button>

<!-- MAIN CONTAINER -->

<div class="container">

<h1>Employee Statistics</h1>

<!-- TOTAL EMPLOYEES -->

<div class="total-card">

    <h2>Total Employees</h2>

    <div class="total-number">

        <%= totalEmployees %>

    </div>

</div>

<!-- CHART SECTION -->

<div class="chart-container">

    <!-- DEPARTMENT CHART -->

    <div class="chart-card">

        <h2>Employees by Department</h2>

        <canvas id="departmentChart"></canvas>

    </div>

    <!-- STATE CHART -->

    <div class="chart-card">

        <h2>Employees by State</h2>

        <canvas id="stateChart"></canvas>

    </div>

</div>

</div>

<script>

/* =========================
   DEPARTMENT DATA
========================= */

const departmentLabels = [

<%

for(String dept : departmentStats.keySet()){

%>

"<%= dept %>",

<%
}
%>

];

const departmentData = [

<%

for(Integer count : departmentStats.values()){

%>

<%= count %>,

<%
}
%>

];


/* =========================
   STATE DATA
========================= */

const stateLabels = [

<%

for(String state : stateStats.keySet()){

%>

"<%= state %>",

<%
}
%>

];

const stateData = [

<%

for(Integer count : stateStats.values()){

%>

<%= count %>,

<%
}
%>

];


/* =========================
   DEPARTMENT BAR CHART
========================= */

new Chart(

document.getElementById('departmentChart'),

{
    type:'bar',

    data:{

        labels:departmentLabels,

        datasets:[{

            label:'Employees',

            data:departmentData,

            backgroundColor:[
                '#ff6b6b',
                '#4ecdc4',
                '#ffd93d',
                '#1a73e8',
                '#6c5ce7',
                '#00b894',
                '#fd79a8',
                '#e17055',
                '#0984e3',
                '#2d3436'
            ],

            borderRadius:12,
            borderSkipped:false
        }]
    },

    options:{

        responsive:true,

        maintainAspectRatio:false,

        plugins:{

            legend:{
                display:false
            }
        },

        scales:{

            y:{

                beginAtZero:true,

                ticks:{
                    color:'#1e293b',
                    font:{
                        size:14,
                        weight:'bold'
                    }
                },

                grid:{
                    color:'rgba(0,0,0,0.08)'
                }
            },

            x:{

                ticks:{
                    color:'#1e293b',
                    font:{
                        size:14,
                        weight:'bold'
                    }
                },

                grid:{
                    display:false
                }
            }
        }
    }
});


/* =========================
   STATE DOUGHNUT CHART
========================= */

new Chart(

document.getElementById('stateChart'),

{
    type:'doughnut',

    data:{

        labels:stateLabels,

        datasets:[{

            data:stateData,

            backgroundColor:[
                '#ff7675',
                '#74b9ff',
                '#55efc4',
                '#ffeaa7',
                '#a29bfe',
                '#fd79a8',
                '#fab1a0',
                '#00cec9',
                '#e17055',
                '#636e72'
            ],

            borderWidth:3,
            hoverOffset:8
        }]
    },

    options:{

        responsive:true,

        maintainAspectRatio:false,

        plugins:{

            legend:{

                position:'bottom',

                labels:{

                    color:'#1e293b',

                    font:{
                        size:14,
                        weight:'bold'
                    },

                    padding:20
                }
            }
        },

        cutout:'72%'
    }
});

</script>

</body>

</html>