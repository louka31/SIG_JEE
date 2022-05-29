package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Permis;
import com.gcollecte.model.Puits;
import com.gcollecte.service.PermisService;
import com.gcollecte.service.PuitsService;

/**
 * Servlet implementation class UserServlet
 */
public class PermisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PermisServlet() {
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

	    
		Permis u=new Permis(request.getParameter("ancien_nom"), request.getParameter("nouveau_nom"),Long.valueOf( request.getParameter("idprojet")));
		 try {	
		PermisService ls=new PermisService();
	
		boolean X =	ls.addpermiss(u);

	    
	    if(X) {
			 request.getSession().setAttribute("success", "ok");
			 response.sendRedirect("Gestionpuits.jsp");
		 }else {
			 request.getSession().setAttribute("error", "ok");
			 response.sendRedirect("addpermis.jsp?error=t");
		 }
	    
		 } finally {		
			 out.close();
		 }  
	    
	}

}
