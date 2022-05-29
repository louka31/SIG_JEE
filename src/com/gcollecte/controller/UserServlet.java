package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.User;
import com.gcollecte.service.LoginService;
import com.gcollecte.service.ProjetService;
import com.gcollecte.service.SimpleMD5Example;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		 String password =SimpleMD5Example.cryptage(request.getParameter("password"));
		User u=new User(request.getParameter("nom"),request.getParameter("role"),request.getParameter("email"),request.getParameter("tel"),request.getParameter("genre"),request.getParameter("userId"), request.getParameter("prenom"),password);
		 try {	
				LoginService ls=new LoginService();
				 boolean result = ls.addprojet(u);
				 if(result) {
				
					 response.sendRedirect("./users1.jsp");				 }
				 else {
					 request.getSession().setAttribute("error", "ok");
					 response.sendRedirect("adduser.jsp?error=ttt");
				 }
				 
			 } finally {		
				 out.close();
			 }
		
		

	    
	}

}
