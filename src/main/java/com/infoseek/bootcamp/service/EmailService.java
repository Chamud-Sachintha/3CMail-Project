package com.infoseek.bootcamp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.infoseek.bootcamp.dto.EmailDTO;
import com.infoseek.bootcamp.util.Util;

public class EmailService {
	private static Connection connection = Util.getConnection();
	
	public static boolean sendEmail(EmailDTO newEmail) {
		try {
			String sql = "INSERT INTO sent_emails (email_to,subject,message) VALUES (?,?,?)";
			PreparedStatement preStmt = connection.prepareStatement(sql);
			preStmt.setString(1, newEmail.getEmailTo());
			preStmt.setString(2, newEmail.getEmailSubject());
			preStmt.setString(3, newEmail.getEmailMessage());
			
			System.out.println(preStmt);
			preStmt.executeUpdate();
			
			return true;
		}catch(Exception e) {
			return false;
		}
	}
}
