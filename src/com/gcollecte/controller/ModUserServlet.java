package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Projet;
import com.gcollecte.model.User;
import com.gcollecte.service.LoginService;
import com.gcollecte.service.ProjetService;
import com.gcollecte.service.SimpleMD5Example;

/**
 * Servlet implementation class ModUserServlet
 */
public class ModUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModUserServlet() {
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
		// TODO Auto-generated method stub
		 String password =SimpleMD5Example.cryptage(request.getParameter("password"));

		User p=new User(Long.valueOf(request.getParameter("id")),request.getParameter("nom"), request.getParameter("Role"), request.getParameter("email"), request.getParameter("tel"), request.getParameter("genre"),request.getParameter("prenom"),request.getParameter("userId"), password);
		LoginService ps=new LoginService();
		ps.addprojett(p);
		response.sendRedirect("./users1.jsp");
	}

}
