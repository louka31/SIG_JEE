package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Document;
import com.gcollecte.model.Projet;
import com.gcollecte.model.User;
import com.gcollecte.service.DocumentService;
import com.gcollecte.service.ProjetService;

/**
 * Servlet implementation class UserServlet
 */
public class DocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DocumentServlet() {
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
		
			Document u=new Document(request.getParameter("numdoc"),request.getParameter("sigle"),request.getParameter("nom"),Float.valueOf(request.getParameter("tdm")),Float.valueOf(request.getParameter("tdformation")),Long.valueOf( request.getParameter("idformat")));
				
		 try {	
			    DocumentService ls=new DocumentService();
			 boolean result = ls.addddocument(u);
			 if(result) {
			
				 response.sendRedirect("Gestionpuits.jsp");
			 }else {
				 request.getSession().setAttribute("error", "ok");
				 response.sendRedirect("addDocument.jsp?error=ttt");
			 }
			 
		 } finally {		
			 out.close();
		 }
	
	}

}
