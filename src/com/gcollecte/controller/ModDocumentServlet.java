package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Document;
import com.gcollecte.service.DocumentService;


/**
 * Servlet implementation class ModUserServlet
 */
public class ModDocumentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModDocumentServlet() {
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
		Document p=new Document(Long.valueOf(request.getParameter("id")),request.getParameter("numdoc"),request.getParameter("sigle"),request.getParameter("nom"),Float.valueOf(request.getParameter("tdm")),Float.valueOf(request.getParameter("tdformation")),Long.valueOf( request.getParameter("idformat")));
		DocumentService ps=new DocumentService();
		ps.addDocument(p);
		response.sendRedirect("./Gestionpuits.jsp");
	}

}
