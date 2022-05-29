package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Cordonnees;
import com.gcollecte.service.CordonneesService;
import com.gcollecte.service.ProjetService;

/**
 * Servlet implementation class UserServlet
 */
public class CordonneesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CordonneesServlet() {
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
	
		Cordonnees u=new Cordonnees(Float.valueOf(request.getParameter("x_m")), Float.valueOf(request.getParameter("y_m")),request.getParameter("x_deg"),request.getParameter("y_deg"));
		try {	
			CordonneesService ls=new CordonneesService();
			boolean result =  ls.addCordonnees(u);
			 if(result) {

				 response.sendRedirect("cordonnees.jsp");
			 }else {
				 response.sendRedirect("addcordonnees.jsp?error=ttt");
			 }
			 
		 } finally {		
			 out.close();
		 }
	
	}

}
