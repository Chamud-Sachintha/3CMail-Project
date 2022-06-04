package com.infoseek.bootcamp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.infoseek.bootcamp.dto.UserDTO;
import com.infoseek.bootcamp.util.Util;

public class AuthService {
private static Connection connection = Util.getConnection();
	
	
	public static int saveUserDetails(UserDTO newUser){
		int rowCount = 0;
		try {
			String insert = "INSERT INTO users (username,address,contact_number,pswd) VALUES (?,?,?,?)";
			PreparedStatement preStmt = connection.prepareStatement(insert);
			preStmt.setString(1, newUser.getUsername());
			preStmt.setString(2, newUser.getAddress());
			preStmt.setString(3, newUser.getContactNumber());
			preStmt.setString(4, newUser.getPassword());
			
			System.out.println(preStmt);
			rowCount = preStmt.executeUpdate();
		}catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		
		return rowCount;
	}
	
	public static int loginUser(String username, String password) {
		try {
			String selectUser = "SELECT * FROM users WHERE username = ? AND pswd = ?";
			PreparedStatement preSmt = connection.prepareStatement(selectUser);
			preSmt.setString(1, username);
			preSmt.setString(2, password);
			
			ResultSet rs = preSmt.executeQuery();
			if(rs.next()) {
				return 2;
			}
			else {
				return 0;
			}
		}catch(Exception e){
			System.out.println(e.getMessage());
			return 1;
		}
	}
}
