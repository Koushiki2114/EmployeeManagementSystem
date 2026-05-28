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

@WebServlet("/UpdateTaskServlet")
public class UpdateTaskServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try{

            Connection con =
                    DBConnection.getConnection();

            String query =
            "UPDATE employee_tasks SET task_title=?,task_description=?,deadline=?,status=? WHERE task_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,
                    request.getParameter("taskTitle"));

            ps.setString(2,
                    request.getParameter("taskDescription"));

            ps.setString(3,
                    request.getParameter("deadline"));

            ps.setString(4,
                    request.getParameter("status"));

            ps.setInt(5,
                    Integer.parseInt(
                    request.getParameter("taskId")));

            int row =
                    ps.executeUpdate();

            String employeeEmail = "";

            String emailQuery =
            "SELECT email FROM employees WHERE name=?";

            PreparedStatement emailPs =
                    con.prepareStatement(emailQuery);

            emailPs.setString(1,
                    request.getParameter("employeeName"));

            ResultSet rs =
                    emailPs.executeQuery();

            if(rs.next()){

                employeeEmail =
                rs.getString("email");
            }

            if(row > 0){

                try {

                    EmailUtil.sendEmail(

                        employeeEmail,

                        "Task Updated",

                        "Hello "
                        + request.getParameter("employeeName")

                        + ",\n\nYour assigned task has been updated.\n\n"

                        + "Task Title: "
                        + request.getParameter("taskTitle")

                        + "\nTask Description: "
                        + request.getParameter("taskDescription")

                        + "\nDeadline: "
                        + request.getParameter("deadline")

                        + "\nStatus: "
                        + request.getParameter("status")

                    );

                } catch(Exception mailException){

                    mailException.printStackTrace();
                }

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "successMessage",
                        "Task Updated Successfully!");

                response.sendRedirect(
                        "ManageTaskServlet");

            }else{

                response.getWriter().println(
                        "Task Update Failed");
            }

        }catch(Exception e){

            e.printStackTrace();
        }
    }
}
