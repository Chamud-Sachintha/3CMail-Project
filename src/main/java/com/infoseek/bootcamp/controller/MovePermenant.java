package com.infoseek.bootcamp.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoseek.bootcamp.service.EmailService;

@WebServlet("/MovePermenant")
public class MovePermenant extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MovePermenant() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int emailId = Integer.parseInt(request.getParameter("emailId"));
		
		if(EmailService.moveEmailPermenant(emailId) == 0) {
			request.setAttribute("status", "Email Delete Successfully.");
			String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
			
			response.sendRedirect(redirectURL1);
		}else {
			request.setAttribute("status", "Email Delete Not Successfully.");
			String redirectURL1 = "dashboard.jsp?status="+request.getAttribute("status");
			
			response.sendRedirect(redirectURL1);
		}
	}

}
