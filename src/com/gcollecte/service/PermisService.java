package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Permis;
import com.gcollecte.model.Projet;
import com.gcollecte.model.Puits;
import com.gcollecte.model.User;



public class PermisService {
    public Permis getPermisbyPermisId(String permisId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Permis com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Permis where Id='"+permisId+"'");
            com = (Permis)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return com;
    }
    public Permis getPermis(String permisId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Permis compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Permis where Id='"+permisId+"'");
            compagne = (Permis)query.uniqueResult();
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return compagne;
    }
    
    
    
    public boolean isUserExists(Permis x){
	   	 Session session = HibernateUtil.openSession();
	   	 boolean result = false;
	   	 Transaction tx = null;
	   	 try{
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 Query query = session.createQuery("from Permis where nouveau_nom='"+x.getNouveau_nom()+"'");
	   		Permis projett = (Permis)query.uniqueResult();
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
    
    
    
    public boolean addpermiss(Permis user) {
        Session session = HibernateUtil.openSession();
	   	 if(isUserExists(user)) return false;	
	   	 else {
        Transaction tx = null;
       
        try {
            tx = session.getTransaction();
            tx.begin();
           session.saveOrUpdate(user);
           
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
        return true ;
        }
    }
    
    
    
    
    
	
    public List<Permis> getListOfPermis(){
        List<Permis> list = new ArrayList<Permis>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Permis").list();                        
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
    
   
    
    
	   public int nbOfPermis(String d){
	        List<Projet> list = new ArrayList<Projet>();
	        Session session = HibernateUtil.openSession();
	        Transaction tx = null;        
	        try {
	            tx = session.getTransaction();
	            tx.begin();
	            list = session.createQuery("from Permis where date like '"+d+"%'  ").list();                        
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
	   
	   
	   
    
    public void addpermis(Permis user) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
       
        try {
            tx = session.getTransaction();
            tx.begin();
           session.saveOrUpdate(user);
           
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }
       
    }
    
    public void delete(String Id){
        
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
        	String x= "DELETE FROM Permis stud WHERE stud.id=:id";
        	Query query = session.createQuery(x);
        	query.setParameter("id", Long.valueOf(Id));
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
}
