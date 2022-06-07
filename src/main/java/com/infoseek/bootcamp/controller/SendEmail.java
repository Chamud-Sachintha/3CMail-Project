package com.infoseek.bootcamp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoseek.bootcamp.dto.EmailDTO;
import com.infoseek.bootcamp.service.EmailService;

@WebServlet("/SendEmail")
public class SendEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SendEmail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmailDTO newEmail = new EmailDTO();
		
		String emailTo = request.getParameter("emailTo");
		String emailSubject = request.getParameter("emailSubject");
		String emailMessage = request.getParameter("emailMessage");
		
		try {
			newEmail.setEmailTo(emailTo);
			newEmail.setEmailSubject(emailSubject);
			newEmail.setEmailMessage(emailMessage);
			
			if(EmailService.sendEmail(newEmail) == 1) {
				request.setAttribute("status", "Email Sent Successfully.");
				String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
				
				response.sendRedirect(redirectURL1);
			}else if(EmailService.sendEmail(newEmail) == 2) {
				request.setAttribute("status", "Email is Not Sent Because Destination Email is Not Exist.");
				String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
				
				response.sendRedirect(redirectURL1);
			}else {
				request.setAttribute("status", "Email is Not Sent.");
				String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
				
				response.sendRedirect(redirectURL1);
			}
		}catch(Exception e) {
			request.setAttribute("status", "Email is Not Sent.");
			String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
			
			response.sendRedirect(redirectURL1);
		}
	}

}
