package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Cordonnees;
import com.gcollecte.service.CordonneesService;

/**
 * Servlet implementation class UserServlet
 */
public class ModCordonneesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModCordonneesServlet() {
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
	
		Cordonnees u=new Cordonnees(Long.valueOf(request.getParameter("id")),Float.valueOf(request.getParameter("X_m")), Float.valueOf(request.getParameter("Y_m")),request.getParameter("X_deg"),request.getParameter("Y_deg"));
		CordonneesService ls=new CordonneesService();
	    ls.addCordonneess(u);
	    response.sendRedirect("./cordonnees.jsp");
	}

}
