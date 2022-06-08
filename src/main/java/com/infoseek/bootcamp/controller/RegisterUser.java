package com.infoseek.bootcamp.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.infoseek.bootcamp.dto.UserDTO;
import com.infoseek.bootcamp.service.AuthService;

@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserDTO newUser = new UserDTO();
		
		String username = request.getParameter("username").replaceAll("\\s", "") + "@3cmail.com";
		String address = request.getParameter("address");
		String contactNumber = request.getParameter("contactNumber");
		String password = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		
		if(password.equals(confPassword)) {
			newUser.setUsername(username);
			newUser.setAddress(address);
			newUser.setContactNumber(contactNumber);
			newUser.setPassword(password);
			
			if(AuthService.saveUserDetails(newUser) == 1) {
				request.setAttribute("status", "Registration Successfully.");
				String redirectURL1 = "register.jsp?status="+request.getAttribute("status");
				
				response.sendRedirect(redirectURL1);
			}else if(AuthService.saveUserDetails(newUser) == 2) {
				request.setAttribute("status", "Username Already Exist.");
				String redirectURL1 = "register.jsp?status="+request.getAttribute("status");
				
				response.sendRedirect(redirectURL1);
			}else {
				request.setAttribute("status", "Registration Not Successfully.");
				String redirectURL1 = "register.jsp?status="+request.getAttribute("status");
				
				response.sendRedirect(redirectURL1);
			}
		}else {
			request.setAttribute("status", "Password Doesn't Match.");
			String redirectURL1 = "register.jsp?status="+request.getAttribute("status");
			
			response.sendRedirect(redirectURL1);
		}
	}

}
