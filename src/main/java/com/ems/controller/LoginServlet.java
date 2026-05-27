package com.ems.controller;

import java.io.IOException;
import java.sql.*;

import com.ems.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");

        String password = request.getParameter("password");

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM users WHERE username=? AND password=?";

            PreparedStatement ps = con.prepareStatement(query);

            ps.setString(1, username);

            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                String role = rs.getString("role");

                HttpSession session = request.getSession();

                session.setAttribute("username", username);

                session.setAttribute("role", role);

                if(role.equals("admin")) {

                    response.sendRedirect("adminDashboard.jsp");

                } else {

                    response.sendRedirect("employeeDashboard.jsp");
                }

            } else {

            	HttpSession session =
            			request.getSession();

            			session.setAttribute(
            			"errorMessage",
            			"Invalid Username or Password!");

            			response.sendRedirect("login.jsp");
            }

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}
