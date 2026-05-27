package com.ems.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.ems.model.Employee;
import com.ems.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/MyProfileServlet")
public class MyProfileServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        try{

            HttpSession session =
                    request.getSession();

            String username =
                    (String)session.getAttribute("username");

            Connection con =
                    DBConnection.getConnection();

            String query =
            "SELECT * FROM employees WHERE name=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            Employee e = new Employee();

            if(rs.next()){

                e.setEmpId(rs.getInt("emp_id"));

                e.setName(rs.getString("name"));

                e.setEmail(rs.getString("email"));

                e.setDepartment(rs.getString("department"));

                e.setSalary(rs.getDouble("salary"));

                e.setPhone(rs.getString("phone"));

                e.setAddress(rs.getString("address"));

                e.setState(rs.getString("state"));
            }

            request.setAttribute("employee", e);

            request.getRequestDispatcher("myProfile.jsp")
                    .forward(request,response);

        }catch(Exception e){

            e.printStackTrace();
        }
    }
}