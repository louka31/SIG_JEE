package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Projet;
import com.gcollecte.model.User;

public class ProjetService {
	 public Projet getProjetById(String userId) {
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;
	        Projet projet = null;
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            Query query = session.createQuery("from Projet where id='"+userId+"'");
	            projet = (Projet)query.uniqueResult();
	            tx.commit();
	        } catch (Exception e) {
	            if (tx != null) {
	                tx.rollback();
	            }
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return projet;
	    }
	    
	    public List<Projet> getListOfProjets(String userId){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Projet ").list();                        
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
	    
	    public List<Projet> getListOfProjetts(){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Projet ").list();                        
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
	    
	    public List<Projet> getProjets(String userId){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Projet where id='"+userId+"'").list();                        
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
	    public boolean addprojett(Projet projet){
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
	    public boolean addprojet(Projet projet){
	   	 Session session = HibernateUtil.openSession();
	   	
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

	   public boolean isUserExists(Projet projet){
	   	 Session session = HibernateUtil.openSession();
	   	 boolean result = false;
	   	 Transaction tx = null;
	   	 try{
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 Query query = session.createQuery("from Projet where nom='"+projet.getNom()+"'");
	   		Projet projett = (Projet)query.uniqueResult();
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
	   
	   public int nbOfProjets(){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Projet").list();                        
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
	   
	   
	   
	   
	   public int nbOfProjetss(String d){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Projet where date like '"+d+"%'  ").list();                        
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
	        	String x = "DELETE FROM Projet stud WHERE stud.id=:id";
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
	   public List<Projet> allProjets(){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Projet").list();                        
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
