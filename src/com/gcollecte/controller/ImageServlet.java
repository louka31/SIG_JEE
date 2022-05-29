package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Image;
import com.gcollecte.model.User;
import com.gcollecte.service.ImageService;
import com.gcollecte.service.LoginService;

/**
 * Servlet implementation class UserServlet
 */
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ImageServlet() {
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

		Image u=new Image(request.getParameter("enregistrement"), request.getParameter("top"),request.getParameter("bottom"));
		 try {	
			    ImageService ls=new ImageService();
				 boolean result = ls.addiimage(u);
				 if(result) {
				
					    response.sendRedirect("./Gestionpuits.jsp");
				 }				 else {
					 request.getSession().setAttribute("error", "ok");
					 response.sendRedirect("addimage.jsp?error=ttt");
				 }
				 
			 } finally {		
				 out.close();
			 }
		
		
	    
	}

}
