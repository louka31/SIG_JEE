package com.gcollecte.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Cordonnees;
import com.gcollecte.model.Format;
import com.gcollecte.model.Puits;
import com.gcollecte.service.CordonneesService;
import com.gcollecte.service.FormatService;
import com.gcollecte.service.PuitsService;

/**
 * Servlet implementation class AFFServlet
 */
public class AFFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AFFServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String action=request.getParameter("nom");
		   
		   
		    System.out.println(action);
		    PuitsService ls=new PuitsService();
		    CordonneesService c=new CordonneesService();
		    List<Cordonnees> cc=c.getListOfCordonneess(action);
		    String idc="";
		    for(Cordonnees co:cc) {
		    	if(String.valueOf(co.getX_m()).contains(action)) {
		    		idc=co.getId()+"";
		    	}
		    }
		    System.out.println(idc);
Puits p= ls.getPuitsbyPuitsIdc(idc);
if(p.getId()!=null) {
	String html="Numero :  "+p.getNum()+"    Nom :    "+p.getNom()+"      X :     "+c.getCordonneesById(p.getIdCordonnees()+"").getX_m()+"       Y :   "+c.getCordonneesById(p.getIdCordonnees()+"").getY_m();
	PrintWriter out=response.getWriter();
			out.print(html);
}else {
String html="Erreur";
PrintWriter out=response.getWriter();
		out.print(html);
}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
