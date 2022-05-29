package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Echelle;
import com.gcollecte.service.EchelleService;

/**
 * Servlet implementation class UserServlet
 */
public class EchelleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EchelleServlet() {
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
			Echelle e=new Echelle(request.getParameter("nom"));
			EchelleService ls=new EchelleService();
		    ls.addechelle(e);
		   
		}
		else if (action.equals("delete"))
		{
			EchelleService pss=new EchelleService();
			pss.delete(pss.getEchelle(request.getParameter("id")));
		}
		else {
			Echelle p=new Echelle(Long.valueOf(request.getParameter("id")),request.getParameter("nom"));
			EchelleService ps=new EchelleService();
			ps.addechelle(p);
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

}
