package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Projet;
import com.gcollecte.model.User;
import com.gcollecte.service.ProjetService;

/**
 * Servlet implementation class ProjetServlet
 */
public class ProjetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProjetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("id")!=null) {
			ProjetService projetService = new ProjetService();
			Projet p=projetService.getProjetById(request.getParameter("id"));
			request.setAttribute("projet", p);
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("modprojet.jsp");
			dispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 PrintWriter out = response.getWriter();
		 String nom = request.getParameter("nom");
		 User user = (User) request.getSession().getAttribute("user");
		 String x_min = request.getParameter("x_min");
		 String x_max = request.getParameter("x_max");
		 String y_min = request.getParameter("y_min");
		 String y_max = request.getParameter("y_max");
		 
		 String IdCompagne = request.getParameter("IdCompagne");
		 System.out.println(nom+","+ x_min+","+ y_min+","+ x_max+","+ y_max+","+user.getId());
		Projet p=new Projet(nom,user.getId(), x_min, y_min, x_max, y_max,IdCompagne);
				
		 try {	
			ProjetService projetService = new ProjetService();
			 boolean result = projetService.addprojett(p);	
			 if(result) {
			
				 response.sendRedirect("projet.jsp");
			 }else {
				 request.getSession().setAttribute("error", "ok");
				 response.sendRedirect("addprojet.jsp?error=ttt");
			 }
			 
		 } finally {		
			 out.close();
		 }
	}

}
