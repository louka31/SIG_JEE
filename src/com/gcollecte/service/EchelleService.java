package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Echelle;
import com.gcollecte.model.Format;




public class EchelleService {
    public Echelle getEchellebyEchelleId(String compagneId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Echelle com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Echelle where Id='"+compagneId+"'");
            com = (Echelle)query.uniqueResult();
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
    public Echelle getEchelle(String compagneId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Echelle compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Echelle where Id='"+compagneId+"'");
            compagne = (Echelle)query.uniqueResult();
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
    
    
    
    
    
    
    
    
    
    
    
	
    public List<Echelle> getListOfEchelle(){
        List<Echelle> list = new ArrayList<Echelle>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Echelle").list();                        
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
    
    public int getListOfEchelles(){
        List<Echelle> list = new ArrayList<Echelle>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Echelle").list();                        
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
    public void addechelle(Echelle user) {
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
    public Integer delete(Echelle e){
		 Session session = HibernateUtil.openSession();
	      Transaction tx = null;
	      Integer x = null;
	     
	      try {
	         tx = session.beginTransaction();
	         session.delete(e);
	         if (!tx.wasCommitted())
	        	    tx.commit();
	      } catch (HibernateException ee) {
	         if (tx!=null) tx.rollback();
	         ee.printStackTrace(); 
	      } finally {
	         session.close(); 
	      }
	      return x;
	   }
}
