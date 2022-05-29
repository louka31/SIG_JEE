package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Compagne;
import com.gcollecte.service.CompagneService;
import com.gcollecte.service.ProjetService;

/**
 * Servlet implementation class UserServlet
 */
public class CompagneServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompagneServlet() {
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
		 PrintWriter out = response.getWriter();

		Compagne u=new Compagne(request.getParameter("nom"), request.getParameter("email"),request.getParameter("adresse"), request.getParameter("telephone"));
	    
		 try {	
				CompagneService ls=new CompagneService();
				 boolean result =  ls.addcompagnee(u);
				 if(result) {
				
					 response.sendRedirect("compagne.jsp");
				 }else {
					 request.getSession().setAttribute("error", "ok");
					    response.sendRedirect("./addcompagne.jsp?error=t");
				 }
				 
			 } finally {		
				 out.close();
			 }
		 
		 
	   
	}

}
