package com.ems.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ems.model.Task;
import com.ems.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewTaskServlet")
public class ViewTaskServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        List<Task> taskList =
                new ArrayList<Task>();

        try{

            HttpSession session =
                    request.getSession();

            String username =
                    (String)session.getAttribute("username");

            Connection con =
                    DBConnection.getConnection();

            String query =
            "SELECT * FROM employee_tasks WHERE employee_name=?";

            PreparedStatement ps =
                    con.prepareStatement(query);

            ps.setString(1, username);

            ResultSet rs = ps.executeQuery();

            while(rs.next()){

                Task t = new Task();

                t.setTaskId(
                        rs.getInt("task_id"));

                t.setEmployeeName(
                        rs.getString("employee_name"));

                t.setTaskTitle(
                        rs.getString("task_title"));

                t.setTaskDescription(
                        rs.getString("task_description"));

                t.setDeadline(
                        rs.getString("deadline"));

                t.setStatus(
                        rs.getString("status"));

                taskList.add(t);
            }

            request.setAttribute(
                    "taskList",
                    taskList);

            request.getRequestDispatcher(
                    "viewTask.jsp")
                    .forward(request,response);

        }catch(Exception e){

            e.printStackTrace();
        }
    }
}