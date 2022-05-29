package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Cordonnees;
import com.gcollecte.model.Projet;
import com.gcollecte.model.User;

public class CordonneesService {
	 public Cordonnees getCordonneesById(String userId) {
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;
	        Cordonnees Cordonnees = null;
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            Query query = session.createQuery("from Cordonnees where id='"+userId+"'");
	            Cordonnees = (Cordonnees)query.uniqueResult();
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return Cordonnees;
	    }
	 public Cordonnees getCordonneesByx(String userId) {
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;
	        Cordonnees Cordonnees = null;
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            Query query = session.createQuery("from Cordonnees where X_m='"+userId+"'");
	            Cordonnees = (Cordonnees)query.uniqueResult();
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return Cordonnees;
	    }
	    
	    public List<Cordonnees> getListOfCordonneess(String userId){
	        List<Cordonnees> list = new ArrayList<Cordonnees>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Cordonnees ").list();                        
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return list;
	    }
	    
	    public List<Cordonnees> getCordonneess(String userId){
	        List<Cordonnees> list = new ArrayList<Cordonnees>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Cordonnees where id='"+userId+"'").list();                        
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return list;
	    }
	    
	    
	    public boolean isUserExists(Cordonnees projet){
		   	 Session session = HibernateUtil.openSession();
		   	 boolean result = false;
		   	 Transaction tx = null;
		   	 try{
		   		 tx = session.getTransaction();
		   		 tx.begin();
		   		 Query query = session.createQuery("from Cordonnees where X_m like '"+projet.getX_m()+"' AND Y_m like '"+projet.getY_m()+"'");
		   		Cordonnees projett = (Cordonnees)query.uniqueResult();
		   		 tx.commit();
		   		 if(projett!=null) result = true;
		   	 }catch(Exception ex){
		   		 if(tx!=null){
		   			 tx.rollback();
		   		 }
		   	 }finally{
		   		 session.close();
		   	 }
		   	 return result;
		   }
	    
	    
	    
	    public boolean addCordonnees(Cordonnees projet){
		   	 Session session = HibernateUtil.openSession();
		   	 if(isUserExists(projet)) return false;	
		   	 else {
		   	 Transaction tx = null;	
		   	 try {
		   		 tx = session.getTransaction();
		   		 tx.begin();
		   		 session.saveOrUpdate(projet);	
		   		 tx.commit();
		   	 } catch (Exception e) {
		   		 if (tx != null) {
		   			 tx.rollback();
		   		 }
		   		 e.printStackTrace();
		   	 } finally {
		   		 session.close();
		   	 }	
		   	 return true;
		   	 }
		   }
	    public boolean addCordonneess(Cordonnees Cordonnees){
		   	 Session session = HibernateUtil.openSession();
		   	// if(isUserExists(Cordonnees)) return false;	
		   	
		   	 Transaction tx = null;	
		   	 try {
		   		 tx = session.getTransaction();
		   		 tx.begin();
		   		 session.saveOrUpdate(Cordonnees);	
		   		 tx.commit();
		   	 } catch (Exception e) {
		   		 if (tx != null) {
		   			 tx.rollback();
		   		 }
		   		 e.printStackTrace();
		   	 } finally {
		   		 session.close();
		   	 }	
		   	 return true;
		   }
 
	   public int nbOfCordonneess(){
	        List<Cordonnees> list = new ArrayList<Cordonnees>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Cordonnees").list();                        
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return list.size();
	    } 
	   public void delete(String userId){
	        
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	        	String x = "DELETE FROM Cordonnees stud WHERE stud.id=:id";
	        	Query query = session.createQuery(x);
	        	query.setParameter("id", Long.valueOf(userId));
	        	int rowCount = query.executeUpdate();
	        	if (rowCount == 0) {
	        	System.out.println("No data found to delete");
	        	} else {
	        	System.out.println("Your record is deleted");
	        	}

	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        
	    }
	   public List<Cordonnees> allCordonneess(){
	        List<Cordonnees> list = new ArrayList<Cordonnees>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Cordonnees").list();                        
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return list;
	    } 
	   
	   public List<Cordonnees> allCCordonneess(){
	        List<Cordonnees> list = new ArrayList<Cordonnees>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Cordonnees WHERE Id not in (SELECT IdCordonnees from Puits)").list();                        
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return list;
	    } 
}
