package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Compagne;
import com.gcollecte.model.Projet;
import com.gcollecte.model.User;



public class CompagneService {
    public Compagne getCompagnebyCompagneId(String compagneId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Compagne com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Compagne where Id='"+compagneId+"'");
            com = (Compagne)query.uniqueResult();
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
    public Compagne getCompagne(String compagneId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Compagne compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Compagne where Id='"+compagneId+"'");
            compagne = (Compagne)query.uniqueResult();
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
    
    
    
    
    
    
    
    
    
    
    
	
    public List<Compagne> getListOfCompagne(){
        List<Compagne> list = new ArrayList<Compagne>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Compagne").list();                        
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
    
    public int getListOfCompagnes(){
        List<Compagne> list = new ArrayList<Compagne>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Compagne").list();                        
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
    public void addcompagne(Compagne user) {
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
    
    public boolean isUserExists(Compagne projet){
	   	 Session session = HibernateUtil.openSession();
	   	 boolean result = false;
	   	 Transaction tx = null;
	   	 try{
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 Query query = session.createQuery("from Compagne where nom='"+projet.getNom()+"'");
	   		Compagne projett = (Compagne)query.uniqueResult();
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
	   
    
    public boolean addcompagnee(Compagne user) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        if(isUserExists(user)) return false;	
	   	 else {
        try {
            tx = session.getTransaction();
            tx.begin();
           session.save(user);
           
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
    public void delete(String Id){
        
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
        	String x = "DELETE FROM Compagne stud WHERE stud.id=:id";
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
