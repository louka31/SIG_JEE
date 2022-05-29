package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Format;
import com.gcollecte.model.User;



public class FormatService {
    public Format getFormatbyFormatId(String FormatId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Format com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Format where Id='"+FormatId+"'");
            com = (Format)query.uniqueResult();
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
    public Format getFormat(String FormatId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Format compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Format where Id='"+FormatId+"'");
            compagne = (Format)query.uniqueResult();
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
    
    
    
    
    
    
    
    
    
    
    
	
    public List<Format> getListOfFormat(){
        List<Format> list = new ArrayList<Format>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Format").list();                        
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
    
    public int getListOfFormats(){
        List<Format> list = new ArrayList<Format>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Format").list();                        
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
    public void addFormat(Format user) {
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
    public Integer delete(Format code){
		 Session session = HibernateUtil.openSession();
	      Transaction tx = null;
	      Integer x = null;
	     
	      try {
	         tx = session.beginTransaction();
	         session.delete(code);
	         if (!tx.wasCommitted())
	        	    tx.commit();
	      } catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	      return x;
	   }
}
