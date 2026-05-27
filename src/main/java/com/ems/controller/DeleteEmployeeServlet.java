package com.ems.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import com.ems.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id =
                Integer.parseInt(request.getParameter("id"));

        try {

            Connection con = DBConnection.getConnection();

            String query =
                    "DELETE FROM employees WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, id);

            ps.executeUpdate();

            response.sendRedirect("ViewEmployeeServlet");

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}