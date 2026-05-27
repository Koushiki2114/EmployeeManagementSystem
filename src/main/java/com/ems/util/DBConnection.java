package com.ems.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection getConnection() {

        Connection con = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(

                "jdbc:mysql://kodama.proxy.rlwy.net:55964/railway?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC",

                "root",

                "fhjiJURXiGNmtwZvoDieKOnQJYUnPvgN"
            );

        } catch (Exception e) {

            e.printStackTrace();
        }

        return con;
    }
}
