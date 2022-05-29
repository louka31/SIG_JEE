package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Status;
import com.gcollecte.model.User;



public class StatusService {
    public Status getStatusbyStatusId(String StatusId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Status com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Status where Id='"+StatusId+"'");
            com = (Status)query.uniqueResult();
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
    public Status getStatus(String StatusId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Status compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Status where Id='"+StatusId+"'");
            compagne = (Status)query.uniqueResult();
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
    
    
    
    
    
    
    
    
    
    
    
	
    public List<Status> getListOfStatus(){
        List<Status> list = new ArrayList<Status>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Status").list();                        
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
    
    public int getListOfStatuss(){
        List<Status> list = new ArrayList<Status>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Status").list();                        
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
    
    
    
    
    
    
    public int getListOfStatuss1(String productive){
        List<Status> list = new ArrayList<Status>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Status where productive like '"+productive+"%' ").list();                        
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
    
    
    public int getListOfStatuss2(String nonproductive){
        List<Status> list = new ArrayList<Status>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Status where productive like '"+nonproductive+"%' ").list();                        
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
    
    
    
    
    public void addStatus(Status user) {
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
        	String x = "DELETE FROM Status stud WHERE stud.id=:id";
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
