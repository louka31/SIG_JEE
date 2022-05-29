package com.gcollecte.service;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.gcollecte.hibernate.util.HibernateUtil;
import com.gcollecte.model.Document;
import com.gcollecte.model.Projet;
import com.gcollecte.model.User;



public class DocumentService {
    public Document getDocumentbyDocumentId(String DocumentId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Document com = null;
        try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Document where Id='"+DocumentId+"'");
            com = (Document)query.uniqueResult();
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
    public Document getDocument(String DocumentId) {
        Session session = HibernateUtil.openSession();
        Transaction tx = null;
        Document compagne=null;
		try {
            tx = session.getTransaction();
            tx.begin();
            Query query = session.createQuery("from Document where Id='"+DocumentId+"'");
            compagne = (Document)query.uniqueResult();
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
    
    
    public boolean isUserExists(Document projet){
	   	 Session session = HibernateUtil.openSession();
	   	 boolean result = false;
	   	 Transaction tx = null;
	   	 try{
	   		 tx = session.getTransaction();
	   		 tx.begin();
	   		 Query query = session.createQuery("from Document where nom='"+projet.getNom()+"'");
	   		Document projett = (Document)query.uniqueResult();
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
    
    
    
    public boolean addddocument(Document projet){
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
    
    
    
    
	
    public List<Document> getListOfDocument(){
        List<Document> list = new ArrayList<Document>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Document").list();                        
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
    
    public int getListOfDocuments(){
        List<Document> list = new ArrayList<Document>();
        Session session = HibernateUtil.openSession();
        Transaction tx = null;        
        try {
            tx = session.getTransaction();
            tx.begin();
            list = session.createQuery("from Document").list();                        
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
    public void addDocument(Document user) {
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
        	String x = "DELETE FROM Document stud WHERE stud.id=:id";
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
