package com.ems.controller;

import java.io.IOException;
import java.sql.*;

import com.ems.model.Employee;
import com.ems.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EditEmployeeServlet")
public class EditEmployeeServlet extends HttpServlet {

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
                    "SELECT * FROM employees WHERE emp_id=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            Employee e = new Employee();

            if(rs.next()) {

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

            request.getRequestDispatcher("editEmployee.jsp")
                    .forward(request,response);

        } catch(Exception ex) {

            ex.printStackTrace();
        }
    }
}