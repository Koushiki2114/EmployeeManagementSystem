package com.ems.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ems.util.DBConnection;
import com.ems.util.EmailUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddTaskServlet")
public class AddTaskServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try{

            Connection con =
                    DBConnection.getConnection();

            String employeeName =
                    request.getParameter("employee_name");

            String employeeEmail = "";

            String emailQuery =
            "SELECT email FROM employees WHERE name=?";

            PreparedStatement emailPs =
                    con.prepareStatement(emailQuery);

            emailPs.setString(1,
                    employeeName);

            ResultSet rs =
                    emailPs.executeQuery();

            if(rs.next()){

                employeeEmail =
                rs.getString("email");
            }

            String query =
            "INSERT INTO employee_tasks(employee_name,task_title,task_description,deadline,status) VALUES(?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,
                    employeeName);

            ps.setString(2,
                    request.getParameter("task_title"));

            ps.setString(3,
                    request.getParameter("task_description"));

            ps.setString(4,
                    request.getParameter("deadline"));

            ps.setString(5,
                    request.getParameter("status"));

            int row =
                    ps.executeUpdate();

            if(row > 0){

                EmailUtil.sendEmail(

                        employeeEmail,

                        "New Task Assigned",

                        "Hello "
                        + employeeName

                        + ",\n\nA new task has been assigned to you.\n\n"

                        + "Task Title: "
                        + request.getParameter("task_title")

                        + "\nDeadline: "
                        + request.getParameter("deadline")

                        + "\nStatus: "
                        + request.getParameter("status")

                );

                response.sendRedirect(
                        "addTask.jsp");

            }else{

                response.getWriter().println(
                        "Task Assignment Failed");
            }

        }catch(Exception e){

            e.printStackTrace();
        }
    }
}