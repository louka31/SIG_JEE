package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gcollecte.model.Status;
import com.gcollecte.service.StatusService;

/**
 * Servlet implementation class UserServlet
 */
public class StatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusServlet() {
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
			Status u=new Status(request.getParameter("productive"));
		    StatusService ls=new StatusService();
		    ls.addStatus(u);
		}
		else if (action.equals("delete"))
		{
			StatusService pss=new StatusService();
			pss.delete(request.getParameter("id"));
		}
		else {
			Status p=new Status(Long.valueOf(request.getParameter("id")),request.getParameter("productive"));
			StatusService ps=new StatusService();
			ps.addStatus(p);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub


}
}
