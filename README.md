# Employee Management System (EMS)

A modern Employee Management System built using Java, JSP, Servlets, JDBC, MySQL, HTML, CSS, and Jakarta EE.

## Overview

This project is a full-stack Employee Management System designed to help organizations manage employees, tasks, authentication, and internal workflow operations.

The system includes:

* Admin Dashboard
* Employee Dashboard
* Employee Management
* Task Assignment System
* Task Status Management
* Email Notifications
* Login Authentication
* Employee Statistics
* Responsive UI with Glassmorphism Design

---

# Features

## Admin Features

* Add Employees
* Update Employee Details
* Delete Employees
* View Employee Records
* Assign Tasks to Employees
* Manage Assigned Tasks
* Update Task Status
* View Employee Statistics
* Send Email Notifications Automatically

## Employee Features

* Secure Login
* View Assigned Tasks
* View Profile Information
* Access Company Statistics
* Logout Functionality

---

# Technologies Used

## Backend

* Java
* JSP
* Servlets
* JDBC
* Jakarta EE

## Frontend

* HTML5
* CSS3
* JavaScript

## Database

* MySQL
* Railway Cloud MySQL

## Deployment

* Docker
* Apache Tomcat
* Render

## Email Service

* JavaMail API
* Gmail SMTP

---
# Deployment Architecture

JSP → Servlets → JDBC → Railway MySQL Database

---
# Database Tables

## users

Stores login credentials and roles.

| Column   | Type    |
| -------- | ------- |
| id       | INT     |
| username | VARCHAR |
| password | VARCHAR |
| role     | VARCHAR |

## employees

Stores employee details.

| Column     | Type    |
| ---------- | ------- |
| emp_id     | INT     |
| name       | VARCHAR |
| email      | VARCHAR |
| department | VARCHAR |
| salary     | DOUBLE  |
| phone      | VARCHAR |
| address    | VARCHAR |
| state      | VARCHAR |

## employee_tasks

Stores assigned tasks.

| Column           | Type    |
| ---------------- | ------- |
| task_id          | INT     |
| employee_name    | VARCHAR |
| task_title       | VARCHAR |
| task_description | VARCHAR |
| deadline         | VARCHAR |
| status           | VARCHAR |

---

# Setup Instructions

## 1. Clone Repository

```bash
git clone YOUR_GITHUB_REPOSITORY_LINK
```

## 2. Import Project

Import the project into:

* Eclipse IDE
* IntelliJ IDEA
* NetBeans

## 3. Configure Database

Create a MySQL database named:

```sql
CREATE DATABASE ems;
```

Run all SQL scripts for table creation.

## 4. Configure Database Connection

Edit:

```text
DBConnection.java
```

Add your:

* MySQL username
* MySQL password

## 5. Configure Email Service

Edit:

```text
EmailUtil.java
```

Add:

* Gmail address
* Gmail App Password

Enable:

* 2-Step Verification
* App Passwords in Gmail

## 6. Run on Apache Tomcat

Deploy the project using:

* Apache Tomcat 10+

---

# Email Notification Features

The system automatically sends emails when:

* Employee account is created
* Employee details are updated
* Tasks are assigned
* Tasks are updated

---

# Screens Included

* Login Page
* Admin Dashboard
* Employee Dashboard
* Add Employee Page
* Manage Employee Page
* Assign Tasks Page
* Manage Tasks Page
* Statistics Page

---

# Future Improvements

* Attendance Management
* Leave Management
* Payroll System
* File Uploads
* Profile Pictures
* Password Encryption
* PDF Report Generation
* Dark/Light Theme Toggle

---

# Author

Koushiki Bose

---

# License

This project is created for educational and learning purposes.

---

# GitHub Launch Post

## LinkedIn / GitHub Post

Today I completed a full-stack Employee Management System (EMS) project using Java, JSP, Servlets, JDBC, MySQL Docker, Railway and Render.

The system includes:

* Admin & Employee Dashboards
* Employee CRUD Operations
* Task Assignment & Management
* Login Authentication
* Employee Statistics
* Automated Email Notifications
* Modern Glassmorphism UI

Tech Stack:
Java | JSP | Servlets | JDBC | MySQL | Railway | Render | Docker | HTML | CSS | Jakarta EE

This project helped me improve my understanding of:

* Backend Development
* Database Connectivity
* Authentication Systems
* MVC Architecture
* Session Management
* Email Integration
* Docker Deployment
* Cloud Hosting
* UI Design

GitHub Repository:
https://github.com/Koushiki2114/EmployeeManagementSystem

Live Demo:
https://employeemanagementsystem-78ej.onrender.com/login.jsp
[Note: The application is hosted on Render free tier, so initial loading may take 30–60 seconds.]
