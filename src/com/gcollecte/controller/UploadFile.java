package com.gcollecte.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.gcollecte.model.Permis;
import com.gcollecte.service.PermisService;
import com.gcollecte.model.Cordonnees;
import com.gcollecte.service.CordonneesService;

import com.gcollecte.model.Puits;
import com.gcollecte.service.PuitsService;

import com.gcollecte.model.Image;
import com.gcollecte.service.ImageService;



import com.gcollecte.model.Status;
import com.gcollecte.service.StatusService;


import com.gcollecte.model.Echelle;
import com.gcollecte.service.EchelleService;



import com.gcollecte.model.Document;
import com.gcollecte.service.DocumentService;


import java.io.*;
import java.sql.*;
/**
 * Servlet implementation class UploadFile
 */
@MultipartConfig
public class UploadFile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public UploadFile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Part p1 = request.getPart("file");
		InputStream is = p1.getInputStream();            
		File folder=new File(this.getServletContext().getRealPath("/files"));
		File fout=new File(folder.getAbsolutePath()+File.separatorChar+p1.getName()+".csv");
		 
		     
		FileOutputStream os = new FileOutputStream (fout);
		    int ch = is.read();
		    while (ch != -1) {
		        os.write(ch);
		        ch = is.read();
		    }
			 
			        String csvFilePath = folder.getAbsolutePath()+File.separatorChar+p1.getName()+".csv";
			 
			        try {
			 
			           
			 
			            BufferedReader lineReader = new BufferedReader(new FileReader(csvFilePath));
			            String lineText = null;
			 
			            lineReader.readLine(); // skip header line
			 
			            while ((lineText = lineReader.readLine()) != null) {
			                String[] data = lineText.split(";");
			               
			                
			 Permis p =new Permis(data[1], data[2], Long.valueOf("1"));
			 PermisService ps=new PermisService();
			 ps.addpermis(p);
			 
			
		Cordonnees c=new Cordonnees(Float.valueOf(data[13]),Float.valueOf(data[14]), data[15], data[16]);
			 CordonneesService cc=new CordonneesService();
			 cc.addCordonneess(c);
			 
			 
			 Puits t=new Puits(data[7],data[8], data[6], Long.valueOf("1"),Long.valueOf("1"),Long.valueOf("1"), Long.valueOf("1"), Long.valueOf("1"),Long.valueOf("1"));
			PuitsService tt=new PuitsService();
			 tt.addPuitss(t);
			 
			 
			Image i=new Image(data[20],data[21], data[22]);
			 ImageService ii=new ImageService();
			 ii.addiimage(i) ;
			
		 Status s=new Status(data[12]);
			StatusService ss=new StatusService();
		ss.addStatus(s);	          

			            
		Echelle e=new Echelle(data[23]);
		EchelleService ee=new EchelleService();
		ee.addechelle(e);	       


		Document d=new Document(data[4],data[7], data[8],Float.parseFloat(data[10]),Float.parseFloat(data[11]),Long.parseLong("1"));
		DocumentService dd=new DocumentService();
		dd.addddocument(d);


			            }
			 
			            lineReader.close();
			 
			           
			 
			        } catch (IOException ex) {
			            System.err.println(ex);}
					response.sendRedirect("./inventaire.jsp");
		
	}

}
