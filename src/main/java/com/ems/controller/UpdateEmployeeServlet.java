package com.ems.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ems.util.DBConnection;
import com.ems.util.EmailUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Connection con =
                    DBConnection.getConnection();

            String query =
            "UPDATE employees SET name=?,email=?,department=?,salary=?,phone=?,address=?,state=? WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,
                    request.getParameter("name"));

            ps.setString(2,
                    request.getParameter("email"));

            ps.setString(3,
                    request.getParameter("department"));

            ps.setDouble(4,
                    Double.parseDouble(
                    request.getParameter("salary")));

            ps.setString(5,
                    request.getParameter("phone"));

            ps.setString(6,
                    request.getParameter("address"));

            ps.setString(7,
                    request.getParameter("state"));

            ps.setInt(8,
                    Integer.parseInt(
                    request.getParameter("id")));

            int row =
                    ps.executeUpdate();

            if(row > 0){

                EmailUtil.sendEmail(

                    request.getParameter("email"),

                    "Employee Details Updated",

                    "Hello "
                    + request.getParameter("name")

                    + ",\n\nYour employee profile details "
                    + "have been updated successfully."

                );

                response.sendRedirect(
                        "ViewEmployeeServlet");

            }else{

                response.getWriter().println(
                        "Employee Update Failed");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}