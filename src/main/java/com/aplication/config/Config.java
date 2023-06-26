package com.aplication.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Config {
	private static final String driverName = "com.mysql.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/note_db";
	private static final String userName = "root";
	private static final String passWord = "";
	private static Connection con = null;

	private Config() {

	}

	public static Connection getConnection() {
		try {
			if (con == null) {
				Class.forName(driverName);
				con = DriverManager.getConnection(url, userName, passWord);
				return con;
			}
			return con;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException sql) {
			sql.printStackTrace();
		}

		return null;
	}
}
