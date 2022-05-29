package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Compagne;
import com.gcollecte.service.CompagneService;


/**
 * Servlet implementation class ModUserServlet
 */
public class ModCompagneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModCompagneServlet() {
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
		Compagne p=new Compagne(Long.valueOf(request.getParameter("id")),request.getParameter("Nom"), request.getParameter("Email"),request.getParameter("Adresse"), request.getParameter("Telephone"));
		CompagneService ps=new CompagneService();
		ps.addcompagne(p);
		response.sendRedirect("./compagne.jsp");
	}

}
