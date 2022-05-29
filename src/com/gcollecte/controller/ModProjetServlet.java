package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Projet;
import com.gcollecte.service.ProjetService;

/**
 * Servlet implementation class ModProjetServlet
 */
public class ModProjetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModProjetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Projet p=new Projet(Long.valueOf(request.getParameter("id")),request.getParameter("nom"),Long.valueOf(1), request.getParameter("x_min"), request.getParameter("y_min"),request.getParameter("x_max"),request.getParameter("y_max"),request.getParameter("IdCompagne") );
		ProjetService ps=new ProjetService();
		ps.addprojet(p);
		response.sendRedirect("./projet.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
