package com.infoseek.bootcamp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.infoseek.bootcamp.dto.EmailDTO;
import com.infoseek.bootcamp.util.Util;

public class EmailService {
	private static Connection connection = Util.getConnection();
	
	private static boolean checkEmail(String username) {
		try {
			String checkUser = "SELECT * FROM users WHERE username = ?";
			PreparedStatement preSmt = connection.prepareStatement(checkUser);
			preSmt.setString(1, username);
			
			ResultSet rs = preSmt.executeQuery();
			if(rs.next()) {
				return true;
			}
			else {
				return false;
			}
		}catch (Exception e) {
			return false;
		}
	}
	
	public static int sendEmail(EmailDTO newEmail) {
		int rowCount = 0;
		
		if(checkEmail(newEmail.getEmailTo())) {
			try {
				String sql = "INSERT INTO sent_emails (email_to,subject,message) VALUES (?,?,?)";
				PreparedStatement preStmt = connection.prepareStatement(sql);
				preStmt.setString(1, newEmail.getEmailTo());
				preStmt.setString(2, newEmail.getEmailSubject());
				preStmt.setString(3, newEmail.getEmailMessage());
				
				System.out.println(preStmt);
				preStmt.executeUpdate();
				
				rowCount = 1;
			}catch(Exception e) {
				rowCount = 0;
			}
		}else {
			rowCount = 2; 
		}
		
		return rowCount;
	}
}
