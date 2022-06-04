package com.infoseek.bootcamp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Util {
	
	private static Connection CONNECTION = null;
	private static final String DB_CLASS = "org.postgresql.Driver";
	private static final String DB_URL = "jdbc:postgresql://localhost:5432/infoseek_email";
	private static final String DB_USERNAME = "postgres";
	private static final String DB_PASSWORD = "root";
	
	public static Connection getConnection() {
		try {
			Class.forName(DB_CLASS);
			CONNECTION = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
		}catch(ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return CONNECTION;
	}
}
