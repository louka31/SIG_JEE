
package com.gcollecte.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.util.List;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.gcollecte.model.Projet;
import com.gcollecte.model.User;
import com.gcollecte.service.LoginService;
import com.gcollecte.service.ProjetService;
import com.gcollecte.service.SimpleMD5Example;
import com.google.gson.Gson;

import jdk.nashorn.internal.parser.JSONParser;



public class LoginServlet2 extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		   String  userId = request.getParameter("userId");
		      String   password = request.getParameter("password");
		      password =SimpleMD5Example.cryptage(password);
		    		  
		System.out.println(userId+"***"+password);
		 LoginService loginService = new LoginService();
		 boolean result = loginService.authenticateUser(userId, password);
		 User user = loginService.getUserByUserId(userId);
		// System.out.println(user.getUser_name()+"***"+password);
		 if(result == true){
			
	        
			HttpSession s=request.getSession();
			s.setAttribute("user", user);
				response.sendRedirect("home.jsp");	
		                                               
			
		 }
		 else{
			 response.sendRedirect("erreur.jsp");	
		 }
	
		
	
	 
}


}