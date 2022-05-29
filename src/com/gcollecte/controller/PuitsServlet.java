package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Puits;
import com.gcollecte.service.PuitsService;

/**
 * Servlet implementation class UserServlet
 */
public class PuitsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PuitsServlet() {
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
	
		Puits u=new Puits(request.getParameter("num"), request.getParameter("nom"),request.getParameter("sigle"),Long.valueOf( request.getParameter("id_fichier")),Long.valueOf( request.getParameter("id_image")),Long.valueOf( request.getParameter("id_cordonnees")),Long.valueOf( request.getParameter("id_permis")),Long.valueOf( request.getParameter("id_status")),Long.valueOf( request.getParameter("id_echelle")));
	
		PuitsService ls=new PuitsService();
	
		boolean X =ls.addPuitss(u);
	    
	    if(X) {
			 request.getSession().setAttribute("success", "ok");
			 response.sendRedirect("Gestionpuits.jsp");
		 }else {
			 request.getSession().setAttribute("error", "ok");
			 response.sendRedirect("addpuits.jsp?error=t");
		 }
		 
	
	

}
}