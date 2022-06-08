package com.infoseek.bootcamp.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
				String sql = "INSERT INTO sent_emails (email_to,subject,message,email_from) VALUES (?,?,?,?)";
				PreparedStatement preStmt = connection.prepareStatement(sql);
				preStmt.setString(1, newEmail.getEmailTo());
				preStmt.setString(2, newEmail.getEmailSubject());
				preStmt.setString(3, newEmail.getEmailMessage());
				preStmt.setString(4, newEmail.getEmailFrom());
				
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
	
	public static List<EmailDTO> getListOfEmails(String email) throws SQLException{
		List<EmailDTO> inboxEmailList = new ArrayList<>();
		
		String sql = "SELECT * FROM sent_emails WHERE email_to = ?";
		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setString(1, email);
		
		ResultSet rs = preStmt.executeQuery();
		while(rs.next()) {
			EmailDTO newEmail = new EmailDTO();
			
			newEmail.setEmailTo(rs.getString(2));
			newEmail.setEmailSubject(rs.getString(3));
			newEmail.setEmailMessage(rs.getString(4));
			newEmail.setEmailFrom(rs.getString(5));
			
			inboxEmailList.add(newEmail);
		}
		
		return inboxEmailList;
	}
	
	public static int saveEmailToDraft(EmailDTO newEmail) {
		int rowCount = 0;
		
		try {
			String sql = "INSERT INTO drafts (email_to,email_from,subject,message) VALUES (?,?,?,?)";
			PreparedStatement preStmt = connection.prepareStatement(sql);
			
			preStmt.setString(1, newEmail.getEmailTo());
			preStmt.setString(2, newEmail.getEmailFrom());
			preStmt.setString(3, newEmail.getEmailSubject());
			preStmt.setString(4, newEmail.getEmailMessage());
			
			preStmt.executeUpdate();
			rowCount = 1;
		}catch(Exception e) {
			rowCount = 0;
		}
		
		return rowCount;
	}
	
	public static List<EmailDTO> getListOfDraftsEmails(String email) throws SQLException{
		List<EmailDTO> draftsEmailList = new ArrayList<>();
		
		String sql = "SELECT * FROM drafts WHERE email_from = ?";
		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setString(1, email);
		
		ResultSet rs = preStmt.executeQuery();
		while(rs.next()) {
			EmailDTO newEmail = new EmailDTO();
			
			newEmail.setEmailTo(rs.getString("email_to"));
			newEmail.setEmailFrom(rs.getString("email_from"));
			newEmail.setEmailSubject(rs.getString("subject"));
			newEmail.setEmailMessage(rs.getString("message"));
			
			draftsEmailList.add(newEmail);
		}
		
		return draftsEmailList;
	}
	
	public static List<EmailDTO> getListOfSentEmails(String email) throws SQLException{
		List<EmailDTO> sentEmailList = new ArrayList<>();
		
		String sql = "SELECT * FROM sent_emails WHERE email_from = ?";
		PreparedStatement preStmt = connection.prepareStatement(sql);
		preStmt.setString(1, email);
		
		ResultSet rs = preStmt.executeQuery();
		while(rs.next()) {
			EmailDTO newEmail = new EmailDTO();
			
			newEmail.setEmailTo(rs.getString("email_to"));
			newEmail.setEmailSubject(rs.getString("subject"));
			newEmail.setEmailMessage(rs.getString("message"));
			newEmail.setEmailFrom(rs.getString("email_from"));
			
			sentEmailList.add(newEmail);
		}
		
		return sentEmailList;
	}
}
