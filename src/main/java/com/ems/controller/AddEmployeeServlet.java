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

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            Connection con =
                    DBConnection.getConnection();

            String email =
                    request.getParameter("email");

            String phone =
                    request.getParameter("phone");

            String checkQuery =
            "SELECT * FROM employees WHERE email=? OR phone=?";

            PreparedStatement checkPs =
                    con.prepareStatement(checkQuery);

            checkPs.setString(1, email);

            checkPs.setString(2, phone);

            ResultSet rs =
                    checkPs.executeQuery();

            if(rs.next()){

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "errorMessage",
                        "Employee Already Exists!");

                response.sendRedirect(
                        "addEmployee.jsp");

                return;
            }

            String query =
            "INSERT INTO employees(name,email,department,salary,phone,address,state)"
            + " VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1,
                    request.getParameter("name"));

            ps.setString(2,
                    email);

            ps.setString(3,
                    request.getParameter("department"));

            ps.setDouble(4,
                    Double.parseDouble(
                    request.getParameter("salary")));

            ps.setString(5,
                    phone);

            ps.setString(6,
                    request.getParameter("address"));

            ps.setString(7,
                    request.getParameter("state"));

            int row =
                    ps.executeUpdate();

            if(row > 0){

                String chars =
                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789@#";

                StringBuilder passwordBuilder =
                        new StringBuilder();

                for(int i=0; i<8; i++){

                    int index =
                    (int)(Math.random()
                    * chars.length());

                    passwordBuilder.append(
                            chars.charAt(index));
                }

                String defaultPassword =
                        passwordBuilder.toString();

                String userQuery =
                "INSERT INTO users(username,password,role) VALUES(?,?,?)";

                PreparedStatement userPs =
                        con.prepareStatement(userQuery);

                userPs.setString(1,
                        request.getParameter("name"));

                userPs.setString(2,
                        defaultPassword);

                userPs.setString(3,
                        "employee");

                userPs.executeUpdate();

                try {

                    EmailUtil.sendEmail(

                            email,

                            "Employee Record Created",

                            "Welcome to Employee Management System\n\n"

                            + "Username: "
                            + request.getParameter("name")

                            + "\nPassword: "
                            + defaultPassword
                    );

                } catch(Exception mailException){

                    mailException.printStackTrace();
                }

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "successMessage",
                        "Employee Added Successfully!");

                response.sendRedirect(
                        "addEmployee.jsp");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
