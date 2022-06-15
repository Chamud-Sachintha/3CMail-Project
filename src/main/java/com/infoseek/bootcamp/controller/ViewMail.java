package com.infoseek.bootcamp.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoseek.bootcamp.dto.EmailDTO;
import com.infoseek.bootcamp.service.EmailService;

@WebServlet("/ViewMail")
public class ViewMail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ViewMail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EmailDTO> selectedEmail = EmailService.getEmailById(Integer.parseInt(request.getParameter("emailId")));
		
		String redirectURL1 = "viewMail.jsp?emailTo="+(selectedEmail.get(0).getEmailTo()) + "&subject="+ (selectedEmail.get(0).getEmailSubject())
								+ "&message=" + (selectedEmail.get(0).getEmailMessage()) + "&emailFrom=" + (selectedEmail.get(0).getEmailFrom());
		
		response.sendRedirect(redirectURL1);
	}

}
