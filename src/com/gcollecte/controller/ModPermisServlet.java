package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Permis;
import com.gcollecte.service.PermisService;

/**
 * Servlet implementation class ModPermisServlet
 */
public class ModPermisServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModPermisServlet() {
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
				Permis p=new Permis(Long.valueOf(request.getParameter("id")),request.getParameter("ancien_nom"), request.getParameter("nouveau_nom"),Long.valueOf( request.getParameter("idprojet")));
				PermisService ps=new PermisService();
				ps.addpermis(p);
				response.sendRedirect("./Gestionpuits.jsp");
	}

}
