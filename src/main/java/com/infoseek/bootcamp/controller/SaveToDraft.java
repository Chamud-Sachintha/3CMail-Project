package com.infoseek.bootcamp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.infoseek.bootcamp.dto.EmailDTO;
import com.infoseek.bootcamp.service.EmailService;

@WebServlet("/SaveToDraft")
public class SaveToDraft extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveToDraft() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EmailDTO newEmail = new EmailDTO();
		HttpSession session = request.getSession();
		
		String emailTo = request.getParameter("emailTo");
		String emailSubject = request.getParameter("emailSubject");
		String emailMessage = request.getParameter("emailMessage");
		String emailFrom = session.getAttribute("user").toString();
		
		newEmail.setEmailTo(emailTo);
		newEmail.setEmailFrom(emailFrom);
		newEmail.setEmailSubject(emailSubject);
		newEmail.setEmailMessage(emailMessage);
		
		if(EmailService.saveEmailToDraft(newEmail) == 1) {
			request.setAttribute("status", "Email Save to Drafts.");
			String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
			
			response.sendRedirect(redirectURL1);
		}else {
			request.setAttribute("status", "Email Not Save to Drafts.");
			String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
			
			response.sendRedirect(redirectURL1);
		}
	}

}
