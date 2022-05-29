package com.gcollecte.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Format;
import com.gcollecte.model.Puits;
import com.gcollecte.service.FormatService;
import com.gcollecte.service.PuitsService;

/**
 * Servlet implementation class UserServlet
 */
public class FormatServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FormatServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action=request.getParameter("methode").trim();
		System.out.println(action);

		if(action.equals("add")) {
			Format u=new Format(request.getParameter("type"));
		    FormatService ls=new FormatService();
		    ls.addFormat(u);
		
		}
		
		
		else if (action.equals("delete"))
		{
			FormatService pss=new FormatService();
			pss.delete(pss.getFormat(request.getParameter("id")));
			
																			
		       
		}
		else {
			Format p=new Format(Long.valueOf(request.getParameter("id")),request.getParameter("type"));
			FormatService ps=new FormatService();
			ps.addFormat(p);
		}
		
		
	}

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
}
