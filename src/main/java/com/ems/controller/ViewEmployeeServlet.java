package com.ems.controller;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import com.ems.model.Employee;
import com.ems.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewEmployeeServlet")
public class ViewEmployeeServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        ArrayList<Employee> list = new ArrayList<>();

        try {

            int page = 1;

            int recordsPerPage = 5;

            if(request.getParameter("page") != null){

                page = Integer.parseInt(
                        request.getParameter("page"));
            }

            int start = (page - 1) * recordsPerPage;

            String sort = request.getParameter("sort");

            if(sort == null){

                sort = "emp_id";
            }

            if(!(sort.equals("name") ||
                    sort.equals("department") ||
                    sort.equals("salary"))){

                sort = "emp_id";
            }

            Connection con = DBConnection.getConnection();

            String query =
                    "SELECT * FROM employees ORDER BY "
                            + sort +
                            " LIMIT ?,?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setInt(1, start);

            ps.setInt(2, recordsPerPage);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Employee e = new Employee();

                e.setEmpId(rs.getInt("emp_id"));

                e.setName(rs.getString("name"));

                e.setEmail(rs.getString("email"));

                e.setDepartment(rs.getString("department"));

                e.setSalary(rs.getDouble("salary"));

                e.setPhone(rs.getString("phone"));

                e.setAddress(rs.getString("address"));
                
                e.setState(rs.getString("state"));

                list.add(e);
            }

            request.setAttribute("employeeList", list);

            request.getRequestDispatcher("viewEmployee.jsp")
                    .forward(request,response);

        } catch(Exception e) {

            e.printStackTrace();
        }
    }
}